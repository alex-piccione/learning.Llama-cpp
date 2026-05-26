source common.sh

test_code_file="test_code_1.fs"

### Enable DFlash (draft model to predict tokens)
use_dflash=0
draft_model="Qwen3.5-2B-Q4_K_M.gguf"
#draft_model="Qwen3.5-0.8B-Base-Q4_0.gguf" ## BETTER than instruct model
#draft_model="qwen3.5-0.8b-instruct.gguf"
predict_token=12
#spec-draft-type="f16"  # "q8_0"
#--spec-draft-type-v f16,

cache_type_k="q8_0" # q8_0, tbq4_0, tbq3_0 
cache_type_v="q8_0" # q8_0, tbq4_0, tbq3_0 

# test_models()
test_models() {
    local -n __models=$1   # nameref: array passed by name

    local length=${#__models[@]}

    echo
    echo "${blue}========================================================="
    echo "==============        ${yellow}Test $length models${blue}        =============="
    echo "=========================================================${reset}"

    for model in "${__models[@]}"; do
        echo -e "${blue} • ${white}$model${reset}"
    done

    echo "${blue}=========================================================${reset}"

    local results=()

    local context=8192   ## TODO pass as argument

    for model in "${__models[@]}"; do
        model_result=$(test_model "$model" $context)
        results+=("$model_result")
        echo ""
    done

    echo
    echo "========================================================="
    echo
    printf "| Model                                                        |〰️| Size  | Ctx   | GPU   | Tk/s | Time  |🔨|Pi| Note                                     |\n"

    for result in "${results[@]}"; do
        echo -e "$result"
    done
}


# test_model <model> <ctx>
test_model() {
    local model="$1"
    local context="$2"

    if [ -z "$model" ]; then
        echo "‼️ test_model was called with empty model" >&2
        exit 1
    fi

    echo >&2
    echo "=========================================================" >&2
    echo "TESTING: ${yellow}$model${reset}" >&2
    echo "=========================================================" >&2

    # Start llama.cpp server

    local model_path="$GGUF_FOLDER/$model"
    local draft_model_path="$GGUF_FOLDER/$draft_model"

    # --parallel 1
    # --threads 2 
   #--spec-draft-type-k q8_0 \
   #--spec-draft-type-v q8_0 \
   #--spec-draft-type-k f16 
   #--spec-draft-type-v f16,

    if [[ "$use_dflash" = "1" ]] ; then

        print_value "DFlash" "enabled"
        print_value "Predict model" "$draft_model"
        print_value "Predict Token N" "$predict_token"

        "$LLAMA_BINS_FOLDER/llama-server.exe" \
            --model "$model_path" \
            --spec-draft-model "$draft_model_path" \
            --spec-type draft-simple \
            --spec-draft-n-max $predict_token \
            --spec-draft-type-k q8_0 \
            --spec-draft-type-v q8_0 \
            --host 127.0.0.1 \
            --port "$SERVER_PORT" \
            --n-gpu-layers 999 \
            --ctx-size "$context" \
            --cache-type-k q8_0 \
            --cache-type-v q8_0 \
            --parallel 1 \
            --verbose \
            > logs/llama_server.log 2>&1 &      
    else
        "$LLAMA_BINS_FOLDER/llama-server.exe" \
            --model "$model_path" \
            --host 127.0.0.1 \
            --port "$SERVER_PORT" \
            --n-gpu-layers 999 \
            --ctx-size "$context" \
            --cache-type-k q8_0 \
            --cache-type-v q8_0 \
            --verbose \
            > logs/llama_server.log 2>&1 &     
    fi

    local LLAMA_PID=$!

    # Wait for the server to come alive
    echo -n "Waiting for llama-server to load model..." >&2
    for i in {1..30}; do
        if curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${SERVER_PORT}/health" | grep -q "200"; then
            echo " Ready!" >&2
            break
        fi
        echo -n "." >&2
        sleep 1
    done

    # TODO: capture and print result row
    test_call "$use_dflash"  

    ## Stop the server
    stop_server

    sleep 2
}

# call the model with a pompt that check if the model supports OpenAI tools calling
test_call() {
    local use_dflash="$1"

    for i in {1..60}; do
        if curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${SERVER_PORT}/health" | grep -q "200"; then
            break
        fi

        if [[ $i -eq 1 ]] ; then
            echo -n "Waiting for llama-server to load model..." >&2
        fi

        if [[ $i -eq 60 ]] ; then
            echo " not ready after 180 seconds" >&2
            echo "❌ ERROR: Server is not ready" >&2
            printf "error=Server is not ready\n"
            return 1
        else
            echo -n "." >&2
            sleep 3
        fi
    done
    
    local code_payload=$(cat "$test_code_file")
    
    local run_result=$(run_with_spinner "(llama.cpp RUN)" llamacpp_run "$code_payload" "$use_dflash")

    echo "run_result: $run_result" >&2
    return 1
    # Parse metrics

    local key value
    while IFS='=' read -r key value; do
        if [[ -z "$value" ]]; then
            echo "❌ ERROR: the value for \"$key\" is empty." >&2
            printf "error=the value for key \"${key}\" is empty\n"
            return 1
        fi

        declare "$key=$value"

        # check if it returned an error
        if [[ -n "${error:-}" ]]; then
            echo "❌ ERROR: $error" >&2
            printf "error=%s\n" "$error"
            return 1
        fi

        print_value "$key" "$value"
    done < <(printf '%s\n' "$run_result")

    ########################################
    # 7. Server log insights
    ########################################

    ### TODO: extract context from server log
    #65.53.239.735 D slot update_batch: id  3 | task 17351 | slot decode token, id=248059, n_ctx = 8192, n_tokens = 1385, truncated = 0

    #local ctx_k=$(($context / 1024))
    local ctx_k="?"
    local gpu_info="?"
    local layers_info="?"
    local size_info="?"
    local gpu_pct="?"

    # TODO  look at these values
    # generation: xx tok/s
    # accepted draft tokens: xx%

     ## TODO: moved old logic here: _temp_gpu_info_.sh

    local log="logs/llama_server.log"
    if [[ -f $log ]]; then
    echo "1" >&2
        # Extracts graphic card info
        gpu_info=$(grep -E "CUDA0.*:" "$log" | sed -E 's/.*:\s+(.*)\s+\(.*/\1/' | head -1)
        
        # Extracts "41/41"
        layers_info=$(grep -oE "offloaded [0-9]+/[0-9]+" "$log" | awk '{print $2}' | head -1)

        size_info=$(grep -iE "model size\s*=\s*[0-9.]+\s*(GiB|MiB|GB|MB)" "$log" | grep -oE "[0-9.]+\s*(GiB|MiB|GB|MB)" | head -1)
        if [ -z "$size_info" ]; then
            size_info="?"
        fi
               
        # Calculates offload %
        layers_match=$(grep -oE "offloaded\s+[0-9]+/[0-9]+" "$log" | head -1)
        if [ -n "$layers_match" ]; then
            layers_info=$(echo "$layers_match" | awk '{print $2}')
        else
            # Fallback for explicit layer counting lines
            num_offloaded=$(grep -oE "offloading [0-9]+ repeating layers" "$log" | head -1 | awk '{print $2}')
            total_layers=$(grep -oE "n_layer = [0-9]+" "$log" | head -1 | awk '{print $3}')
            if [ -n "$num_offloaded" ] && [ -n "$total_layers" ]; then
                layers_info="${num_offloaded}/${total_layers}"
            else
                layers_info="?"
            fi
        fi

        if [[ "$layers_info" =~ ([0-9]+)/([0-9]+) ]]; then
            curr="${BASH_REMATCH[1]}"
            total="${BASH_REMATCH[2]}"
            if [ "$total" -gt 0 ]; then
                gpu_pct=$(( curr * 100 / total ))
            else
                gpu_pct="0"
            fi
        else
            gpu_pct="?"
        fi
    fi

    ########################################
    # 8. Debug output
    ########################################

    if [[ "$use_dflash" = "1" ]] ; then
        return_value "draft_model" "$draft_model"
    fi
    #print_value "Draft Model" "$draft_model"
    #print_value "Context" "${ctx_k}k"
    #print_value "Eval time" "$(printf "%.1f s" "$total_duration_s")"
    #print_value "Tokens" "$eval_count"
    #print_value "Speed" "$(printf "%.0f t/s" "$eval_rate")"
    #print_value "GPU info" "$gpu_info"
    #print_value "Layers" "$layers_info"


    return_value "model" "$model"
    return_value "ctx_k" "$ctx_k"
    return_value "size_info" "$size_info"
    return_value "layers_info" "$layers_info"
    return_value "has_tools" "$has_tools"
    return_value "eval_rate" "$eval_rate"
    return_value "has_tools" "$has_tools"
}

# TODO
test_call_print() {

    eval "$(test_call)"

    local tool_flag="❌"
    if [[ $has_tools = "1" ]]; then
        tool_flag="✔️"
    fi

    printf "%s" \
        $cpu_moe

    #| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM   | T/s | Pi | Note                    |  
    #| ---       | ---     | ---- | ---        | ---    | --- | -- | ---                     |  
    #| 999       | 18      | 16 k | q8_0       |        |  16 |    |                         |
    #| 999       | 17      | 32 k | q8_0       |        |   2 |    |                         |   
}

# return "error=... total_duration=... eval_duration=... eval_count=... eval_rate=... has_tools=..."
llamacpp_run() {
    local prompt="$1"
    local use_dflash="$2"

    if [ -z "$prompt" ]; then
        echo "‼️ llamacpp_run_full called with empty prompt" >&2
        exit 1
    fi

    # 1. Build the payload with your exact parameters (OpenAI compatible schema)
    local temperature=0.1
    local max_tokens=2048

    json_payload=$(jq -n \
        --arg code "$prompt" \
        --arg temperature "$temperature" \
        --arg max_tokens "$max_tokens" \
'{
  messages: [
    {
      role: "user",
      content: ("Fix the bug in the bytesToHex function of this code, then execute the corrected script using your available code runner tool to verify it:\n\n" + $code)
    }
  ],
  temperature: ($temperature | tonumber),
  max_tokens: ($max_tokens | tonumber),  
  top_k: 20,
  top_p: 0.8,
  min_p: 0.05,
  repeat_penalty: 1.05,
  repeat_last_n: 256,
  stream: true,
  "stream_options": { "include_usage": true },
  tools: [
    {
      type: "function",
      function: {
        name: "run_code",
        description: "Executes a given script on the local machine environment runner",
        parameters: {
          type: "object",
          properties: {
            language: { type: "string", description: "The programming language, e.g., fsharp" },
            code: { type: "string", description: "The complete corrected script code to execute" }
          },
          required: ["language", "code"]
        }
      }
    }
  ]
}')

    # 2. Query the endpoint with client-side clock tracking
    local raw
    raw=$(curl -s http://localhost:$SERVER_PORT/v1/chat/completions -d "$json_payload")

    # UNCOMMENT THE LINE BELOW TO INSPECT API RAW OUTPUT IN TERMINAL:
    #echo "DEBUG RAW OUTPUT: $raw" >&2
    echo "$raw" > logs/llama_api_response.log

    # last lines in llama_api_response.log
    # data: {"choices":[{"finish_reason":"tool_calls","index":0,"delta":{}}],"created":1779349198,"id":"chatcmpl-nFCxRKKHfmmnVXEHbeKtPcEqHXBZvQCr","model":"Qwen3.5-9B-Q4_K_M.gguf","system_fingerprint":"b9251-e2b129e1b","object":"chat.completion.chunk"}
    # data: {"choices":[],"created":1779349198,"id":"chatcmpl-nFCxRKKHfmmnVXEHbeKtPcEqHXBZvQCr","model":"Qwen3.5-9B-Q4_K_M.gguf","system_fingerprint":"b9251-e2b129e1b","object":"chat.completion.chunk","usage":{"completion_tokens":665,"prompt_tokens":808,"total_tokens":1473,"prompt_tokens_details":{"cached_tokens":804}},"timings":{"cache_n":804,"prompt_n":4,"prompt_ms":128.301,"prompt_per_token_ms":32.07525,"prompt_per_second":31.17668607415375,"predicted_n":665,"predicted_ms":20629.211,"predicted_per_token_ms":31.021369924812028,"predicted_per_second":32.235842660196745,"draft_n":604,"draft_n_accepted":515}}
    # data: [DONE]

    # TODO: comemnted out because not valid for "stream" response
    # Safety Check: Check for llama-server errors
    #if ! local error_msg=$(jq -r '.error.message // .error // empty' <<< "$raw"); then
    #    echo "❌ CRITICAL: jq failed to parse API response" >&2
    #    echo "Raw input that caused failure:" >&2
    #    echo "$raw" | head -c 200 >&2
    #    return 1
    #fi

    #if [ -n "$error_msg" ] && [ "$error_msg" != "null" ]; then
    #    echo "❌ LLAMA.CPP API ERROR: $error_msg" >&2
    #    printf "error=API_Error\n"
    #    return 1
    #fi    

    # Robust space-insensitive streaming line cleaner
    local json_stream=$(echo "$raw" | sed -n 's/^data: *{/{/p')
    if [ -z "$json_stream" ]; then
        echo "❌ ERROR: json_stream is empty from API response" >&2
        printf "error=Failed_to_read_json_stream\n"
        return 1
    fi

    # Stream Extraction (Handles both normal content and Qwen reasoning_content safely)
    local text_response=$(echo "$json_stream" | jq -j 'select(.choices[0] != null) | .choices[0].delta.content // .choices[0].delta.reasoning_content // empty')
           
    # last line, containing timings/metrics
    local final_usage_chunk=$(jq -c 'select(.usage.completion_tokens != null)' <<< "$json_stream" | tail -1)
    if [[ -z "$final_usage_chunk" ]]; then
         echo "❌ ERROR: Failed to extract .usage.completion_tokens from json_stream" >&2
         printf 'error=Failed to extract .usage.completion_tokens n'
         return 1
    fi

    local first_created=$(jq -r 'select(.created != null) | .created' <<< "$json_stream" | head -1)
    local last_created=$(jq -r '.created' <<< "$final_usage_chunk")
    if [[ -z "$first_created" || -z "$last_created" ]]; then
         echo "❌ ERROR: Failed to extract .created from json_stream" >&2
         printf 'error=Failed_to_extract_total_duration\n'
         return 1
    fi
    local total_duration_s=$(( last_created - first_created ))    

    # Extract completion_tokens with error checking
    local eval_count=$(jq -r '.usage.completion_tokens' <<< "$final_usage_chunk")
    if [ -z "$eval_count" ] || [ "$eval_count" = "null" ]; then
        echo "❌ ERROR: Failed to extract .usage.completion_tokens from API response" >&2
        printf "error=Failed_to_extract_completion_tokens\n"
        return 1
    fi

    # Extract predicted_ms with error checking
    local eval_ms=$(jq -r '.timings.predicted_ms' <<< "$final_usage_chunk")
    if [ -z "$eval_ms" ] || [ "$eval_ms" = "null" ]; then
        echo "❌ ERROR: Failed to extract .timings.predicted_ms from API response" >&2
        printf "error=Failed_to_extract_predicted_ms\n"
        return 1
    fi

    # Calculate the TPS
    local eval_s=$(from_ms "$eval_ms")
    local eval_rate=$(float_div "$eval_count" "$eval_s" 6)
      
    local has_tools=0
    local tool_chunks=$(echo "$json_stream" | jq -j 'select(.choices[0] != null) | .choices[0].delta.tool_calls[0].function.arguments // empty')
    if [ -n "$tool_chunks" ]; then
        has_tools=1

        local tool_code=$(jq -r '.code // empty' <<< "$tool_chunks") # set to epmpty means NOT set it

        if [[ ! -n tool_code ]]; then
            echo "❌ ERROR: Failed to extract .code from API response" >&2
            printf "error=FAild to extract .code\n"
            return 1
        fi
    fi

    # 4. Assemble Response
    local response
    if [ -n "$tool_chunks" ]; then
        response="${text_response}${text_response:+$'\n\n'}[EXECUTING TOOL: run_code]\n${tool_chunks}"
    else
        response="$text_response"
    fi
    #print_value "Response" "$response"

    # collect data of memory usage (memory used/free)
    local vram_usage=$(get_readable_VRAM_usage)
    return_value "vram_usage" "$vram_usage"

    return_value "total_duration_s" "$total_duration_s"
    return_value "eval_duration_s" "$eval_s"
    return_value "eval_count" "$eval_count"
    return_value "eval_rate" "$eval_rate"
    return_value "has_tools" "$has_tools"    

    # extract DFlash values 
    local predicted_ms=$(jq -r '.timings.predicted_ms' <<< "$final_usage_chunk")
    if [ -n "$predicted_ms" ]; then
        local predicted_s=$(from_ms "$predicted_ms")

        local predicted_tps=$(jq -r '.timings.predicted_per_second' <<< "$final_usage_chunk")
        if [ -z "$predicted_tps" ] || [ "$predicted_tps" = "null" ]; then
            echo "❌ ERROR: Failed to extract .timings.predicted_per_second from API response" >&2
            printf "error=Failed_to_extract_predicted_tps\n"
            return 1
        fi

        if [[ "$use_dflash" = "1" ]] ; then

            local draft_n=$(jq -r '.timings.draft_n' <<< "$final_usage_chunk")
            local draft_n_accepted=$(jq -r '.timings.draft_n_accepted' <<< "$final_usage_chunk")

            if [ -z "$draft_n" ] || [ "$draft_n" = "null" ]; then
                echo "❌ ERROR: Failed to extract .timings.draft_n from API response" >&2
                printf "error=Failed to extract .timings.draft_n \n"
                return 1
            fi

            if [ -z "$draft_n_accepted" ] || [ "$draft_n_accepted" = "null" ]; then
                echo "❌ ERROR: Failed to extract .timings.draft_n_accepted from API response" >&2
                printf "error=Failed to extract .timings.draft_n_accepted \n"
                return 1
            fi

            local accepted_pct=$(awk -v a="$draft_n_accepted" -v n="$draft_n" 'BEGIN {
                if (n > 0) printf "%.1f\n", (a / n) * 100
                else printf "0.0\n"
            }')
        else
            local accepted_pct="0.0"
        fi

        return_value "predicted_s" "$predicted_s"
        return_value "predicted_tps" "$predicted_tps"
        return_value "accepted_pct" "$accepted_pct"
    fi
}

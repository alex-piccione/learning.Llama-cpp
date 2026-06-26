source common.sh
source server_common.sh

test_code_file="test_code_1.fs"

#--spec-draft-type="f16"  # "q8_0"
#--spec-draft-type-v f16,

cache_type_k="q8_0" # q8_0, tbq4_0, tbq3_0 
cache_type_v="q8_0" # q8_0, tbq4_0, tbq3_0 


# call the model with a pompt that check if the model supports OpenAI tools calling
test_call() {
    debug_function "test_call"
    # TODO... get info from server log and avoid passing this variable
    #local use_prediction="$1"

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

    local run_output=$(run_with_spinner "(llama.cpp RUN)" llamacpp_run "$code_payload")
    return_output_values "$run_output" 1

    local server_output=$(get_info_from_server_log)
    return_output_values "$server_output" 1
}


print_test_call() {
    debug_function "print_test_call"

    ### !!! Rely on the cpu_moe parameter passed to start_server(), because this input is not present in the log
    if [[ ! -v cpu_moe ]]; then
        echo "❌ ERROR: cpu_moe variable not found" >&2
        #printf "error=Server is not ready\n"
        return 1
    fi
    
    local call_output="$(test_call $@)"
    #debug "call_output: $call_output"
    declare_output_values "$call_output" 0

    local tool_flag="❌"
    if [[ $has_tools = "1" ]]; then
        tool_flag="✔️"
    fi

    #printf "------------ ------------ ------------ ------------ ------------ ------------ ------------" >&2    
    #printf "------------ ------------ ------------ ------------ ------------ ------------ ------------\n"   
    print_value "Max context"  "$ctx_train_k k"
    print_value "OpenAI tools compatibility"  "$tool_flag"
    
    
    # fixed values
    local cache_type="--"    

    local vram_used=${vram_usage%%/*}  # %% remove the longhest match from the end of the string, /* matches everything after the first "/"
    local cuda_vram_gb=$(awk "BEGIN{printf \"%.1f\", $cuda_vram/1024}")
    local host_ram_gb=$(awk "BEGIN{printf \"%.1f\", $host_ram/1024}")   

    if [[ "$accepted_pct" != "" && "$accepted_pct" != "--" && "$accepted_pct" != "n.a." ]]; then
        print_value "Accepted prediction %" "$accepted_pct"
        pred_info+=" ($(printf "%.0f" "$accepted_pct")%)"
    fi
    
    printf "| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |\n"
    printf "| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |\n"
    printf "| %3.0f t/s | %3s k | %3s | %5s  | %4.1f GB | %-9s | %-5s | %6s | %3.0fs | %-16s | %-30s | %-12s | %-15s |\n" \
        "$eval_rate" \
        "$ctx_k" \
        "$cpu_moe" \
        "$layers_info" \
        "$vram_used" \
        "$cuda_vram_gb/$host_ram_gb" \
        "$cache_type" \
        "$eval_count" \
        "$total_duration_s" \
        "$pred_type" \
        "$pred_info" \
        "$batch/$ubatch" \
        "" 
}



# return "error=... total_duration=... eval_duration=... eval_count=... eval_rate=... has_tools=..."
llamacpp_run() {
    local prompt="$1"

    if [ -z "$prompt" ]; then
        echo "‼️ llamacpp_run_full called with empty prompt" >&2
        exit 1
    fi

    # 1. Build the payload with your exact parameters (OpenAI compatible schema)
    local temperature=0.1
    local max_tokens=4096

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

    # Robust space-insensitive streaming line cleaner
    local json_stream=$(echo "$raw" | sed -n 's/^data: *{/{/p')
    if [ -z "$json_stream" ]; then
        echo "❌ ERROR: json_stream is empty from API response" >&2
        printf "error=Failed_to_read_json_stream\n"
        return 1
    fi

    # Stream Extraction (Handles both normal content and Qwen reasoning_content safely)
    local text_response=$(echo "$json_stream" | jq -j 'select(.choices[0] != null) | .choices[0].delta.content // .choices[0].delta.reasoning_content // empty' 2>/dev/null)
           
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
    local eval_count=$(jq -r '.usage.completion_tokens' <<< "$final_usage_chunk" 2>/dev/null)
    if [ -z "$eval_count" ] || [ "$eval_count" = "null" ]; then
        echo "❌ ERROR: Failed to extract .usage.completion_tokens from API response" >&2
        printf "error=Failed_to_extract_completion_tokens\n"
        return 1
    fi

    # Extract predicted_ms with error checking
    local eval_ms=$(jq -r '.timings.predicted_ms' <<< "$final_usage_chunk" 2>/dev/null)
    if [ -z "$eval_ms" ] || [ "$eval_ms" = "null" ]; then
        echo "❌ ERROR: Failed to extract .timings.predicted_ms from API response" >&2
        printf "error=Failed_to_extract_predicted_ms\n"
        return 1
    fi

    local predicted_tps=$(jq -r '.timings.predicted_per_second' <<< "$final_usage_chunk" 2>/dev/null)
    if [ -z "$predicted_tps" ] || [ "$predicted_tps" = "null" ]; then
        echo "❌ ERROR: Failed to extract .timings.predicted_per_second from API response" >&2
        printf "error=Failed_to_extract_predicted_tps\n"
        return 1
    fi

    # Calculate the TPS
    local eval_s=$(from_ms "$eval_ms")
    local eval_rate=$(float_div "$eval_count" "$eval_s" 6)
      
    local has_tools=0
    local tool_chunks=$(echo "$json_stream" | jq -j 'select(.choices[0] != null) | .choices[0].delta.tool_calls[0].function.arguments // empty' 2>/dev/null)
    if [ -n "$tool_chunks" ]; then
        has_tools=1

        local tool_code=$(jq -r '.code // empty' <<< "$tool_chunks" 2>/dev/null) # set to epmpty means NOT set it

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

    #data: {"choices":[],"created":1780561441,"id":"chatcmpl-tQCE8GXcHvGYWTBwLbPqLpyuCYh7rEU0","model":"unsloth_GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL.gguf","system_fingerprint":"b9371-f12cc6d0f","object":"chat.completion.chunk","usage":{"completion_tokens":2048,"prompt_tokens":666,"total_tokens":2714,"prompt_tokens_details":{"cached_tokens":0}},"timings":{"cache_n":0,"prompt_n":666,"prompt_ms":4471.659,"prompt_per_token_ms":6.7142027027027025,"prompt_per_second":148.93801159703816,"predicted_n":2048,"predicted_ms":59833.466,"predicted_per_token_ms":29.2155595703125,  "predicted_per_second":34.22833636279737,"draft_n":176,"draft_n_accepted":92}}
    #data: {"choices":[],"created":1780562537,"id":"chatcmpl-AfHMaYacIwtKpzgubMMZ5MbURozImBIV","model":"unsloth_GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL.gguf","system_fingerprint":"b9371-f12cc6d0f","object":"chat.completion.chunk","usage":{"completion_tokens":971 ,"prompt_tokens":666,"total_tokens":1637,"prompt_tokens_details":{"cached_tokens":0}},"timings":{"cache_n":0,"prompt_n":666,"prompt_ms":3928.869,"prompt_per_token_ms":5.899202702702703, "prompt_per_second":169.51443277950983,"predicted_n":971, "predicted_ms":27352.182,"predicted_per_token_ms":28.169085478887745,"predicted_per_second":35.49991002545976}}

    local draft_n=$(jq -r '.timings.draft_n' <<< "$final_usage_chunk" 2>/dev/null)
    local draft_n_accepted=$(jq -r '.timings.draft_n_accepted' <<< "$final_usage_chunk" 2>/dev/null)

    if [[ "$draft_n" != "null" && "$draft_n_accepted" != "null" ]]; then
    #if [[ "${draft_n:null}" != "null" && "${draft_n_accepted:null}" != "null" ]]; then

        #if [ -z "$draft_n" ] || [ "$draft_n" = "null" ]; then
        #    echo "❌ ERROR: Failed to extract .timings.draft_n from API response" >&2
        #    printf "error=Failed to extract .timings.draft_n \n"
        #    return 1
        #fi

        if [ -z "$draft_n_accepted" ] || [ "$draft_n_accepted" = "null" ]; then
            echo "❌ ERROR: Failed to extract .timings.draft_n_accepted from API response" >&2
            printf "error=Failed to extract .timings.draft_n_accepted \n"
            return 1
        fi

        local accepted_pct=$(awk -v a="$draft_n_accepted" -v n="$draft_n" 'BEGIN {
            if (n > 0) printf "%.1f\n", (a / n) * 100
            else printf "0.0\n"
        }')

        #return_value "predicted_s" "$predicted_s"
        #return_value "predicted_tps" "$predicted_tps"
        return_value "accepted_pct" "$accepted_pct"
    else 
        return_value "accepted_pct" "n.a."   
    fi
}

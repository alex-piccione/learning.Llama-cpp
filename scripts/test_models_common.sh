source common.sh

test_code_file="test_code_1.fs"

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

    local context=8192   ## TODO get as argument

    for model in "${__models[@]}"; do
        model_result=$(test_model "$model" $context)
        results+=("$model_result")
        echo ""
    done

    echo
    echo "========================================================="
    echo
    printf "| Model                                                        |〰️| Size  | Ctx  | GPU  | Tk/s | Time  |🔨|Pi| Note                                     |\n"

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

    #    --cache-type-k q8_0 \
    #    --cache-type-v q8_0 \    

    "$LLAMA_BINS_FOLDER/llama-server.exe" \
        --model "$model_path" \
        --host 127.0.0.1 \
        --port "$SERVER_PORT" \
        --n-gpu-layers 999 \
        --ctx-size "$context" \
        --cache-type-k q8_0 \
        --cache-type-v q8_0 \
        > llama_server.log 2>&1 &

    local LLAMA_PID=$!

    # Wait for the server to come alive (up to 30 seconds)
    echo -n "Waiting for llama-server to load model..." >&2
    for i in {1..30}; do
        if curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${SERVER_PORT}/health" | grep -q "200"; then
            echo " Ready!" >&2
            break
        fi
        echo -n "." >&2
        sleep 1
    done

    local code_payload
    code_payload=$(cat "$test_code_file")

    local run_result
    run_result=$(run_with_spinner "(llama.cpp RUN)" llamacpp_run_full "$model" "$code_payload")

    ## Stop the server

    kill "$LLAMA_PID" >/dev/null 2>&1
    wait "$LLAMA_PID" 2>/dev/null
    sleep 2


    # Parse metrics

    local key value
    while IFS='=' read -r key value; do
        declare "$key=$value"
        print_value "$key" "$value"
    done < <(tr ' ' '\n' <<< "$run_result")

    if [[ "$error" ]]; then
        printf "error=%s\n" "$error"
        return
    fi

    ########################################
    # 7. Optional server log insights
    ########################################

    local ctx_k=$(($context / 1024))
    local gpu_info="?"
    local layers_info="?"
    local size_info="?"
    local gpu_pct="?"

    if [[ -f llama_server.log ]]; then
        # Extracts graphic card info
        gpu_info=$(grep -E "CUDA0.*:" llama_server.log | sed -E 's/.*:\s+(.*)\s+\(.*/\1/' | head -1)
        
        # Extracts "41/41"
        layers_info=$(grep -oE "offloaded [0-9]+/[0-9]+" llama_server.log | awk '{print $2}' | head -1)

        size_info=$(grep -iE "model size\s*=\s*[0-9.]+\s*(GiB|MiB|GB|MB)" llama_server.log | grep -oE "[0-9.]+\s*(GiB|MiB|GB|MB)" | head -1)
        if [ -z "$size_info" ]; then
            size_info="?"
        fi
               
        # Calculates offload %
        layers_match=$(grep -oE "offloaded\s+[0-9]+/[0-9]+" llama_server.log | head -1)
        if [ -n "$layers_match" ]; then
            layers_info=$(echo "$layers_match" | awk '{print $2}')
        else
            # Fallback for explicit layer counting lines
            num_offloaded=$(grep -oE "offloading [0-9]+ repeating layers" llama_server.log | head -1 | awk '{print $2}')
            total_layers=$(grep -oE "n_layer = [0-9]+" llama_server.log | head -1 | awk '{print $3}')
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

    print_value "Model" "$model"
    print_value "Context" "${ctx_k}k"
    print_value "Eval time" "$(printf "%.1f s" "$eval_s")"
    print_value "Tokens" "$eval_count"
    print_value "Speed" "$(printf "%.0f t/s" "$eval_rate")"
    print_value "GPU info" "$gpu_info"
    print_value "Layers" "$layers_info"

    ########################################
    # 9. Table row output
    ########################################

    local tool_flag="❌"
    if [[ $has_tools = "1" ]]; then
        tool_flag="✔️"
    fi

    # Swapped columns 3 and 5 to use the newly parsed variables
    printf "| %-60s |%-2s| %-10s | %3s k | %3s %% | %4.0f | %3.0f s |%s|〰️| %-40s |\n" \
        "$model" \
        "✔️" \
        "$size_info" \
        "$ctx_k" \
        "$gpu_pct" \
        "$eval_rate" \
        "$eval_s" \
        "$tool_flag" \
        ""
}


# return "error=... total_duration=... eval_duration=... eval_count=... eval_rate=... has_tools=..."
llamacpp_run_full() {
    local model="$1"
    local prompt="$2"

    if [ -z "$model" ]; then
        echo "‼️ llamacpp_run_full called with empty model" >&2
        exit 1
    fi

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
    local start_time end_time raw
    start_time=$(date +%s.%N)
    raw=$(curl -s http://localhost:$SERVER_PORT/v1/chat/completions -d "$json_payload")
    end_time=$(date +%s.%N)

    # UNCOMMENT THE LINE BELOW TO INSPECT API RAW OUTPUT IN TERMINAL:
    # echo "DEBUG RAW OUTPUT: $raw" >&2
    echo "$raw" > llama_api_response.log

    # Safety Check: Check for llama-server errors
    local error_msg=$(jq -r '.error.message // .error // empty' <<< "$raw" 2>/dev/null)
    if [ -n "$error_msg" ] && [ "$error_msg" != "null" ]; then
        echo -e "\n❌ LLAMA.CPP API ERROR: $error_msg" >&2
        printf "error=API_Error total_duration=0 eval_duration=0 eval_count=0 eval_rate=0 has_tools=0"
        return
    fi

    # Robust space-insensitive streaming line cleaner
    local json_stream=$(echo "$raw" | sed -n 's/^data: *{/{/p')

    local text_response=""
    local tool_code=""
    local eval_count=0
    local eval_ms=""
    local has_tools=0

    if [ -n "$json_stream" ]; then
        # 3. Stream Extraction (Handles both normal content and Qwen reasoning_content safely)
        text_response=$(echo "$json_stream" | jq -j 'select(.choices[0] != null) | .choices[0].delta.content // .choices[0].delta.reasoning_content // empty' 2>/dev/null)
            
        # Extract server-side performance tokens and timings directly from the final chunk
        eval_count=$(echo "$json_stream" | jq -r '.usage.completion_tokens // empty' | tail -n 1 2>/dev/null)
        eval_ms=$(echo "$json_stream" | jq -r '.timings.predicted_ms // empty' | tail -n 1 2>/dev/null)
        
        local tool_chunks=$(echo "$json_stream" | jq -j 'select(.choices[0] != null) | .choices[0].delta.tool_calls[0].function.arguments // empty' 2>/dev/null)
        if [ -n "$tool_chunks" ]; then
            has_tools=1
            tool_code=$(jq -r '.code // empty' <<< "$tool_chunks" 2>/dev/null)
            [ -z "$tool_code" ] && tool_code="$tool_chunks"
        fi
    fi

    # 4. Assemble Response
    local response=""
    if [ -n "$tool_code" ]; then
        response="${text_response}${text_response:+$'\n\n'}[EXECUTING TOOL: run_code]\n${tool_code}"
    else
        response="$text_response"
    fi
    print_value "Response" "$response"

    # 5. Performance Metrics Metrics
    : "${eval_count:=0}"
    local duration_seconds=$(awk "BEGIN {print $end_time - $start_time}")
    local total_duration=$(awk "BEGIN {printf \"%.0f\", $duration_seconds * 1000000000}")
    local eval_duration="$total_duration"

    # If server provided precise timings, use them for 100% accurate token speed
    if [ -n "$eval_ms" ] && [ "$eval_ms" != "null" ]; then
        eval_duration=$(awk "BEGIN {printf \"%.0f\", $eval_ms * 1000000}")
    fi

    local eval_rate=0
    if [ "$eval_duration" -gt 0 ] && [ "$eval_count" -gt 0 ]; then
        eval_rate=$(( eval_count * 1000000000 / eval_duration ))
    fi

    # 6. Format Return Values (Passing along layers_override to your table printer)
    printf "error= total_duration=%s eval_duration=%s eval_count=%s eval_rate=%s has_tools=%s layers=%s" \
        "$total_duration" "$eval_duration" "$eval_count" "$eval_rate" "$has_tools" "$layers_override"
}

llamacpp_run_full+2() {
    local model="$1"
    local prompt="$2"

    if [ -z "$model" ]; then
        echo "‼️ llamacpp_run_full called with empty model" >&2
        exit 1
    fi

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

    # 5. Performance Statistics (100% accurate, collected from the server response)
    if [ jq -e . <<< "$raw" >/dev/null 2>&1 ]; then
        # Plain JSON mode
        eval_count=$(jq -r '.usage.completion_tokens // 0' <<< "$raw")
    else
        # SSE Stream mode (extracts from the final chunk containing stream_options usage)
        eval_count=$(jq -rs 'map(.usage.completion_tokens // empty) | .[0] // 0' <<< "$json_stream")
    fi

    local duration_seconds=$(awk "BEGIN {print $end_time - $start_time}")
    local total_duration=$(awk "BEGIN {printf \"%.0f\", $duration_seconds * 1000000000}")
    local eval_duration="$total_duration" 

    local eval_rate=0
    if [ "$eval_duration" -gt 0 ]; then
        eval_rate=$(( eval_count * 1000000000 / eval_duration ))
    fi


#---


    # 2. Query the endpoint with client-side clock tracking
    local start_time end_time raw
    start_time=$(date +%s.%N)
    raw=$(curl -s http://localhost:8080/v1/chat/completions -d "$json_payload")
    end_time=$(date +%s.%N)

    # Safety Check: Check for llama-server errors
    local error_msg=$(jq -r '.error.message // empty' <<< "$raw")
    if [ -n "$error_msg" ]; then
        echo -e "\n❌ LLAMA.CPP API ERROR: $error_msg" >&2
        printf "error=No llama.cpp tools capability"
        return
    fi

    # Sanitize SSE stream blocks
    local json_stream=$(grep -E '^data: \{' <<< "$raw" | sed 's/^data: //')

    # 3. Extract text dialogue
    local text_response=$(jq -rs 'map(.choices[0].delta.content // "") | join("")' <<< "$json_stream")

    # 4. Extract code chunks from the tool arguments sequence
    local tool_chunks=$(jq -rs 'map(.choices[0].delta.tool_calls[0].function.arguments // "") | join("")' <<< "$json_stream")
    local tool_code=""
    if [ -n "$tool_chunks" ]; then
        tool_code=$(jq -r '.code // ""' <<< "$tool_chunks")
    fi

    # Merge responses for terminal console view
    local response=""
    if [ -n "$tool_code" ]; then
        response="${text_response}${text_response:+$'\n\n'}[EXECUTING TOOL: run_code]\n${tool_code}"
    else
        response="$text_response"
    fi
    print_value "Response" "$response"

    # 5. Check if a tool call occurred
    local has_tools=0
    if [ -n "$tool_code" ]; then
        has_tools=1
    fi

    # 6. Performance Statistics Normalization (Converts client metrics into Ollama Nanoseconds)
    local eval_count=$(jq -rs 'map(.usage.completion_tokens // empty) | .[0] // 0' <<< "$json_stream")
    if [ "$eval_count" -eq 0 ]; then
        # Fallback estimation if stream block usage is omitted
        eval_count=$(echo "$response" | wc -w)
    fi

    # Math calculations converting float seconds directly into nanoseconds integers
    local duration_seconds=$(awk "BEGIN {print $end_time - $start_time}")
    local total_duration=$(awk "BEGIN {printf \"%.0f\", $duration_seconds * 1000000000}")
    local eval_duration="$total_duration" # Match prompt eval vs eval ratios roughly

    local eval_rate=0
    if [ "$eval_duration" -gt 0 ]; then
        eval_rate=$(( eval_count * 1000000000 / eval_duration ))
    fi

    # Output string formatted exactly like Ollama's return signature
    printf "error= total_duration=%s eval_duration=%s eval_count=%s eval_rate=%s has_tools=%s" \
        "$total_duration" "$eval_duration" "$eval_count" "$eval_rate" "$has_tools"
}


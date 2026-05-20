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

    "$LLAMA_BINS_FOLDER/llama-server.exe" \
        --model "$model_path" \
        --host 127.0.0.1 \
        --port "$SERVER_PORT" \
        --ctx-size "$context" \
        --n-gpu-layers 999 \
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


    ########################################
    # 1. Build request payload (OpenAI standard with Tools)
    ########################################
    local temperature=0.1
    local max_tokens=2048

    json_payload=$(jq -n \
        --arg content "$prompt" \
        --arg temperature "$temperature" \
        --arg max_tokens "$max_tokens" \
'{
  messages: [
    {
      role: "user",
      content: $content
    }
  ],
  temperature: ($temperature | tonumber),
  max_tokens: ($max_tokens | tonumber),  
  top_k: 20,
  top_p: 0.8,
  min_p: 0.05,
  repeat_penalty: 1.05,
  repeat_last_n: 256,
  stream: false,
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

 
    ########################################
    # 2. Call llama.cpp server
    ########################################    
    local raw_output=$(curl -s -H "Content-Type: application/json" \
        "http://127.0.0.1:$SERVER_PORT/v1/chat/completions" \
        -w "%{http_code}" \
        -d "$json_payload")

    # Extract the 3-digit status code and the actual JSON body
    local http_code="${raw_output:${#raw_output}-3}"
    local raw="${raw_output:0:${#raw_output}-3}"

    #print_value "raw" $raw

    # Check if the server returned anything other than 200 OK
    if [[ "$http_code" -ne "200" ]]; then
        echo "❌ llama.cpp API ERROR: HTTP Status $http_code" >&2
        echo "Raw Response: $raw" >&2
        printf "error=1 has_tools=0 eval_count=0 eval_rate=0"
        return
    fi

    ########################################
    # 3. Check API error
    ########################################
    local error_msg=$(jq -r '.error // empty' <<< "$raw")
    if [ -n "$error_msg" ]; then
        echo "❌ llama.cpp API ERROR: $error_msg" >&2
        printf "error=1 has_tools=0 eval_count=0 eval_rate=0"
        return
    fi

    ########################################
    # 4. Extract response text
    ########################################
    local response=$(jq -r '.choices[0].message.content // ""' <<< "$raw")
    print_value "Response" "$response"

    ########################################
    # 5. Tool detection
    ########################################
    has_tools=0
    jq -e '.choices[0].message.tool_calls != null' <<< "$raw" >/dev/null && has_tools=1

    # ########################################
    # 6. Performance metrics (Parsed from llama.cpp custom .timings schema)
    # ########################################
    local eval_count=$(jq -r '.timings.predicted_n // .usage.completion_tokens // 0' <<< "$raw")
    local eval_rate=$(jq -r '.timings.predicted_per_second // 0' <<< "$raw")
    local eval_s=$(jq -r 'if .timings.predicted_ms then (.timings.predicted_ms / 1000) else 0 end' <<< "$raw")

    # ########################################
    # 7. Output compact metrics line
    # ########################################
    printf "eval_count=%s eval_rate=%s has_tools=%s eval_s=%s" \
        "$eval_count" \
        "$eval_rate" \
        "$has_tools" \
        "$eval_s"
}


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
    echo "TESTING (llama.cpp): ${yellow}$model${reset}" >&2
    echo "=========================================================" >&2

    ########################################
    # 1. Start llama.cpp server
    ########################################

    local model_path="$GGUF_FOLDER/$model"

    ### TODO
    # [x] --ctx-size is a parameter/argument
    # [x] --n-gpu-layers must be 999
    # [ ] kv-cache-type

    "$LLAMA_BINS_FOLDER/llama-server.exe" \
        --model "$model_path" \
        --host 127.0.0.1 \
        --port "$SERVER_PORT" \
        --ctx-size "$context" \
        --n-gpu-layers 999 \
        --flash-attn \
        > llama_server.log 2>&1 &

    local LLAMA_PID=$!

    sleep 3

    local code_payload
    code_payload=$(cat "$test_code_file")

    local run_result
    run_result=$(run_with_spinner "(llama.cpp RUN)" llamacpp_run_full "$model" "$code_payload")

    kill "$LLAMA_PID" >/dev/null 2>&1
    wait "$LLAMA_PID" 2>/dev/null
    sleep 2

    ########################################
    # Parse metrics
    ########################################

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
    # Derived metrics
    ########################################

    local ctx_k=$(($context / 1024))
    local eval_s
    eval_s=$(from_nano "$eval_duration" 2>/dev/null || echo 0)

    ########################################
    # 7. Optional server log insights
    ########################################

    local gpu_info="?"
    local layers_info="?"

    if [[ -f llama_server.log ]]; then
        gpu_info=$(grep -E "CUDA0.*model buffer size" llama_server.log | tail -1 || true)
        layers_info=$(grep -E "offloaded.*layers" llama_server.log | tail -1 || true)
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

    printf "| %-60s |%-2s| %2s GB | %3s k | %3s %% | %4.0f | %3.0f s |%s|〰️| %-40s |\n" \
        "$model" \
        "✔️" \
        "?" \
        "$ctx_k" \
        "${gpu:-?}" \
        "$eval_rate" \
        "$eval_s" \
        "$tool_flag" \
        "llama.cpp"
}

test_model_2() {

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
    # 6. Derived metrics
    ########################################

    local ctx_k=$((8192 / 1024))
    local eval_s
    eval_s=$(from_nano "$eval_duration" 2>/dev/null || echo 0)

    ########################################
    # 7. Optional server log extraction (GPU insight)
    ########################################

    local gpu_info="?"
    local layers_info="?"

    if [[ -f llama_server.log ]]; then
        gpu_info=$(grep -E "CUDA0.*model buffer size" llama_server.log | tail -1 || true)
        layers_info=$(grep -E "offloaded.*layers" llama_server.log | tail -1 || true)
    fi

    ########################################
    # 8. Output debug info
    ########################################

    print_value "Model" "$model"
    print_value "Context" "${ctx_k}k"
    print_value "Eval time" "$(printf "%.1f s" "$eval_s")"
    print_value "Tokens" "$eval_count"
    print_value "Speed" "$(printf "%.0f t/s" "$eval_rate")"
    print_value "GPU info" "$gpu_info"
    print_value "Layers" "$layers_info"

    ########################################
    # 9. Table row
    ########################################

    local tool_flag="❌"
    if [[ $has_tools = "1" ]]; then
        tool_flag="✔️"
    fi

    printf "| %-60s |%-2s| %2s GB | %3s k | %3s %% | %4.0f | %3.0f s |%s|〰️| %-40s |\n" \
        "$model" \
        "✔️" \
        "?" \
        "$ctx_k" \
        "${gpu:-?}" \
        "$eval_rate" \
        "$eval_s" \
        "$tool_flag" \
        "llama.cpp"
}



test_model_bak() {
    local model="$1"

    if [ -z "$model" ]; then
        echo "‼️ test_model was called with empty model" >&2
        exit 1
    fi

    echo >&2
    echo "=========================================================" >&2
    echo "TESTING (llama.cpp): ${yellow}$model${reset}" >&2
    echo "=========================================================" >&2

    ########################################
    # 1. Load prompt / test file
    ########################################
    local code_payload
    code_payload=$(cat "$test_code_file")

    ########################################
    # 2. Run inference (llama.cpp backend)
    ########################################
    local run_result
    run_result=$(run_with_spinner "(llama.cpp RUN)" llamacpp_run_full "$model" "$code_payload")

    ########################################
    # 3. Parse key/value output
    ########################################
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
    # 4. Extract llama.cpp runtime stats
    ########################################
    # NOTE: llama.cpp does NOT provide ollama-style ps,
    # so we extract GPU info from server startup logs (optional hook)

    local gpu_layers="?"
    local vram_used="?"

    # Try to extract from last server log if available
    if [[ -f llama.log ]]; then
        gpu_layers=$(grep -E "offloaded.*layers" llama.log | tail -1 || true)
        vram_used=$(grep -E "CUDA.*model buffer size" llama.log | tail -1 || true)
    fi

    ########################################
    # 5. Derived metrics
    ########################################
    local ctx_k=$((context / 1024))
    local eval_s
    eval_s=$(from_nano "$eval_duration")

    ########################################
    # 6. Display debug values
    ########################################
    print_value "Model" "$model"
    print_value "Context" "${ctx_k}k"
    print_value "Eval time" "$(printf "%.1f s" "$eval_s")"
    print_value "Tokens" "$eval_count"
    print_value "Speed" "$(printf "%.0f t/s" "$eval_rate")"
    print_value "GPU layers" "$gpu_layers"
    print_value "VRAM info" "$vram_used"

    ########################################
    # 7. Table formatting
    ########################################
    local tool_flag="❌"
    if [[ $has_tools = "1" ]]; then
        tool_flag="✔️"
    fi

    printf "| %-60s |%-2s| %2s GB | %3s k | %-6s | %4.0f | %3.0f s |%s|〰️| %-40s |\n" \
        "$model" \
        "✔️" \
        "?" \
        "$ctx_k" \
        "${gpu:-?}" \
        "$eval_rate" \
        "$eval_s" \
        "$tool_flag" \
        "llama.cpp run"
}


llamacpp_run_full() {
    local model="$1"
    local code_content="$2"

    if [ -z "$model" ]; then
        echo "‼️ llamacpp_run_full called with empty model" >&2
        exit 1
    fi

    if [ -z "$code_content" ]; then
        echo "‼️ llamacpp_run_full called with empty prompt/code" >&2
        exit 1
    fi

    ########################################
    # 1. Build request payload
    ########################################
    json_payload=$(jq -n \
        --arg content "$code_content" \
'{
  messages: [
    {
      role: "user",
      content: $content
    }
  ],
  temperature: 0,
  max_tokens: 300,
  stream: false
}')

    ########################################
    # 2. Call llama.cpp server
    ########################################
    raw=$(curl -s http://127.0.0.1:8001/v1/chat/completions -d "$json_payload")

    ########################################
    # 3. Check API error
    ########################################
    error_msg=$(jq -r '.error // empty' <<< "$raw")
    if [ -n "$error_msg" ]; then
        echo "❌ llama.cpp API ERROR: $error_msg" >&2
        printf "error=1 has_tools=0 eval_count=0 eval_rate=0"
        return
    fi

    ########################################
    # 4. Extract response text
    ########################################
    response=$(jq -r '.choices[0].message.content // ""' <<< "$raw")
    print_value "Response" "$response"

    ########################################
    # 5. Tool detection
    ########################################
    has_tools=0
    jq -e '.choices[0].message.tool_calls != null' <<< "$raw" >/dev/null && has_tools=1

    ########################################
    # 6. Performance metrics
    ########################################
    eval_count=$(jq -r '.usage.completion_tokens // 0' <<< "$raw")
    prompt_eval_count=$(jq -r '.usage.prompt_tokens // 0' <<< "$raw")

    eval_rate=0
    if [ "$eval_count" -gt 0 ]; then
        # llama.cpp does not always expose timing in API response
        # so rate is derived only when server provides timing fields
        total_time=$(jq -r '.usage.total_time // 0' <<< "$raw")

        if [ "$total_time" -gt 0 ]; then
            eval_rate=$(( eval_count * 1000000000 / total_time ))
        fi
    fi

    ########################################
    # 7. Output compact metrics line
    ########################################
    printf "eval_count=%s eval_rate=%s has_tools=%s" \
        "$eval_count" \
        "$eval_rate" \
        "$has_tools"
}


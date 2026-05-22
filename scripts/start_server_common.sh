source common.sh


# start_server 
#   model: the model name
#   ctx_k: context size (8 for 8k, 16 for 16k...) 
#   gpu_layers: max. number of layers to store in VRAM, either an exact number, 'auto', or 'all'
#   cpu_moe: expert layer to offload to ythe CPU, the lower the better (ignored for non-MOE models)  
#   dflash: 0 = Dflash off, 1 = DFlash on 
#   draft_model: draft model, required if DFlash is on
#   predict_token: number of token to predict, required if DFlash is on
#
start_server() {
    local model="$1"
    local ctx_k="$2"
    local gpu_layers="$3"
    local moe_cpu="$4"
    local dflash="$5"
    local draft_model="$6"
    local predict_token="$7"

    if [ -z "$model" ]; then
        echo "‼️ start_server was called with empty model" >&2
        exit 1
    fi

    if [ -z "$ctx_k" ]; then
        echo "‼️ start_server was called with empty ctx_k" >&2
        exit 1
    fi

    if [ -z "$gpu_layers" ]; then
        echo "‼️ start_server was called with empty gpu_layers" >&2
        exit 1
    fi

    if [ -z "$dflash" ]; then
        echo "‼️ start_server was called with empty dflash" >&2
        exit 1
    fi

    print_value "Model" "$model"

    echo >&2
    echo "=========================================================" >&2
    echo "START SERVER WITH MODEL: ${yellow}$model${reset}" >&2
    echo "=========================================================" >&2

    
    local model_path="$GGUF_FOLDER/$model"
    local context=$(($ctx_k * 1024))

    if [[ "$dflash" = "1" ]] ; then

        print_value "DFlash" "on"

        if [ -z "$draft_model" ]; then
            echo "‼️ start_server was called with empty draft_model" >&2
            exit 1
        fi

        if [ -z "$predict_token" ]; then
            echo "‼️ start_server was called with empty predict_token" >&2
            exit 1
        fi

        local draft_model_path="$GGUF_FOLDER/$draft_model"

        # MCP not managed for now

        print_value "Predict model" "$draft_model"
        print_value "Predict Token N" "$predict_token"

        #--spec-draft-type-k q8_0
        #--spec-draft-type-v q8_0
        #--spec-draft-type-k f16 
        #--spec-draft-type-v f16

        "$LLAMA_BINS_FOLDER/llama-server.exe" \
            --host 127.0.0.1 \
            --port "$SERVER_PORT" \
            --model "$model_path" \
            --ctx-size "$context" \
            --n-gpu-layers $gpu_layers \
            --n-cpu-moe $cpu_moe \
            --cache-type-k q8_0 \
            --cache-type-v q8_0 \
            --spec-draft-model "$draft_model_path" \
            --spec-type draft-simple \
            --spec-draft-n-max $predict_token \
            --spec-draft-type-k q8_0 \
            --spec-draft-type-v q8_0 \
            --flash-attn on \
            --parallel 1 \
                --temperature 0.1 \
                --top-k 20 \
                --top-p 0.8 \
                --min-p 0.05 \
                --repeat-penalty 1.05 \
                --repeat-last-n 256 
            > llama_server.log 2>&1 & 
    else

        print_value "DFlash" "off"

        "$LLAMA_BINS_FOLDER/llama-server.exe" \
            --host 127.0.0.1 \
            --port "$SERVER_PORT" \
            --model "$model_path" \
            --ctx-size "$context" \
            --n-gpu-layers $gpu_layers \
            --n-cpu-moe $cpu_moe \
            --cache-type-k q8_0 \
            --cache-type-v q8_0 \
            --flash-attn on \
            --no-mmap \
            --parallel 1 \
                --temperature 0.1 \
                --top-k 20 \
                --top-p 0.8 \
                --min-p 0.05 \
                --repeat-penalty 1.05 \
                --repeat-last-n 256 
            > llama_server.log 2>&1 &   
    fi

    local LLAMA_PID=$!

    # Wait for the server to come alive (up to 30 seconds)
    echo -n "Waiting for llama-server to load model..." >&2
    for i in {1..30}; do
        if curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${SERVER_PORT}/health" | grep -q "200"; then
            echo " Ready!" >&2
            break
        fi
        echo -n "." >&2
        sleep 2
    done
}


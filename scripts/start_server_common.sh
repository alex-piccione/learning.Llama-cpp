source common.sh

## This is called by specific models, look at their .sopecific .md file.

# used memory
# nvidia-smi --query-gpu memory.used --format=csv,noheader | awk '{print $1}'

# Functions
# start_server: used to start Lllama.cpp server
# stop_server: used to stop the Llama.cpp server instance

#---

# start_server 
#   model: the model name
#   ctx_k: context size (8 for 8k, 16 for 16k...) 
#   gpu_layers: max. number of layers to store in VRAM, either an exact number, 'auto', or 'all'
#   cpu_moe: expert layer to offload to the CPU, the lower the better (ignored for non-MOE models)  
#   dflash: 0 = Dflash off, 1 = DFlash on 
#   draft_model: draft model, required if DFlash is on
#   predict_token: number of token to predict, required if DFlash is on
#   mtp: 1 = model support MTP (will set --spec-type draft-mtp) 0 otherwise 
#   jinja: not used... (possibly required by some models)
start_server() {
    local model="$1"
    local ctx_k="$2"
    local gpu_layers="$3"
    local cpu_moe="$4"
    local dflash="$5"
    local draft_model="$6"
    local predict_token="$7"
    local mtp="$8"
    local jinjia="$9"

    
    # stop running server
    stop_server >&2

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

    echo >&2
    echo "=========================================================" >&2
    echo "START SERVER WITH MODEL: ${yellow}$model${reset}" >&2
    echo "=========================================================" >&2
    
    local model_path="$GGUF_FOLDER/$model"
    local context=$(($ctx_k * 1024))

    print_value "Context" "$context"

    ### Set common parameters
        #--draft-min 1            # min tokens to draft before verifying
        #--draft-p-min 0.6 \        # stop drafting if token probability drops below this

    # A good rule: batch-size = 2x your ubatch-size.
    local batch=1024
    local ubatch=$((batch / 2))

    #--defrag-thold 0.1

    local cache_reuse=256        # reuse KV cache chunks across requests (big win for similar prompts)

    args=(
        --host 127.0.0.1 \
        --port "$SERVER_PORT" \
        --model "$model_path" \
        --ctx-size "$context" \
        --parallel 1 \
        --flash-attn on \
        --n-gpu-layers $gpu_layers \
        --n-cpu-moe $cpu_moe \
        --cache-type-k q8_0 \
        --cache-type-v q8_0 \
        --no-mmap \
        --mlock \

        --batch-size $batch \
        --ubatch-size $ubatch \

        --draft-p-min 0.6 \

        --temperature 0.1 \
        --top-k 20 \
        --top-p 0.8 \
        --min-p 0.05 \
        --repeat-penalty 1.05 \
        --repeat-last-n 256 \
        --cache-reuse 256
    )

    # Logging settings
    args+=(--log-verbosity 4) # default is 3, see if this print out the layers


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
            --parallel 1 \
            --flash-attn on \
            --n-gpu-layers $gpu_layers \
            --n-cpu-moe $cpu_moe \
            --cache-type-k q8_0 \
            --cache-type-v tbq4_0 \
            --spec-draft-model "$draft_model_path" \
            --spec-type draft-simple \
            --spec-draft-n-max $predict_token \
            --spec-draft-n-min 1 \
            --draft-p-min 0.6 \
            --spec-draft-type-k q8_0 \
            --spec-draft-type-v q8_0 \
                --temperature 0.1 \
                --top-k 20 \
                --top-p 0.8 \
                --min-p 0.05 \
                --repeat-penalty 1.05 \
                --repeat-last-n 256 \
                > logs/llama_server.log 2>&1 & 

    else

        print_value "DFlash" "off"

        if [ "$mtp" == "1" ] ; then
            print_value "MTP" "yes"
            print_value "Predict token" "$predict_token"
            args+=(--spec-type draft-mtp)
            args+=(--spec-draft-n-max $predict_token)
            args+=(--spec-draft-n-min 1)
        fi

        "$LLAMA_BINS_FOLDER/llama-server.exe" "${args[@]}" \
            > logs/llama_server.log 2>&1 &
    fi

    #local LLAMA_PID=$!

    # Wait for the server to come alive (up to 30 seconds)
    echo -n "Waiting for llama-server to load model..." >&2
    for i in {1..60}; do
        if curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${SERVER_PORT}/health" | grep -q "200"; then
            echo " Ready!" >&2

            local vram_usage=$(get_readable_VRAM_usage)
            echo "VRAM used/total: $vram_usage" >&2

            break
        fi

        if [[ $i -eq 60 ]] ; then
            echo " not ready after 180 seconds" >&2
        else
            echo -n "." >&2
            sleep 3
        fi
    done
}


stop_server() {
    # Find the process ID    
    local PID=$(tasklist | grep "llama-server" | awk '{print $2}' | head -n 1)

    if [ -n "$PID" ]; then
        echo "Killing PID $PID..." >&2

        # TODO:  in run_with_spinenr it uses this:      kill -0 "$pid" 2>/dev/null , try it
        # kill -0 "$PID" 2>/dev/null  ## does not stop the process!!

        taskkill /F /PID "$PID" > /dev/null        
        
        # Check if it is a child of the current shell before waiting
        if ps -p "$PID" > /dev/null ; then
            wait "$PID" > /dev/null
        else
            # It's an orphan or already reaped, just sleep briefly
            sleep 2
        fi
        
        echo "The process \"llama-server\" with PID $PID has been terminated." >&2
    else
        echo "llama-server is not running." >&2
    fi
}
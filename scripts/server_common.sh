source common.sh

## This is called by specific models, look at their specific .md file.

# Functions
# is_server_started: return 0/1
# start_server: used to start Lllama.cpp server
# stop_server: used to stop the Llama.cpp server instance
# extract_info_from_server_log: rertrieve information from the server log


# Array of model patterns of models that should use q4_0 cache
declare -a Q4_QUANTIZATION_MODELS=(
    "Qwen3.5-27B*"
    "Qwen3.6-27B*"
    "Qwen3-Coder-30B*"
)


#---

is_server_started() {
    PROCESS_NAME="llama-server.exe"   # Define the exact name of the executable to look for
    if ps -ef | grep -v grep | grep "$PROCESS_NAME" > /dev/null; then
        return 0
    else
        return 1
    fi
}


server_info() {
    local command=$(ps -ef | grep llama-server | sed 's/ -/\n-/g' | sed 's/^.*\llama-b/"llama-b/')
    echo "$command"
}

# start_server 
#   model: the model name
#   ctx_k: context size (8 for 8k, 16 for 16k...) 
#   gpu_layers: max. number of layers to store in VRAM, either an exact number, 'auto', or 'all'
#   cpu_moe: expert layer to offload to the CPU, the lower the better (ignored for non-MOE models)  
#   spec: Speculative draft. 0=off, 1=on   or use "dflash", "simple", "mtp"
#   draft_model: draft model, required if Speculative draft is on
#   predict_token: number of token to predict, min/max (5/10)
#   mtp: 1 = model support MTP (will set --spec-type draft-mtp) 0 otherwise    [OBSOLETE]
#   jinja: not used... (possibly required by some models)
#   batch: batch size... 1024 is the usual value
start_server() {
    debug_function "start_server"
    local model="$1"
    local ctx_k="$2"
    local gpu_layers="$3"
    local cpu_moe="$4"
    local spec="$5"
    local draft_model="$6"
    local predict_token="$7"
    local jinja="$8"
    local batch="$9"
    local ubatch="${10}"
        
    # stop running server
    stop_server >&2

    if [ -z "$model" ]; then
        echo "‼️ start_server was called with empty model" >&2
        return 1
    fi

    if [ -z "$ctx_k" ]; then
        echo "‼️ start_server was called with empty ctx_k" >&2
        return 1
    fi

    if [ -z "$gpu_layers" ]; then
        echo "‼️ start_server was called with empty gpu_layers" >&2
        return 1
    fi

    if [ -z "$spec" ]; then
        echo "‼️ start_server was called with empty spec" >&2
        return 1
    fi

    echo >&2
    echo "=========================================================" >&2
    echo "START SERVER "
    echo "MODEL:   ${yellow}$model${reset}" >&2
    echo "CONTEXT: ${yellow}$ctx_k k${reset}" >&2
    echo "=========================================================" >&2
    
    local model_path="$GGUF_FOLDER/$model"

    if [ ! -f "$model_path" ]; then
        echo "‼️ File not found: \"$model_path\"" >&2
        return 1
    fi

    local context=$(($ctx_k * 1024))

    local cache_kv=$(set_cache_for_model "$model")

    local cache_type_k=$cache_kv
    local cache_type_v=$cache_kv
    local spec_cache_type_k=$cache_kv
    local spec_cache_type_v=$cache_kv

    # A good rule: batch-size = 2x your ubatch-size.
    if [[ "$ubatch" == "auto" || "$ubatch" == "0" || "$ubatch" == "-1" ]]; then
        ubatch=$((batch / 2))
    fi

    #--defrag-thold 0.1
    #--draft-min 1             # min tokens to draft before verifying
    #--draft-p-min 0.6 \       # stop drafting if token probability drops below this   (default: 0.75)

    #local cache_reuse=256     # reuse KV cache chunks across requests (big win for similar prompts)
    local cache_reuse=0        # 0 to have clean benchmark

    args=(
        --host 127.0.0.1 \
        --port "$SERVER_PORT" \
        --seed "1" \
        --model "$model_path" \
        #--alias 'unsloth/Qwen3.6-27B-MTP-GGUF' \
        --ctx-size "$context" \
        --parallel 1 \
        --prio 3 \
        --flash-attn on \
        --n-gpu-layers $gpu_layers \
        --n-cpu-moe $cpu_moe \
        --kv-unified \
        --cache-type-k $cache_type_k \
        --cache-type-v $cache_type_v \

        --load-mode mmap \
        --fit off \

        --batch-size $batch \
        --ubatch-size $ubatch \

        --draft-p-min 0.7 \
        #--spec-draft-p-min 0.2 
        # --cache-ram 16384
        # --no-mmproj

        #--metrics \
        #--perf \ 

        --temperature 0.1 \
        --top-k 20 \
        --top-p 0.80 \
        --min-p 0.05 \
        --repeat-penalty 1.15 \
        --repeat-last-n 1024 \

        --samplers "penalties;dry;top_k;top_p;min_p;temperature"

        #--dry_multiplier 0.05 \

        --cache-reuse $cache_reuse \

        --context-shift \
        --reasoning-preserve \

        --reasoning on \
        --reasoning-budget 4096 \
        --reasoning-budget-message "... Considering the limited time by the user, I have to give the solution based on the thinking directly now."
    )

    if [[ "$jinja" == "1" ]]; then
        args+=(--jinja)
    fi

    # Logging settings
    args+=(--log-verbosity 4) # default is 3, we need this level to print out the GPU layers

    local pred_type="none" # default value


    if [[ "$spec" = "1" || "$spec" == "simple" || "$spec" == "dflash" || "$spec" == "mtp" ]]; then
        local pred_min
        local pred_max
        # Split the string by '/'
        IFS='/' read -r pred_min pred_max <<< "$predict_token"
        if [[ -z "$pred_min" || -z "$pred_max" ]]; then
            echo "‼️ start_server was called with predict_token that does not follow the format 'min/max'" >&2
            return 1
        fi
    fi

    if [[ "$spec" = "1" || "$spec" == "simple" ]]; then
        # Case A or B: Speculation enabled

        if [[ -n "$draft_model" && "$draft_model" != "none" ]]; then
            # Case A: External Draft Model
            local draft_model_path="$GGUF_FOLDER/$draft_model"
            
            args+=(--spec-type "draft-simple")
            args+=(--spec-draft-model "$draft_model_path")
            args+=(--spec-draft-n-min "$pred_min")
            args+=(--spec-draft-n-max "$pred_max")

            # Configure KV cache type specifically for the draft model
            args+=(--spec-draft-type-k "$spec_cache_type_k")
            args+=(--spec-draft-type-v "$spec_cache_type_v")

            print_value "Speculative type" "Draft model, draft-simple (min: $pred_min, max: $pred_max)"
            print_value "Draft Model" "$draft_model"
        else
            # Case B: Self-speculative decoding (N-Gram)
            args+=(--spec-type "ngram-simple")

            # N (lookup size) = pred_min
            # M (draft size) = pred_max
            args+=(--spec-ngram-simple-size-n "$pred_min")
            args+=(--spec-ngram-simple-size-m "$pred_max")
            args+=(--spec-ngram-simple-min-hits 1)

            print_value "Speculative type" "Internal N-Gram, ngram-simple (size_N: $pred_min, size_M: $pred_max)"
        fi
    elif [[ "$spec" == "draft-simple" ]]; then
        ### TODO: check if draft-simple requires ALWAYS a draft model !!!
        args+=(--spec-type "draft-simple")
        args+=(--spec-draft-model "$draft_model_path")
        args+=(--spec-draft-n-min "$pred_min")
        args+=(--spec-draft-n-max "$pred_max")

        # Configure KV cache type specifically for the draft model
        args+=(--spec-draft-type-k "$spec_cache_type_k")
        args+=(--spec-draft-type-v "$spec_cache_type_v")

        print_value "Speculative type" "Draft model, draft-simple (min: $pred_min, max: $pred_max)"
        print_value "Draft Model" "$draft_model"
 
    elif [[ "$spec" == "dflash" ]]; then

        if [[ -z "$draft_model" ||  "$draft_model" == "none" ]]; then
            echo "‼️ draft_model has to be set with Speculative type DFlash" >&2
            return 1
        fi

        local draft_model_path="$GGUF_FOLDER/$draft_model"
        
        args+=(--spec-type "draft-dflash")
        args+=(--spec-draft-model "$draft_model_path")
        args+=(--spec-draft-n-min "$pred_min")
        args+=(--spec-draft-n-max "$pred_max")

        # Configure KV cache type specifically for the draft model
        args+=(--spec-draft-type-k "$spec_cache_type_k")
        args+=(--spec-draft-type-v "$spec_cache_type_v")

        print_value "Speculative type" "Draft model, draft-dflash (min: $pred_min, max: $pred_max)"
        print_value "Draft Model" "$draft_model"

    elif [[ "$spec" == "mtp" ]]; then
        # Case C: MTP (Only if spec=0)

        if [[ -n "$draft_model" && "$draft_model" != "none" ]]; then
            # Case A: External Draft Model
            local draft_model_path="$GGUF_FOLDER/$draft_model"
            print_value "Draft Model" "$draft_model"

            args+=(--spec-draft-model "$draft_model_path")
        fi
        
        args+=(--spec-type "draft-mtp")
        args+=(--spec-draft-n-min "$pred_min")
        args+=(--spec-draft-n-max "$pred_max")

        print_value "Speculative type" "MTP, draft-mtp (min: $pred_min, max: $pred_max)"
    fi

    # clean log
    echo "" > $SERVER_LOG

    # Start the server and suppress the initial PID notificatoion 
    #{ "$LLAMA_BINS_FOLDER/llama-server.exe" "${args[@]}" \
    #    > logs/llama_server.log 2>&1 & } >/dev/null

    ("$LLAMA_BINS_FOLDER/llama-server.exe" "${args[@]}" \
        > $SERVER_LOG 2>&1 & ) >/dev/null

    #local SERVER_PID=$!
    #wait "$SERVER_PID" 2>/dev/null

    # Disown the background job immediately. 
    # This prevents Bash from printing "[x] Exit 1" when the launcher finishes.
    #disown

    # Wait for the server to come alive (up to 30 seconds)
    echo -n "Waiting for llama-server to load model..." >&2
    for i in {1..60}; do
        if curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${SERVER_PORT}/health" | grep -q "200"; then
            echo "🚀 Ready!" >&2

            #local vram_usage=$(get_readable_VRAM_usage)
            #echo "VRAM used/total: $vram_usage" >&2

            break
        fi

        # check for error
        #local load_failure=$(grep "failed to load model " "$log") # | head -1 | awk -F'=' '{print $2}' | xargs)
        #if [ -n "$load_failure" ]; then
        if grep -q "failed to load model" "$SERVER_LOG"; then
            echo "❌ ERROR: Failed to load model" >&2
            printf "error=Failed to load the model"
            return 1
        fi

        if [[ $i -eq 60 ]] ; then
            echo " not ready after 180 seconds" >&2
            #return 1
        else
            echo -n "." >&2
            sleep 3
        fi
    done
}


stop_server() {
    debug_function "stop_server"
    local PID=$(tasklist | grep "llama-server" | awk '{print $2}' | head -n 1)

    if [ -n "$PID" ]; then

        taskkill /F /PID "$PID" > /dev/null     
        #wait "$PID" > /dev/null   

        # Loop and wait for the process to actually disappear
        # (We cannot use 'wait' because it's not a child of this shell)
        local count=0
        while ps -p "$PID" > /dev/null 2>&1; do
            sleep 0.5
            count=$((count + 1))
            # Safety timeout (e.g., 5 seconds) to avoid infinite loop
            if [ $count -ge 25 ]; then
                echo "Warning: Process $PID did not terminate gracefully." >&2
                break
            fi
        done

        #sleep 3
    fi
}


# usage: local cache_kv=get_cache_for_model "Qwen3.5-27B-UD-Q4_K_M.gguf"
set_cache_for_model() {
    local model="$1"
    
    # Check each pattern
    for pattern in "${Q4_QUANTIZATION_MODELS[@]}"; do
        if [[ "$model" == $pattern ]]; then
            echo "q4_0"
            return 0
        fi
    done
    
    # Default case
    echo "q8_0"
}

## TODO
#check_load_model_fail() {
#        ## TODO: capture this error in the server log
#        ## 0.09.054.775 W llama_init_from_model: context type MTP requested but model doesn't contain MTP layers
#}

extract_info_from_server_log() {
    debug_function "extract_info_from_server_log"
    local log=$SERVER_LOG

    # TODO: extract "Quantized by"
    #0.01.849.268 I llama_model_loader: - kv   6:                       general.quantized_by str              = Unsloth  
    
    # Extract context from server log   
    local ctx=$(grep "llama_context: n_ctx" "$log" | head -1 | awk -F'=' '{print $2}' | xargs)
    if [ "$ctx" -eq "0" ]; then
        echo "❌ ERROR: Failed to extract context size from server log" >&2
        printf "error=FAild to extract context size \n"
        return 1
    fi

    # Extracts the number after "n_ctx_train"
    local ctx_train=$(grep "n_ctx_train" "$log" | head -1 | awk -F'=' '{print $2}' | xargs)
    if [ $ctx -gt $ctx_train ]; then
        echo "WARNING: Context (${ctx}) is greater than training context (${ctx_train})." >&2
    fi

    local ctx_k=$(($ctx / 1024))
    local ctx_train_k=$(($ctx_train / 1024))

    return_value "ctx_k" "$ctx_k"
    return_value "ctx_train_k" "$ctx_train_k"


    # Extracts graphic card info
    local gpu_info=$(grep -E "CUDA0.*:" "$log" | sed -E 's/.*:\s+(.*)\s+\(.*/\1/' | head -1)
    
    # MOE 9 GPU 40
    # 0.03.187.029 I load_tensors: offloading 39 repeating layers to GPU
    # 0.03.187.030 I load_tensors: offloaded 40/49 layers to GPU
    # 
    # MOE 9 GPU -1 
    # 0.03.585.034 I load_tensors: offloading 47 repeating layers to GPU
    # 0.03.585.036 I load_tensors: offloaded 49/49 layers to GPU


    # Extracts layers: GPU_offload/total ("41/41")
    local layers_info=$(grep -oE "offloaded [0-9]+/[0-9]+" "$log" | awk '{print $2}' | head -1)

    # Calculates offload %
    local layers_match=$(grep -oE "offloaded\s+[0-9]+/[0-9]+" "$log" | head -1)
    if [ -n "$layers_match" ]; then
        layers_info=$(echo "$layers_match" | awk '{print $2}')
    else
        # Fallback for explicit layer counting lines
        local num_offloaded=$(grep -oE "offloading [0-9]+ repeating layers" "$log" | head -1 | awk '{print $2}')
        local total_layers=$(grep -oE "n_layer = [0-9]+" "$log" | head -1 | awk '{print $3}')
        if [ -n "$num_offloaded" ] && [ -n "$total_layers" ]; then
            layers_info="${num_offloaded}/${total_layers}"
        else
            layers_info="?"
        fi
    fi

    local gpu_pct="?"
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

    #  Extract exact static buffers (Useful to calculate KV cache overhead later)
    local cuda_vram=$(grep "CUDA0 model buffer size" "$log" | head -1 | awk -F'=' '{print $2}' | awk '{print $1}' )
    local host_ram=$(grep -E "CUDA_Host (model|compute) buffer size" "$log"  | head -1 | awk -F'=' '{print $2}' | awk '{print $1}')
    #[[ -z "$cuda_vram" ]] && local cuda_vram_gb=$(awk "BEGIN{printf \"%.1f\", $cuda_vram/1024}"); return_value "cuda_vram_gb" "$cuda_vram_gb"    
    #[[ -z "$host_ram" ]] && local host_ram_gb=$(awk "BEGIN{printf \"%.1f\", $host_ram/1024}"); return_value "host_ram_gb" "$host_ram_gb"   

    return_value "cuda_vram" "$cuda_vram"    
    return_value "host_ram" "$host_ram"

    # Extract Batch and UBatch parameters
    # 0.15.035.996 I llama_context: n_batch       = 2048
    # 0.15.035.996 I llama_context: n_ubatch      = 1024
    local batch=$(grep "llama_context: n_batch" "$log" | head -1 | sed -E 's/.*n_batch\s*=\s*([0-9]+).*/\1/')
    local ubatch=$(grep "llama_context: n_ubatch" "$log" | head -1 | sed -E 's/.*n_ubatch\s*=\s*([0-9]+).*/\1/')

    return_value "batch" "$batch"
    return_value "ubatch" "$ubatch"

    return_value "layers_info" "$layers_info"

    # TODO: calling "get_pred_info" requires also "return_output_values" ?
    #get_pred_info
    return_output_values "$(get_pred_info)" 1

    # Extract cache quantization
    # I llama_kv_cache: size =  680.00 MiB ( 65536 cells,  10 layers,  1/1 seqs), K (q8_0):  340.00 MiB, V (q8_0):  340.00 MiB
    # [^)]+   everything that is not a closing parenthesis
    # NOTE. Capture only K, assume V = K
    local cache_kv=$(grep -E "llama_kv_cache:.*K \(" "$log" | head -1 | sed -E 's/.* K \(([^)]+)\).*/\1/')
    # "$row" | grep "llama_kv_cache:" | sed -E 's/.* K \(([^)]+)\).*/\1/'
    return_value "cache_kv" "$cache_kv"
}


get_pred_info() {
    debug_function "get_pred_info"
	local pred_type="none"
    local pred_info="--"

    # 0.32.990.479 I statistics     statistics #calls(b,g,a) =    1   1263      0, #gen drafts =      0, #acc drafts =     0, #gen tokens =      0, #acc tokens =     0, dur(b,g,a) = 0.003, 2.524, 0.000 ms
    # 0.14.367.078 I spec common_specu: adding speculative implementation 'ngram-simple'
    local ngram_simple=$(grep -E "I spec common_specu: adding speculative implementation 'ngram-simple'" "$log" | tail -n 1)
    
    if [[ -n $ngram_simple ]]; then
        pred_type="N-gram"

        # b97..
        # 0.10.658.011 I common_speculative_impl_ngram_simple: adding speculative implementation 'ngram-simple'
        # 0.10.658.018 I common_speculative_impl_ngram_simple: - size_n=10, size_m=4, min_hits=1
        # 0.06.214.427 I common_speculative_impl_ngram_simple: - size_n=1, size_m=2, min_hits=1
        #local spec_line=$(grep -E 'common_speculative_impl_ngram_simple.*size_n=.*size_m=.*min_hits=.*' "$log" | tail -n 1)

        #b9937
        # 0.14.367.086 I spec common_specu: - size_n=12, size_m=24, min_hits=1
        local spec_line=$(grep -E 'common_specu:.*size_n=.*size_m=.*min_hits=.*' "$log" | tail -n 1)
        if [[ -n $spec_line ]]; then
            read -r size_n size_m min_hits <<< \
                $(echo "$spec_line" | awk '
                    /size_n=/ {
                        split($0, a, /size_n=|,|size_m=|,|min_hits=/)
                        print a[2], a[4], a[6]
                    }
                ')                
            pred_info=$(printf 'N=%s M=%s min=%s' "$size_n" "$size_m" "$min_hits")

        else
            return_value "error" "found spec type 'ngram-simple' but failed to find its parameters'"
            printf 'ERROR: found spec type "ngram-simple" but failed to find its parameters'
            return 1
        fi
    fi    


    # b9856
    # 0.57.644.917 I spec common_specu: adding speculative implementation 'draft-mtp'
    local draft_mtp=$(grep -E "I spec common_specu: adding speculative implementation 'draft-mtp'" "$log" | tail -n 1)
    
    if [[ -n $draft_mtp ]]; then
        pred_type="MTP"

        # TODO
        # 0.57.644.930 I spec common_specu: - n_max=12, n_min=6, p_min=0.60, n_embd=5120, backend_sampling=1
        # 0.57.644.937 I spec common_specu: - gpu_layers=-1, cache_k=f16, cache_v=f16, ctx_tgt=yes, ctx_dft=yes, devices=[default]
    fi
   
    return_value "pred_type" "$pred_type"  
    return_value "pred_info" "$pred_info" 
}


source common.sh
source server_common.sh

## This script is for start serving specific models for production (minimal log, no monitoring)

args=(
    --host 127.0.0.1 \
    --port "$SERVER_PORT" \
    --parallel 1 \
    --flash-attn on \
    --cache-type-k "q8_0" \
    --cache-type-v "q8_0" \
    --no-mmap \
    --mlock \

    --draft-p-min 0.6 \

    #--defrag-thold 0.1
    #--draft-min 1            # min tokens to draft before verifying
    #--draft-p-min 0.6 \        # stop drafting if token probability drops below this   

    # TODO: minimal ?
    # default is 3, we need this level to print out the GPU layers
    --log-verbosity 2 \

    --temperature 0.1 \
    --top-k 20 \
    --top-p 0.8 \
    --min-p 0.05 \
    --repeat-penalty 1.05 \
    --repeat-last-n 256 \
    --cache-reuse 256
    )


start_server() {

    # stop running server
    stop_server >&2
   
    local model=$1
    local ctx_k
    local gpu_layers
    local cpu_moe
    local batch
    local ubatch
    local spec_type

    local spec_ngram_simple_size_m=48
    local spec_ngram_simple_size_n=12
    local spec_ngram_simple_min_hits=1

    local model_file    
    if [[ "$model" = "barozp_Qwen3.6-28B-REAP20-A3B-Q4_K_M.gguf" ]]; then
        model_file=barozp_Qwen3.6-28B-REAP20-A3B-Q4_K_M.gguf
        ctx_k=128
        gpu_layers=-1
        cpu_moe=6
        batch=2048
        ubatch=256

        spec_type="ngram-simple"

        spec_ngram_simple_size_m=5
        spec_ngram_simple_size_n=8
        spec_ngram_simple_min_hits=1
    fi

    args+=(--model "$GGUF_FOLDER/$model_file")
    args+=(--ctx-size "$(($ctx_k * 1024))")
    args+=(--n-gpu-layers "$gpu_layers")
    args+=(--n-cpu-moe "$cpu_moe")

    args+=(--batch-size $batch)
    args+=(--ubatch-size $ubatch)

    args+=(--spec-type "$spec_type" )

    args+=(--spec-ngram-simple-size-m "$spec_ngram_simple_size_m")
    args+=(--spec-ngram-simple-size-n "$spec_ngram_simple_size_n")
    args+=(--spec-ngram-simple-min-hits "$spec_ngram_simple_min_hits")
                
    
    echo >&2
    echo "=========================================================" >&2
    echo "START SERVER: ${yellow}$model${reset} with ${yellow}$ctx_k K${reset} context" >&2
    echo "=========================================================" >&2
    

    ("$LLAMA_BINS_FOLDER/llama-server.exe" "${args[@]}" \
        > $SERVER_LOG 2>&1 & ) >/dev/null



    # Wait for the server to come alive (up to 30 seconds)
    echo -n "Waiting for llama-server to load model..." >&2
    for i in {1..60}; do
        if curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${SERVER_PORT}/health" | grep -q "200"; then
            echo " Ready!" >&2

            #local vram_usage=$(get_readable_VRAM_usage)
            #echo "VRAM used/total: $vram_usage" >&2

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



__to_be-copied() {

  if [[ "$dflash" = "1" ]] ; then

        # For speculative type:
        # (none, draft-simple, draft-eagle3, draft-mtp, ngram-simple, ngram-map-k, ngram-map-k4v, ngram-mod, ngram-cache)
        # use "draft-simple" when ther is a small draft model
        # use ngram-simple

        if [[ -n "$draft_model" && "$draft_model" != "none" ]]; then
            # Case A: Speculative decoding using a secondary model
            local draft_model_path="$GGUF_FOLDER/$draft_model"
            print_value "Speculation Type" "Draft Model ($draft_model)"
            print_value "Predict token" "$predict_token"            
            args+=(--spec-type "draft-simple")
            args+=(--spec-draft-model "$draft_model_path")
            
            args+=(--spec-draft-n-max "$predict_token")
            args+=(--spec-draft-n-min 1)

            # Configure KV cache type specifically for the draft model
            args+=(--spec-draft-type-k "$spec_cache_type_k")
            args+=(--spec-draft-type-v "$spec_cache_type_v")

            print_value "(test note)" "DFlash, draft-simple predict ${predict_token} (min 1)"
        else
            # Case B: Self-speculative decoding (N-Gram) without a draft model            
            print_value "Speculation Type" "N-Gram simple"
            print_value "Predict token" "$predict_token"
            args+=(--spec-type ngram-simple)

            args+=(--spec-ngram-simple-size-m "$predict_token")  # default is 48
            #args+=(--spec-ngram-simple-size-n "$((predict_token * 2))") # default is 12    
            
            ### FIXED VALUE
            local simple_size_n=8
            args+=(--spec-ngram-simple-size-n $simple_size_n) # default is 12            
            args+=(--spec-ngram-simple-min-hits 1)               # default is 1   

            print_value "(test note)" "DFlash, ngram-simple, predict (size_m: $predict_token, size_n: $simple_size_n)"
        fi
    else
        if [ "$mtp" == "1" ]; then
            # Case B: Self-speculative decoding (MTP)
            print_value "MTP" "on"
            print_value "Speculation Type" "MTP"
            print_value "Predict token" "$predict_token"            
            args+=(--spec-type draft-mtp)

            args+=(--spec-draft-n-max $predict_token)
            args+=(--spec-draft-n-min 1)

            print_value "(test note)" "DFlash, draft-mtp, predict ${predict_token}/1"
        fi
    fi

}

source common.sh
source server_common.sh

## This script starts serving specific models for production (minimal log, no monitoring)

# Usage: 
# use subshell to temporary use source file (avoiding override functions)
# (source "$LLAMACPP_SCRIPTS_DIRECTORY/start_server_prod.sh"; start_server)

#models_config_file="$(dirname $0)/models_config.yaml"
models_config_file="models_config.yaml"
#path="$(dirname $BASH_SOURCE[1])"  # this works but we need to be in this folder anyway because of the previous sourcing (common.sh)
#models_config_file="$path/models_config.yaml"

if [[ ! -f "$models_config_file" ]]; then
    echo "File \"$models_config_file\" not found"
    exit 1
fi


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
    --log-verbosity 3 \

    # this should avoid the values sent by Agent code tool
    --samplers "top_k;min_p;temperature"

    --temperature 0.1 \
    --top-k 20 \
    --top-p 0.8 \
    --min-p 0.05 \
    --repeat-penalty 1.05 \
    --repeat-last-n 256 \
    --cache-reuse 256
    )


start_server() {
    local model_id="${1:-}"

    # 1. If no model ID provided, show a selection menu
    if [[ -z "$model_id" ]]; then
        echo "Select a model:"      
        # Extract keys from YAML
        local models_list
        local win_path=$(cygpath -w "$models_config_file") # yq is a .exe
        models_list=$(yq '.models | keys | .[]' "$win_path")
       
        # Check if list is empty
        if [[ -z "$models_list" ]]; then
            echo "Error: No models found in $models_config_file"
            exit 1
        fi

        # Create a dictionary indicating if file exists
        #declare files
        local -A file_exists
        files=$(yq '.models[].file' "$win_path")
        for file in "$files"; do
            if [[ -f "$file" ]]; then
                file_exists["$file"]=1
            else
                file_exists["$file"]=0
            fi
        done

        # Create an array for the select loop
        local -a choices
        while IFS= read -r model_id; do
            local file=$(yq -e ".models[\"$model_id\"].file" "$models_config_file")
            if [[ -f  "$GGUF_FOLDER/$file" ]]; then exist="🟢"; else exist="🔴"; fi
            choices+=("$model_id $exist")  # concatenate
        done <<< "$models_list"

        # Show the menu
        PS3="Please enter the model number to start (or Ctrl+C to quit): "
        select choice in "${choices[@]}"; do
            if [[ -n "$choice" ]]; then
                #model_id="$choice"
                model_id=${choice%% *} # remove suffix (exists)
                echo "$model_id"
                break
            else
                echo "Invalid selection. Please try again."
            fi
        done
        
        # If user pressed Ctrl+C during select, $model_id will be empty
        if [[ -z "$model_id" ]]; then
            echo "Aborted by user."
            return 0
        fi
    fi


    if ! yq -e ".models[\"$model_id\"]" "$models_config_file" > /dev/null 2>&1; then
        echo "Error: Model '$model_id' not found in $models_config_file"
        echo "Available models: $(yq '.models | keys | .[]' $models_config_file | tr '\n' ' ')"
        return 1
    fi

    debug "Loading configuration for '$model_id'"

    # Dynamically load variables
    # This loop reads every key from the YAML and creates a bash variable with that name
    for key in $(yq ".models[\"$model_id\"] | keys | .[]" $models_config_file); do
        # Get the value (yq outputs strings with quotes, we strip them)
        val=$(yq ".models[\"$model_id\"].$key" $models_config_file)
        
        print_value "$key" "$val"

        #eval "$key=$val"
        declare "$key=$val"

        # (Alternative): Using printf to avoid quoting issues if val has spaces
        # declare "$(printf '%s=%s' "$key" "$val")"
    done

    # stop running server
    stop_server >&2   

    local ctx_k
    local gpu_layers
    local cpu_moe
    local batch
    local ubatch
    local spec_type

    # defaults
    local spec_draft_n_max="3"
    local spec_draft_n_min="1"
    local spec_cache_type_k="q8_0"
    local spec_cache_type_v="q8_0"

    local spec_ngram_simple_size_m=48
    local spec_ngram_simple_size_n=12
    local spec_ngram_simple_min_hits=1

    local model_file=$GGUF_FOLDER/$file  

    if [[ ! -f "$model_file" ]]; then
        echo -e "❌ File \"$model_file\" not found!"
        return 1
    fi

    args+=(--model "$model_file")
    args+=(--ctx-size "$(($ctx_k * 1024))")
    args+=(--n-gpu-layers "$gpu_layers")
    args+=(--n-cpu-moe "$cpu_moe")

    args+=(--batch-size $batch)
    args+=(--ubatch-size $ubatch)

    args+=(--spec-type "$spec_type" )

    # for DFlash
    args+=(--spec-draft-n-max "$spec_draft_n_max")
    args+=(--spec-draft-n-min "$spec_draft_n_min")
    args+=(--spec-draft-type-k "$spec_cache_type_k")
    args+=(--spec-draft-type-v "$spec_cache_type_v")
    
    # for N-Gram
    args+=(--spec-ngram-simple-size-m "$spec_ngram_simple_size_m")
    args+=(--spec-ngram-simple-size-n "$spec_ngram_simple_size_n")
    args+=(--spec-ngram-simple-min-hits "$spec_ngram_simple_min_hits")
                
    
    echo >&2
    echo "=========================================================" >&2
    echo "START SERVER: ${yellow}$model_file${reset} with ${yellow}$ctx_k K${reset} context" >&2
    echo "=========================================================" >&2    

    ("$LLAMA_BINS_FOLDER/llama-server.exe" "${args[@]}" \
        > $SERVER_LOG 2>&1 & ) >/dev/null


    # Wait for the server to come alive (up to 30 seconds)
    echo -n "Waiting for llama-server to load model..." >&2
    for i in {1..60}; do
        if curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${SERVER_PORT}/health" | grep -q "200"; then
            echo " Ready! 🚀" >&2

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

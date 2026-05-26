
    if [[ -f llama_server.log ]]; then
        # Extracts graphic card info
        echo "Extracts graphic card info" >&2
        gpu_info=$(grep -E "CUDA0.*:" logs/llama_server.log | sed -E 's/.*:\s+(.*)\s+\(.*/\1/' | head -1)
        
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

    if [[ "$use_dflash" = "1" ]] ; then
        print_value "Draft Model" "$draft_model"
    fi
    #print_value "Draft Model" "$draft_model"
    #print_value "Context" "${ctx_k}k"
    print_value "Eval time" "$(printf "%.1f s" "$total_duration_s")"
    print_value "Tokens" "$eval_count"
    print_value "Speed" "$(printf "%.0f t/s" "$eval_rate")"
    print_value "GPU info" "$gpu_info"
    print_value "Layers" "$layers_info"

#----------------------------------------------------------


#### to be tested:



    if [[ -f llama_server.log ]]; then

        # 2. Extract GPU Name (Fixed path from logs/llama_server.log to llama_server.log)
        gpu_info=$(grep -E "CUDA0.*:" llama_server.log | sed -E 's/.*:\s+(.*)\s+\(.*/\1/' | head -1)
        [[ -z "$gpu_info" ]] && gpu_info="?"

        # 3. Extract exact static buffers (Useful to calculate KV cache overhead later)
        cuda_vram=$(grep -E "CUDA0 model buffer size" llama_server.log | grep -oE "[0-9.]+\s*MiB" | head -1)
        host_ram=$(grep -E "CUDA_Host model buffer size" llama_server.log | grep -oE "[0-9.]+\s*MiB" | head -1)
        [[ -z "$cuda_vram" ]] && cuda_vram="0 MiB"
        [[ -z "$host_ram" ]] && host_ram="0 MiB"

        # 4. Extract layer offload string (e.g., "53/53")
        layers_match=$(grep -oE "offloaded\s+[0-9]+/[0-9]+" llama_server.log | head -1)
        if [ -n "$layers_match" ]; then
            layers_info=$(echo "$layers_match" | awk '{print $2}')
        else
            # Smart fallback matching your original logic
            num_offloaded=$(grep -oE "offloading [0-9]+ repeating layers" llama_server.log | head -1 | awk '{print $2}')
            total_layers=$(grep -oE "n_layer = [0-9]+" llama_server.log | head -1 | awk '{print $3}')
            if [ -n "$num_offloaded" ] && [ -n "$total_layers" ]; then
                layers_info="${num_offloaded}/${total_layers}"
            else
                layers_info="?"
            fi
        fi

        # 5. Calculate GPU Offload Percentage
        if [[ "$layers_info" =~ ([0-9]+)/([0-9]+) ]]; then
            curr="${BASH_REMATCH[1]}"
            total="${BASH_REMATCH[2]}"
            [[ "$total" -gt 0 ]] && gpu_pct=$(( curr * 100 / total )) || gpu_pct="0"
        else
            gpu_pct="?"
        fi
    fi

    ########################################
    # 8. Debug output
    ########################################

    if [[ "$use_dflash" = "1" ]] ; then
        print_value "Draft Model" "$draft_model"
    fi

    print_value "Eval time" "$(printf "%.1f s" "$total_duration_s")"
    print_value "Tokens" "$eval_count"
    print_value "Speed" "$(printf "%.0f t/s" "$eval_rate")"
    print_value "GPU info" "$gpu_info"
    print_value "Layers" "$layers_info ($gpu_pct%)"
    print_value "Static VRAM" "$cuda_vram"
    print_value "Static RAM" "$host_ram"

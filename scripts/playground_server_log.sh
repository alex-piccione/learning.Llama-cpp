#### ---- Prediction info

log="logs/llama_server (ngram).log"

pred_info() {
    
	local pred_type="none"
    local pred_info="--"

    # 0.32.990.479 I statistics     statistics #calls(b,g,a) =    1   1263      0, #gen drafts =      0, #acc drafts =     0, #gen tokens =      0, #acc tokens =     0, dur(b,g,a) = 0.003, 2.524, 0.000 ms
    local ngram_simple=$(grep -E 'I statistics.*ngram-simple:' "$log" | tail -n 1)
    
    if [[ -n $ngram_simple ]]; then
        pred_type="DFlash (N-gram)"

        # 0.10.658.011 I common_speculative_impl_ngram_simple: adding speculative implementation 'ngram-simple'
        # 0.10.658.018 I common_speculative_impl_ngram_simple: - size_n=10, size_m=4, min_hits=1
        local spec_line=$(grep -E 'common_speculative_impl_ngram_simple.*size_n=.*size_m=4.*min_hits=1' "$log" | tail -n 1)
        if [[ -n $spec_line ]]; then
            read -r size_n size_m min_hits <<< \
                $(echo "$spec_line" | awk '
                    /size_n=/ {
                        split($0, a, /size_n=|,|size_m=|,|min_hits=/)
                        print a[2], a[4], a[6]
                    }
                ')
            pred_info=$(printf 'size_n=%s size_m=%s min_hits=%s\n' "$size_n" "$size_m" "$min_hits")

        else
            printf 'ERROR: found spec type "ngram-simple" but failed to find its parameters'
        fi
    fi

    
    printf "pred_type=%s\n" "$pred_type"
    printf "pred_info=%s\n" "$pred_info"
}

pred_info
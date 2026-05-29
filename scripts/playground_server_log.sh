
#### ---- Prediction info

log="llama_server.log"

pred_info() {
    # 0.32.990.479 I statistics     statistics #calls(b,g,a) =    1   1263      0, #gen drafts =      0, #acc drafts =     0, #gen tokens =      0, #acc tokens =     0, dur(b,g,a) = 0.003, 2.524, 0.000 ms
   if grep -qE 'ngram-simple:.*I statistics|I statistics.*ngram-simple:' "$log_file"; then
       printf "Pred type: DFlash (N-gram)" 
   fi

    #local ngram_simple=$(grep "llama_context: n_batch" "$log" | head -1)
    #if [[ -z "$ngram_simple" ]]; then
    #    printf "Pred type: DFlash (N-gram)" 
    #fi
    #local ubatch=$(grep "statistics  statistics" "$log" | head -1 | sed -E 's/.*n_ubatch\s*=\s*([0-9]+).*/\1/')
}

pred_info()
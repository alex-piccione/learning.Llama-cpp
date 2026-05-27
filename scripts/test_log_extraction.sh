log_string=$(cat <<'EOF'
0.15.035.996 I llama_context: n_batch       = 2048
0.15.035.996 I llama_context: n_ubatch      = 1024
EOF
)


log="logs/llama_server.log"

### TODO
# Extract Batch and UBatch parameters
# 0.15.035.996 I llama_context: n_batch       = 2048
# 0.15.035.996 I llama_context: n_ubatch      = 1024
batch=$(grep "llama_context: n_batch" "$log" | head -1 | sed -E 's/.*n_batch\s*=\s*([0-9]+).*/\1/')
ubatch=$(grep "llama_context: n_ubatch" "$log" | head -1 | sed -E 's/.*n_ubatch\s*=\s*([0-9]+).*/\1/')


printf  "batch: %s \n" "$batch"
printf  "ubatch: %s \n" "$ubatch"
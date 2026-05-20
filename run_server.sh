# Test llama-server

export MSYS_NO_PATHCONV=0

model="Qwen3.5-9B-Q4_K_M.gguf"
#model=qwen3.5:9b-q4_K_M

bin_folder="D:\Standalone Programs\llama-b9222-bin-win-cuda-12.4-x64"
gguf_folder="V:\GGUF"

cd "$bin_folder"

## Note. It needs to be Windows-style path
./llama-server.exe \
    --port 8001 \
    -m "$gguf_folder\\$model"
    #-m "/v/GGUF/Qwen3.5-9B-Q4_K_M.gguf"
    #-hf ggml-org/gemma-3-1b-it-GGUF 
    


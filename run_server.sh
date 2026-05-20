# Test llama-server

#export MSYS_NO_PATHCONV=0
gguf_folder="V:\GGUF"

model="Qwen3.5-9B-Q4_K_M.gguf"
#model=qwen3.5:9b-q4_K_M
ctx_k=8 # context K


# restart to find llama-server from PATH
#llama-server \
cd "D:\Standalone Programs\llama-b9251-bin-win-cuda-12.4-x64"

# ./llama-server.exe --version

#./llama-server.exe \
"D:\Standalone Programs\llama-b9251-bin-win-cuda-12.4-x64\llama-server.exe"
    --port 8001 \
    --model "$gguf_folder\\$model" \
    --ctx-size $((ctx_k * 1024)) \
    --n-gpu-layers 999 \
    --no-warmup \
    --verbose
  

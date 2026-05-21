# Test llama-server

#export MSYS_NO_PATHCONV=0
gguf_folder="V:\GGUF"

SERVER_PORT=8001

model="Qwen3.5-9B-Q4_K_M.gguf"
draft_model="Qwen3.5-0.8B-Base-Q4_0.gguf"
#draft_model="Qwen3.5-2B-Base-Q4_0.gguf"

model_path="$gguf_folder\\$model"
draft_model_path="$gguf_folder\\$draft_model"


ctx_k=8 # context K
context=$((ctx_k * 1024))

# restart to find llama-server from PATH
#llama-server \

# ./llama-server.exe --version

#./llama-server.exe \
"D:\Standalone Programs\llama-b9251-bin-win-cuda-12.4-x64\llama-server.exe" \
    --host 127.0.0.1 \
    --port "$SERVER_PORT" \
    --model "$model_path" \
    --spec-draft-model "$draft_model_path" \
    --ctx-size "$context" \
    --n-gpu-layers 999 \
    --no-warmup \
    --verbose
  
or


#         --threads 2 \            Gemini says to use 4
#        --cache-type-k q8_0 \     Gemini says it will reduce quality
#        --cache-type-v q8_0 \     Gemini says it will reduce quality


"D:\Standalone Programs\llama-b9251-bin-win-cuda-12.4-x64\llama-server.exe" \
        --model "$model_path" \
        --spec-draft-model "$draft_model_path" \
        --spec-type draft-simple \
        --spec-draft-n-max 4 \
        --spec-draft-type-k q8_0 \
        --spec-draft-type-v q8_0 \
        --host 127.0.0.1 \
        --port "$SERVER_PORT" \
        --parallel 1 \
        --n-gpu-layers 999 \
        --ctx-size "$context" \
        --temperature 0.1 \
        --top-k 20 \
        --top-p 0.8 \
        --min-p 0.05 \
        --repeat-penalty 1.05 \
        --repeat-last-n 256
        #--verbose 

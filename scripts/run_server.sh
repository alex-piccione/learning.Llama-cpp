source common.sh

## This script is for quick experimentation
## Once some basis are found, create and use the proper <model>.md script suggestions.

### Customization

run_type=gpu_layer   # gpu_layer, mtp, dflash

#model="Qwen3.5-9B-Q4_K_M.gguf"
#model="Qwen3.6-27B-MTP-UD-Q4_K_XL.gguf" #1.2 tk/s !!
#model=mammoth-coder-13b.Q4_K_M.gguf
#model=Qwen3.5-9B-Q4_K_M.gguf  # 35 layer: 40 tk/s
#model=Qwen3.5-35B-A3B-UD-Q4_K_M.gguf
model=unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf

draft_model="Qwen3.5-0.8B-Base-Q4_0.gguf"
#draft_model="Qwen3.5-2B-Base-Q4_0.gguf"

context_k=32  # context K

# calculate values
model_path="$GGUF_FOLDER/$model"
draft_model_path="$GGUF_FOLDER\\$draft_model"
context=$((ctx_k * 1024))

run_server() {

    if [[ "$run_type" = "gpu_layer" ]] ; then 

        echo "GPU LAYER"       

        GPU_LAYER_N=999  #50
        CPU_MOE=6  # 10-20
        
        # TurboQuant, not available
        #--cache-type-k turbo4
        #--cache-type-v turbo3

        # Force to load all cacche in RAM (?) to save some VRAM  (?)
        # --no-mmap \

        ## MTP ... it works ONLY with MTP models!
        #--spec-type draft-mtp \ only if model support MTP
        #--spec-draft-n-max 3 \   can try 4 or 5

        #llama-server \
        "$LLAMA_BINS_FOLDER/llama-server.exe" \
            --host 127.0.0.1 \
            --port "$SERVER_PORT" \
            --model "$model_path" \
            --ctx-size "$(($context_k * 1024))" \
            --parallel 1 \
            --flash-attn on \
            --n-gpu-layers $GPU_LAYER_N \
            --n-cpu-moe $CPU_MOE \
            --cache-type-k q8_0 \
            --cache-type-v q8_0 \
            --no-mmap \
            --temperature 0.1 \
            --top-k 20 \
            --top-p 0.8 \
            --min-p 0.05 \
            --repeat-penalty 1.05 \
            --repeat-last-n 256 
            # --verbose

        echo -e "SERVER STOPPED"

        # TODO
        #test_call

        # used memory
        # nvidia-smi --query-gpu memory.used --format=csv,noheader | awk '{print $1}'

        #open "http://127.0.0.1:$SERVER_PORT"
    else
        # TODO: cleanup and tst
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
    fi
}


test_call() {

    local temperature=0.1
    local max_tokens=2048

    local prompt="Write F# code that defines a sum function."

    json_payload=$(jq -n \
        --arg prompt "$prompt" \
        --arg temperature "$temperature" \
        --arg max_tokens "$max_tokens" \
'{
  messages: [
    {
      role: "user",
      content: $prompt
    }
  ],
  temperature: ($temperature | tonumber),
  max_tokens: ($max_tokens | tonumber),  
  top_k: 20,
  top_p: 0.8,
  min_p: 0.05,
  repeat_penalty: 1.05,
  repeat_last_n: 256,
  stream: true,
  "stream_options": { "include_usage": true },
  tools: [
    {
      type: "function",
      function: {
        name: "run_code",
        description: "Executes a given script on the local machine environment runner",
        parameters: {
          type: "object",
          properties: {
            language: { type: "string", description: "The programming language, e.g., fsharp" },
            code: { type: "string", description: "The complete corrected script code to execute" }
          },
          required: ["language", "code"]
        }
      }
    }
  ]
}')

    curl -s http://localhost:$SERVER_PORT/v1/chat/completions -d "$json_payload"
}


run_server
source common.sh

### WIP - not working

get_gguf_info() {
    local model="$1" 
    #echo $model
    "$LLAMA_BINS_FOLDER/llama-cli" --model "$GGUF_FOLDER/$model" --info
    #echo "-------------------------------------------------------------------------------"
    #"$LLAMA_BINS_FOLDER/llama-gguf-dump"  "$GGUF_FOLDER/$model"  #2>/dev/null  #| grep -E "general.|llama.context|llama.block|llama.attention|tokenizer.ggml"
}

model=unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf

get_gguf_info $model
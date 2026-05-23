# GGUF

## How to esxtract info from a .gguf file?

[TODO] work in progress

```bash
source common.sh

model="GGUF_FOLDER/"

llama-cli --model "$model"
llama-gguf-dump "$model"

```
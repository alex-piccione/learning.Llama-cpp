# Gemma4 E26B


- Hu6ggingFace link: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF
- Provider: unsloth
- ID: gemma-4-26B-A4B-it-UD-Q4_K_M.gguf
- MTP: NO
- MoE: Yes


## Best Setup

```sh
llama-server \    
    --parallel 1 \
    --flash-attn on \
    --n-gpu-layers 999 \
    --n-cpu-moe 3 \
    --ctx-size "$((16 * 1024))" \
    --cache-type-k q8_0 \
    --cache-type-v q8_0 \
```

Result: **30 tk/s** on llema-server UI  (using 15.9/16 GB VRAM)


| GPU layer | CPU-MoE | CTX K | Cache Type | VRAM   | TK/s | Pi  | Note                    |  
| ---       | ---     | ---   | ---        | ---    | ---  | --- | ---                     |  
| 999       | 5       | 16    | q8_0       | 14.9   |   27 |     |                         |
| 999       | 3       | 16    | q8_0       | 15.9   |   30 |     |                         |
| 999       | 5       | 32    | q8_0       | 15.1   |   25 |     |                         |


## Run tests

```bash
cd scripts

source start_server_common.sh

model="unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf"
ctx_k=8
gpu_layers=999
cpu_moe=7
dflash=0
draft_model="not-empty"
predict_token=0

start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $dflash \
    $draft_model \
    $predict_token

```
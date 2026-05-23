# Erniw 4.5 21B A3B Thinking

- Hu6ggingFace link: (https://huggingface.co/Qwen/Qwen2.5-Coder-14B-Instruct-GGUF?show_file_info=qwen2.5-coder-14b-instruct-q4_k_m.gguf ?)
- Provider: unsloth
- ID: ERNIE-4.5-21B-A3B-Thinking-Q4_K_M.gguf
- MTP: No
- MoE: 
- OpenAI Tools capability:


## Tests result

Result: 75 tk/s with 16K

| GPU layer | CPU-MoE | Ctx  | Cache Type | Predict Token | VRAM    | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---           | ---     | --- | -- | ---                     |  
| 999       |       0 | 16 k | q8_0       |             0 |         |  75 |    |                         |

It is replying only to the first prompt...

## Run tests

```bash
cd scripts

source start_server_common.sh

model=unsloth_ERNIE-4.5-21B-A3B-Thinking-Q4_K_M.gguf
ctx_k=32
gpu_layers=999
cpu_moe=0
dflash=0
draft_model="not-empty"
predict_token=0
mtp=0
jinjia=1

start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $dflash \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia

```
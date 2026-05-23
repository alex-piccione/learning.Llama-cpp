# Qwen 3.6 27B


- Hu6ggingFace link: 
- Provider: unsloth
- ID: Qwen3.6-27B-Q4_K_M.gguf
- MTP: No
- MoE: Yes
- OpenAI Tools capability: ?


## Best Setup

Result: 1 tk/s


| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM    | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---     | --- | -- | ---                     |  
| 999       |       6 | 16 k | q8_0       |  16 GB  |   1 |    |                         |



## Run tests

```bash
cd scripts

source start_server_common.sh

model="unsloth_Qwen3.6-27B-Q4_K_M.gguf"
ctx_k=16
gpu_layers=999
cpu_moe=6
dflash=0
draft_model="not-empty"
predict_token=2
mtp=0
jinjia=0

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
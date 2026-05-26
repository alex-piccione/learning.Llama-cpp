# Qwen 3.6 35B A3B

- Hu6ggingFace link: ?
- Provider: unsloth
- ID: Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
- MTP: ?
- MoE: ?
- OpenAI Tools capability: ?


## Best Setup

Result: 27 tk/s max with 16k


See here: https://www.reddit.com/r/LocalLLM/comments/1t878cw/best_coding_model_for_16gb_vram/



| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM    | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---     | --- | -- | ---                     |  
| 999       |       8 | 16 k | q8_0       | 14.9 MB |   3 |    |                         |
| 999       |      10 | 16 k | q8_0       | 14.9 MB |   2 |    |                         |
| 999       |      13 | 16 k | q8_0       |         |  26 |    |                         |
| 999       |      13 | 32 k | q8_0       |         |  -- |    |                         |



## Run tests

```bash
cd scripts

source start_server_common.sh


# for 80k Context : -ngl 999 --n-cpu-moe 17 -c 80000 --no-mmap --mlock --cache-type-k q8_0 --cache-type-v q8_0 -fa on -ub 1024

model="unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf"
ctx_k=32
gpu_layers=999
cpu_moe=13
dflash=0
draft_model="not-empty"
predict_token=0
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
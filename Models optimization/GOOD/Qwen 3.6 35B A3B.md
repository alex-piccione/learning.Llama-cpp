# Qwen 3.6 35B A3B

- Hu6ggingFace link: ?
- Provider: Unsloth
- ID: Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
- MTP: ?
- MoE: Yes
- OpenAI tools compatibility: ✔️


## Run tests

Result: 27 tk/s max with 16k

See here: https://www.reddit.com/r/LocalLLM/comments/1t878cw/best_coding_model_for_16gb_vram/

Best result: **25 tokens/s with 16k context**  

| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            | 
| 41/41 |  13 |  16 k | 15.6 GB | q8_0  |  25 |   1194 |  48s |    0 |      0 % |                                |
| 41/41 |  12 |  16 k | 15.7 GB | q8_0  |  24 |    755 |  31s |    0 |      0 % |                                |
| 39/41 |  12 |  16 k | 15.7 GB | q8_0  |  21 |    722 |  35s |    0 |      0 % |                                |


| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM    | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---     | --- | -- | ---                     |  
| 999       |      13 | 16 k | q8_0       |         |  26 |    |                         |
| 999       |       8 | 16 k | q8_0       | 14.9 MB |   3 |    |                         |
| 999       |      10 | 16 k | q8_0       | 14.9 MB |   2 |    |                         |

| 999       |      13 | 32 k | q8_0       |         |  -- |    |                         |

```bash
cd scripts

# for 80k Context : -ngl 999 --n-cpu-moe 17 -c 80000 --no-mmap --mlock --cache-type-k q8_0 --cache-type-v q8_0 -fa on -ub 1024

model=unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
ctx_k=16
gpu_layers=999
cpu_moe=14
dflash=0
draft_model=none
predict_token=0
mtp=0
jinjia=0

source start_server_common.sh && \
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

source test_models_common.sh && \
test_call_result_row $(flag_or $dflash $mtp)

```
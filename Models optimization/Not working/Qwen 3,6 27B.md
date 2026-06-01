# Qwen 3.6 27B


## 1. Qwen3.6-27B-Q4_K_M.gguf 

Hu6ggingFace link: 
Provider: unsloth
File: unsloth_Qwen3.6-27B-Q4_K_M.gguf
MTP: No
MoE: Yes
OpenAI tools compatibility: ✔️


## 2. Qwen3.6-27B-Q3_K_M.gguf 

File: unsloth_Qwen3.6-27B-Q3_K_M.gguf
Max context          : 256 k
OpenAI tools compatibility : ✔️


|  16 t/s | 66/66 |   3 |  32 k | 14.2 GB | ---   |   1243 |  76s | DFlash (N-gram)  | size_n=10 size_m=6 min_hits=1  | 2048/512     | 12.4/0.1 |                 |
|  16 t/s | 66/66 |   2 |  16 k | 13.7 GB | ---   |   1167 |  72s | DFlash (N-gram)  | size_n=10 size_m=4 min_hits=1  | 1024/512     | 12.4/0.1 |                 |
|  16 t/s | 66/66 |   3 |  16 k | 13.7 GB | ---   |   1337 |  82s | DFlash (N-gram)  | size_n=10 size_m=6 min_hits=1  | 1024/512     | 12.4/0.1 |                 |


## Draft model

Draft models for DFlash:
- unsloth_Qwen3.5-2B-Q4_K_M.gguf  (❌ failed to load draft model) 
- (❌ not supported) anbeeld_Qwen3.6-27B-DFlash-Q4_K_M.gguf (https://huggingface.co/Anbeeld/Qwen3.6-27B-DFlash-GGUF?show_file_info=Qwen3.6-27B-DFlash-Q4_K_M.gguf)


## Run tests

Result: 1 tk/s


|   2 t/s | 65/65 |   5 |  16 k | 15.7 GB | q8_0  |   1072 | 552s |    0 |      40 % | 1024/512     | 15.0/0.1 | predict=6                                |

| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            | 

| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM    | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---     | --- | -- | ---                     |  
| 999       |       6 | 16 k | q8_0       |  16 GB  |   1 |    |                         |
| 999       |      12 | 16 k | q8_0       |  16 GB  |   1 |    |                         |
| 999       |      10 | 16 k | q8_0       |  16 GB  |   1 |    |                         |

```bash
cd scripts

#model=unsloth_Qwen3.6-27B-Q4_K_M.gguf  # file 1
model=unsloth_Qwen3.6-27B-Q3_K_M.gguf  # file 2
ctx_k=32
gpu_layers=999
cpu_moe=3
dflash=1
draft_model=none
#draft_model=unsloth_Qwen3.5-2B-Q4_K_M.gguf
predict_token=6
mtp=0
jinjia=0
batch=2048
ubatch=512

source server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $dflash \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia \
    $batch \
    $ubatch

source test_models_common.sh && \
test_call_result_row $(flag_or $dflash $mtp)

```
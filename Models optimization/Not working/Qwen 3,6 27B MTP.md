# Qwen 3.6 27B MTP

Hu6ggingFace link: 
Quantized by: Unsloth
File: unsloth_Qwen3.6-27B-MTP-UD-Q4_K_XL.gguf
MTP: Yes
MoE: ?
OpenAI Tools capability: ?


## Run tests

Result: 3 tk/s

| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            | 
| 999   |  10 |   16  |                 | 0.4 |   
| 999   |  12 |   16  |                 | ?   |   
| 999   |   8 |    8  |                 | 0.6 |   
| 999   |  15 |    8  |                 | 0.6 |   


```bash
cd scripts

model=unsloth_Qwen3.6-27B-MTP-UD-Q4_K_XL.gguf
ctx_k=4
gpu_layers=-1
cpu_moe=0
dflash=0
draft_model=none
predict_token=3
mtp=1
jinjia=1
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
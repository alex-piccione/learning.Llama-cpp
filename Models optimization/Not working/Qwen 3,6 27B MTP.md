# Qwen 3.6 27B MTP

- Hu6ggingFace link: 
- Provider: unsloth
- ID: unsloth_Qwen3.6-27B-MTP-UD-Q4_K_XL.gguf
- MTP: Yes
- MoE: ?
- OpenAI Tools capability: ?


## Run tests

Result: 1 tk/s

| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            | 
| 999   |  10 |   16  |                 | 0.4 |   
| 999   |  12 |   16  |                 | ?   |   
| 999   |   8 |    8  |                 | 0.6 |   
| 999   |  15 |    8  |                 | 0.6 |   


```bash
cd scripts

model=unsloth_Qwen3.6-27B-MTP-UD-Q4_K_XL.gguf
ctx_k=8
gpu_layers=999
cpu_moe=15
dflash=0
draft_model=none
predict_token=6
mtp=1
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
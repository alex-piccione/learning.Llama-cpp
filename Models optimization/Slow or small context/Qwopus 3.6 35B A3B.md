# Qwopus 3.6 35B A3B


File: noctrex_Qwopus3.6-35B-A3B-v1-MTP-MXFP4_MOE.gguf
HuggingFace: https://huggingface.co/noctrex/Qwopus3.6-35B-A3B-v1-MTP-MXFP4_MOE-GGUF
Quantized by: noctrex


| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |

Max speed reached: 1 tk/s



```bash
cd scripts

model=noctrex_Qwopus3.6-35B-A3B-v1-MTP-MXFP4_MOE.gguf
ctx_k=8
gpu_layers=-1
cpu_moe=5
dflash=0
draft_model=none
predict_token=6
mtp=1
jinjia=0
batch=512
ubatch=auto

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



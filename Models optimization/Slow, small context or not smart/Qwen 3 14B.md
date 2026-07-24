# Qwen 3 14B

Quantized by: Qwen
File: qwen_Qwen3-14B-Q4_K_M.gguf
Max context: 40 k   ❌
OpenAI tools compatibility: ✔️

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |
|  27 t/s | 41/41 |   0 |  32 k | 11.1 GB | ---   |    749 |  28s | none             | --                             | 1024/512     | 8.0/0.1  |                 |



## Run tests

```bash
cd scripts

model=qwen_Qwen3-14B-Q4_K_M.gguf
ctx_k=32
gpu_layers=-1
cpu_moe=0
dflash=0
draft_model=none
predict_token=0
mtp=0
jinjia=0
batch=1024
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
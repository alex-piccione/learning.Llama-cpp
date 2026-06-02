# OpenAI 20B (by DavidAU)

Max context          : 128 k
OpenAI tools compatibility : ❌
File: davidau_OpenAI-20B-NEO-CODE-DIMAT-IQ4_NL.gguf

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |
|  77 t/s | 25/25 |   0 |  16 k | 11.7 GB | ---   |   2048 |  27s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 1024/512     | 11.0/0.0 |                 |


```bash
cd scripts

model=davidau_OpenAI-20B-NEO-CODE-DIMAT-IQ4_NL.gguf
ctx_k=16
gpu_layers=-1
cpu_moe=0
dflash=1
draft_model=none
predict_token=7
mtp=0
jinjia=0
batch=1024
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
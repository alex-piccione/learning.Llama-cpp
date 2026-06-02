#

File: mistralai_Ministral-3-14B-Reasoning-2512-Q4_K_M.gguf
Quantized by: Ministral AI
Max context          : 256 k
OpenAI tools compatibility : ✔️


## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
|  29 t/s | 41/41 |   0 |  64 k | 13.0 GB | ---   |   1342 |  47s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 1024/512     | 7.3/0.1   |                 |
|  28 t/s | 41/41 |   0 |  32 k | 10.4 GB | ---   |   2048 |  73s | none             | --                             | 1024/512     | 7.3/0.1   |                 |

 

```bash
cd scripts

model=mistralai_Ministral-3-14B-Reasoning-2512-Q4_K_M.gguf
ctx_k=64
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

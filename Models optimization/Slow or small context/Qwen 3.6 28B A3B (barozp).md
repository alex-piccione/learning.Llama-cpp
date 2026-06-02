# Qwen 3.6 28B A3B


File: barozp_Qwen3.6-28B-REAP20-A3B-Q4_K_M.gguf
Max context          : 256 k
OpenAI tools compatibility : ✔️

## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |
|  25 t/s | 41/41 |   0 | 256 k | 14.0 GB | ---   |   1202 |  48s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 512/256      | 10.5/5.3 |                 |
|  25 t/s | 41/41 |   0 | 256 k | 14.0 GB | ---   |    737 |  30s | DFlash (N-gram)  | size_n=10 size_m=9 min_hits=1  | 1024/512     | 10.3/5.5 |                 |
|  25 t/s | 41/41 |   0 | 256 k | 14.0 GB | ---   |   1370 |  54s | DFlash (N-gram)  | size_n=10 size_m=9 min_hits=1  | 2048/512     | 10.3/5.5 |                 |
|  25 t/s | 41/41 |   0 | 256 k | 14.0 GB | ---   |   1902 |  74s | DFlash (N-gram)  | size_n=10 size_m=5 min_hits=1  | 2048/512     | 10.3/5.5 |                 |
|  24 t/s | 41/41 |   0 | 256 k | 14.0 GB | ---   |   1260 |  53s | DFlash (N-gram)  | size_n=10 size_m=6 min_hits=1  | 2048/512     | 10.3/5.5 |                 |



```bash
cd scripts

model=barozp_Qwen3.6-28B-REAP20-A3B-Q4_K_M.gguf
ctx_k=256
gpu_layers=-1
cpu_moe=0
dflash=1
draft_model=none
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
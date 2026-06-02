# Qwen 3.5 9B

## Qwen

HuggingFace: ?
Quantized by: Unsloth
File: unsloth_Qwen3.5-9B-Q4_K_M.gguf
MTP: ?
MoE: yes
Max context: 256 k
OpenAI Tools capability: ✔️

## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |
|  40 t/s | 33/33 |   0 | 256 k |  9.6 GB | ---   |    743 |  18s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 512/256      | 4.7/0.3  |                 |
|  40 t/s | 33/33 |   3 | 256 k | 10.0 GB | ---   |    579 |  14s | none             | --                             | 1024/512     | 4.7/0.5  |                 |
|  40 t/s | 33/33 |   0 | 256 k | 10.0 GB | ---   |    812 |  21s | DFlash (N-gram)  | size_n=10 size_m=6 min_hits=1  | 1024/512     | 4.7/0.5  |                 |
|  40 t/s | 33/33 |   0 | 256 k | 10.8 GB | ---   |    651 |  16s | DFlash (N-gram)  | size_n=10 size_m=5 min_hits=1  | 2048/1024    | 4.7/1.0  |                 |
|  40 t/s | 33/33 |   0 | 256 k |  9.6 GB | ---   |    635 |  16s | DFlash (N-gram)  | size_n=10 size_m=5 min_hits=1  | 512/256      | 4.7/0.3  |                 |
|  40 t/s | 33/33 |   1 |  64 k |  6.6 GB | ---   |    579 |  15s | none             | --                             | 1024/512     | 4.7/0.1  |                 |
|  40 t/s | 33/33 |   0 |  32 k |  6.0 GB | ---   |    579 |  15s | none             | --                             | 1024/512     | 4.7/0.1  |                 |
|  40 t/s | 33/33 |   3 |  64 k |  6.6 GB | ---   |    598 |  15s | none             | --                             | 1024/512     | 4.7/0.1  |                 |
|  39 t/s | 33/33 |   0 | 256 k |  9.6 GB | ---   |    603 |  15s | none             | --                             | 512/256      | 4.7/0.3  |                 |
|  39 t/s | 33/33 |   0 | 256 k | 10.8 GB | ---   |    579 |  15s | DFlash (N-gram)  | size_n=10 size_m=9 min_hits=1  | 2048/1024    | 4.7/1.0  |                 |


```bash
cd scripts

model=unsloth_Qwen3.5-9B-Q4_K_M.gguf
ctx_k=256
gpu_layers=-1
cpu_moe=0
dflash=1
draft_model=none
predict_token=9
mtp=0
jinjia=0
batch=2048
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
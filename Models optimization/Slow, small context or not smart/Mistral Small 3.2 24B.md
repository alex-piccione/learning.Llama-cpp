# Mistral Small 3.2 24B Instruct

HuggingFace: 
Quantized by: Unsloth
File: unsloth_Mistral-Small-3.2-24B-Instruct-2506-Q4_K_M.gguf
MTP: No
MoE: No
Max context: 128 k
OpenAI tools compatibility : ✔️

❌ No DFlash, No MoE, no MTP.... this models doesn't give any space of manouver for optimization.


## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
|  18 t/s | 41/41 |   0 |  24 k | 15.3 GB | ---   |   1000 |  56s | DFlash (N-gram)  | size_n=36 size_m=32 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|  18 t/s | 41/41 |   0 |  24 k | 15.3 GB | ---   |    994 |  56s | DFlash (N-gram)  | size_n=24 size_m=20 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|  18 t/s | 41/41 |   0 |  24 k | 15.3 GB | ---   |   1000 |  57s | DFlash (N-gram)  | size_n=20 size_m=18 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|  18 t/s | 41/41 |   0 |  24 k | 15.3 GB | ---   |   1000 |  57s | DFlash (N-gram)  | size_n=20 size_m=17 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|  18 t/s | 41/41 |   0 |  24 k | 15.3 GB | ---   |    997 |  56s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|  12 t/s | 40/41 |   0 |  24 k | 15.0 GB | ---   |   1006 |  82s | none             | --                             | 2048/256     | 12.7/0.3  |                 |
|   9 t/s | 39/41 |   0 |  24 k | 14.6 GB | ---   |    994 | 105s | DFlash (N-gram)  | size_n=36 size_m=32 min_hits=1 | 2048/256     | 12.3/0.7  |                 |
|  18 t/s | 41/41 |  10 |  16 k | 14.6 GB | ---   |   1003 |  57s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |  12 |  32 k | 15.7 GB | ---   |    994 | 118s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |   4 |  32 k | 15.7 GB | ---   |   1006 | 119s | DFlash (N-gram)  | size_n=16 size_m=12 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |   6 |  32 k | 15.7 GB | ---   |   1003 | 119s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |   4 |  32 k | 15.7 GB | ---   |   1006 | 120s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |   0 |  32 k | 15.7 GB | ---   |    994 | 118s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |  12 |  32 k | 15.7 GB | ---   |    994 | 118s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |  11 |  32 k | 15.7 GB | ---   |   1000 | 119s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |  10 |  32 k | 15.7 GB | ---   |   1001 | 118s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |


```bash
cd scripts

model=unsloth_Mistral-Small-3.2-24B-Instruct-2506-Q4_K_M.gguf
ctx_k=24
gpu_layers=40
cpu_moe=0
dflash=0
draft_model=none
predict_token=32
mtp=0
jinjia=0
batch=2048
ubatch=256

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
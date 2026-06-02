# Mistral Small 3.2 24B Instruct

HuggingFace: 
Quantized by: Unsloth
File: unsloth_Mistral-Small-3.2-24B-Instruct-2506-Q4_K_M.gguf
MTP: ?
MoE: ?
Max context: 128 k
OpenAI tools compatibility : ✔️


## Run tests


| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
|  18 t/s | 41/41 |  10 |  16 k | 14.6 GB | ---   |   1003 |  57s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |  12 |  32 k | 15.7 GB | ---   |    994 | 118s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |   4 |  32 k | 15.7 GB | ---   |   1006 | 119s | DFlash (N-gram)  | size_n=16 size_m=12 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |   6 |  32 k | 15.7 GB | ---   |   1003 | 119s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |   4 |  32 k | 15.7 GB | ---   |   1006 | 120s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |   0 |  32 k | 15.7 GB | ---   |    994 | 118s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |  12 |  32 k | 15.7 GB | ---   |    994 | 118s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |
|   8 t/s | 41/41 |  11 |  32 k | 15.7 GB | ---   |   1000 | 119s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 13.0/0.0  |                 |

Best Result:  18 tokens/s with 16k context.

| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            | 
| 41/41 |  10 |  16 k | 15.1 GB | q8_0  |  18 |   1006 |  57s |    0 |      0 % |                                |
| 41/41 |   8 |  16 k | 15.1 GB | q8_0  |  18 |   1053 |  60s |    0 |      0 % |                                |



```bash
cd scripts

model=unsloth_Mistral-Small-3.2-24B-Instruct-2506-Q4_K_M.gguf
ctx_k=32
gpu_layers=999
cpu_moe=10
dflash=1
draft_model=none
predict_token=16
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
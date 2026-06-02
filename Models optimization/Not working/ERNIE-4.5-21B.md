# Erniw 4.5 21B A3B Thinking

``--skip-chat-parsing`` parameter is required

File 1: unsloth_ERNIE-4.5-21B-A3B-Thinking-Q4_K_M.gguf
HuggingFace: 
Quantized by: Unsloth
MTP: No
MoE: 
Max context: 128 k
OpenAI tools compatibility: ❌


File 2: noctrex_ERNIE-4.5-21B-A3B-Thinking-MXFP4_MOE.gguf
Quantized by: noctrex
Max context: 1024 k  !!!
OpenAI tools compatibility : ❌


## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |
|  83 t/s | 29/29 |   0 |  16 k | 13.3 GB | ---   |   2048 |  25s | DFlash (N-gram)  | size_n=14 size_m=7 min_hits=1  | 1024/512     | 12.4/0.0 | File 1          |
|  46 t/s | 29/29 |   0 |  64 k | 13.9 GB | ---   |   2048 |  45s | DFlash (N-gram)  | size_n=14 size_m=7 min_hits=1  | 1024/512     | 11.5/0.9 | File 1          |
|  13 t/s | 53/53 |   0 |  64 k | 13.8 GB | ---   |   1132 |  87s | DFlash (N-gram)  | size_n=14 size_m=7 min_hits=1  | 1024/512     |  12/10.6 | File 2          |
|  13 t/s | 53/53 |   0 |  64 k | 13.8 GB | ---   |   1097 |  85s | DFlash (N-gram)  | size_n=14 size_m=11 min_hits=1 | 2048/512     |  12/10.6 | File 2          |
 

```bash
cd scripts

#model=unsloth_ERNIE-4.5-21B-A3B-Thinking-Q4_K_M.gguf
moedl=noctrex_ERNIE-4.5-21B-A3B-Thinking-MXFP4_MOE.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=3
dflash=1
draft_model=none
predict_token=11
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

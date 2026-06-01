# Qwen 3.5 9B

## Qwen

- HuggingFace: ?
- Provider: Unsloth
- File: unsloth_Qwen3.5-9B-Q4_K_M.gguf
- MTP: ?
- MoE: ?
- OpenAI Tools capability: ?

## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type    | Pred info                 | Batch/Ubatch | VRAM/RAM | Note                 |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ------------ | ------------------------- | ------------ | -------- | -------------------- |
|  40 t/s | 33/33 |   1 |  64 k |  6.6 GB | ---   |    579 |  15s | none         | --                        | 1024/512     | 4.7/0.1  |                      |
|  40 t/s | 33/33 |   0 |  32 k |  6.0 GB | ---   |    579 |  15s | none         | --                        | 1024/512     | 4.7/0.1  |                      |
|  40 t/s | 33/33 |   3 |  64 k |  6.6 GB | ---   |    598 |  15s | none         | --                        | 1024/512     | 4.7/0.1  |                      |
|  40 t/s | 33/33 |   3 | 256 k | 10.0 GB | ---   |    579 |  14s | none         | --                        | 1024/512     | 4.7/0.5  |                      |


```bash
cd scripts

model=unsloth_Qwen3.5-9B-Q4_K_M.gguf
ctx_k=256
gpu_layers=-1
cpu_moe=3
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
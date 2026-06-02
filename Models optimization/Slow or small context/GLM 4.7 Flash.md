# GLM 4.7 Flash

Model: GLM 4.7 Flash
HuggingFace: https://huggingface.co/unsloth/GLM-4.7-Flash-GGUF
Quantized by: Unsloth
File: unsloth_GLM-4.7-Flash-Q4_K_M.gguf
OpenAI tools compatibility: ✔️
MoE: ?
MTP: ?
Max context: 198k

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | tokens | Time | pred | pred acc | Batch/Ubatch | VRAM/RAM | Note                           |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---- | -------- | ------------ | -------- | ------------------------------ |
|  28 t/s | 48/48 |   0 |  16 k | 14.0 GB | q8_0  |    996 |  35s |    0 |      0 % | 512/256      | 13.2/3.7 |                                |
|  24 t/s | 48/48 |   0 |  32 k | 13.9 GB | q8_0  |   1045 |  44s |    0 |      0 % | 1024/512     | 12.5/4.3 |                                |
|  23 t/s | 48/48 |   0 |  32 k | 14.0 GB | q8_0  |    700 |  31s |    0 |      0 % | 2048/1024    | 12.3/4.6 |                                |
|  22 t/s | 48/48 |   0 |  64 k | 14.0 GB | q8_0  |    680 |  31s |    0 |      0 % | 512/256      | 11.8/5.1 |                                |
|   6 t/s | 48/48 |   3 |  64 k | 15.7 GB | q8_0  |   1216 | 212s |    0 |      0 % | 1024/512     | 16.2/0.7 |                                |
|   6 t/s | 48/48 |   3 |  64 k | 15.7 GB | q8_0  |   1216 | 212s |    0 |      0 % | 1024/512     | 16.2/0.7 |                                |


## Run tests

```bash
cd scripts

model=unsloth_GLM-4.7-Flash-Q4_K_M.gguf
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
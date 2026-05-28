# Qwen 3.5 9B

Model: Qwen 3.5 9B
Quantized by: Unsloth
File 1: unsloth_Qwen3.5-9B-Q4_K_M.gguf
File 2: 
Moe: ?
MTP: No
Max context: 256k
OpenAI tools compatibility: ✔️


| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | tokens | Time | pred | pred acc | Batch/Ubatch | VRAM/RAM | Note                           |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---- | -------- | ------------ | -------- | ------------------------------ |
|  39 t/s | 33/33 |   0 | 256 k |  9.7 GB | q8_0  |    604 |  15s |    0 |      0 % | 512/256      | 4.7/0.3  |                                |
|  39 t/s | 33/33 |   0 | 256 k |  9.7 GB | q8_0  |    604 |  15s |    0 |      0 % | 512/256      | 4.7/0.3  |                                |
|  39 t/s | 33/33 |   0 | 128 k |  7.4 GB | q8_0  |    644 |  16s |    0 |      0 % | 512/256      | 4.7/0.1  |                                |
|  39 t/s | 33/33 |   0 |  64 k |  6.4 GB | q8_0  |    581 |  15s |    0 |      0 % | 512/256      | 4.7/0.1  |                                |
|  39 t/s | 33/33 |   0 |  16 k |  5.5 GB | q8_0  |    721 |  19s |    0 |      0 % | 512/256      | 4.7/0.0  |                                |
|  14 t/s | 30/33 |   0 | 512 k | 13.9 GB | q8_0  |    639 |  44s |    0 |      0 % | 512/256      | 4.3/0.4  |                                |



## Run tests

```bash
cd scripts

model=unsloth_Qwen3.5-9B-Q4_K_M.gguf
ctx_k=512
gpu_layers=-1
cpu_moe=0
dflash=0
draft_model=none
predict_token=0
mtp=0
jinjia=0

source start_server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $dflash \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia

source test_models_common.sh && \
test_call_result_row $(flag_or $dflash $mtp)

```
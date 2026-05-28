# Rover A5B Q3_K_M

Model: Rover A5B
Model base: Qwen 3
MTP: No
Quantized by: mr_radermacher
File: mr_radermacher_Rover-A5B.Q3_K_M.gguf
Max context: 40 k
OpenAI tools compatibility: ✔️

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | tokens | Time | pred | pred acc | Batch/Ubatch | VRAM/RAM | Note                           |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---- | -------- | ------------ | -------- | ------------------------------ |
|  49 t/s | 29/29 |   2 |  16 k | 15.7 GB | q8_0  |    815 |  16s |    0 |      0 % | 1024/512     | 14.3/1.1 |                                |
|  36 t/s | 29/29 |   3 |  16 k | 15.2 GB | q8_0  |   1580 |  44s |    0 |      0 % | 512/256      | 13.7/1.6 | DFlash on                      |
|  34 t/s | 29/29 |   4 |  32 k | 15.6 GB | q8_0  |   1023 |  31s |    0 |      0 % | 512/256      | 13.2/2.2 |                                |
|  29 t/s | 29/29 |   5 |  32 k | 15.0 GB | q8_0  |   1743 |  61s |    0 |      0 % | 512/256      | 12.7/2.7 |                                |
|  28 t/s | 29/29 |   5 |  40 k | 15.5 GB | q8_0  |   1720 |  63s |    0 |      0 % | 512/256      | 12.7/2.7 |                                |
|  24 t/s | 29/29 |   6 |  40 k | 15.0 GB | q8_0  |   2048 |  85s |    0 |      0 % | 512/256      | 12.1/3.2 | ❌ failed tool test           |
|  18 t/s | 29/29 |   4 |  40 k | 15.6 GB | q8_0  |   1189 |  65s |    0 |      0 % | 512/256      | 13.2/2.2 |                                |
|  16 t/s | 29/29 |   3 |  32 k | 15.7 GB | q8_0  |   1311 |  82s |    0 |      0 % | 512/256      | 13.7/1.6 |                                |
|  10 t/s | 29/29 |   5 |  64 k | 15.7 GB | q8_0  |   2048 | 210s |    0 |      0 % | 1024/512     | 12.7/2.7 |                                |
|  11 t/s | 29/29 |   3 |  32 k | 15.7 GB | ---   |    955 |  86s |    0 |      6 % | 512/256      | 13.7/1.6 | DFlash on, predict 4           |
|   7 t/s | 29/29 |   2 |  64 k |         | q8_0  |        |      |    0 |      0 % | 1024/512     |          |                                |
|   8 t/s | 29/29 |   3 |  64 k |         | q8_0  |        |      |    0 |      0 % | 1024/512     |          |                                |
|   5 t/s | 29/29 |   3 | 132 k | 15.7 GB | q8_0  |   1111 | 212s |    0 |      0 % | 512/256      | 13.7/1.6 |                                |


```bash
cd scripts

model=mr_radermacher_Rover-A5B.Q3_K_M.gguf
ctx_k=32
gpu_layers=-1
cpu_moe=2
dflash=1
draft_model=none
predict_token=8
mtp=0
jinjia=0
batch=512
ubatch=auto

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
    $jinjia \
    $batch \
    $ubatch

source test_models_common.sh && \
test_call_result_row $(flag_or $dflash $mtp)

```


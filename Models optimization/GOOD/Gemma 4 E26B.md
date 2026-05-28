# Gemma 4 E26B

Model: Gemma 4 E26B
MTP: NO
MOE: Yes
Max contenxt: 256 k
OpenAI tools compatibility: ✔️


## Unslot 
Hu6ggingFace: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF
Provider: Unsloth
File: unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf

## Noctrex
HuggingFace: https://huggingface.co/noctrex/gemma-4-26B-A4B-it-MXFP4_MOE-GGUF
Provider: noctrex
File: noctrex_gemma-4-26B-A4B-it-MXFP4_MOE.gguf


unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf
| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            |
| 31/31 |   5 |  64 k | 15.7 GB | q8_0  |  29 |   1463 |  51s |    0 |      0 % |                                |
| 31/31 |   5 |  64 k | 15.7 GB | q8_0  |  28 |    802 |  29s |    0 |      0 % | Batch=2048                     |
| 31/31 |   5 |  64 k | 14.8 GB | q8_0  |  28 |   1576 |  55s |    0 |      0 % | Batch=512                      |
| 31/31 |   6 |  96 k | 15.0 GB | q8_0  |  27 |   1246 |  47s |    0 |      0 % |                                |
| 31/31 |   6 |  80 k | 14.8 GB | q8_0  |  27 |   1761 |  66s |    0 |      0 % |                                |
| 31/31 |   6 | 128 k | 15.3 GB | q8_0  |  26 |    745 |  28s |    0 |      0 % |                                |
| 31/31 |   6 |  64 k | 15.2 GB | q8_0  |  26 |   1683 |  64s |    0 |      0 % |                                |
| 31/31 |   5 |  80 k | 15.7 GB | q8_0  |  23 |   1172 |  50s |    0 |      0 % |                                |
| 29/31 |   5 |  64 k | 15.0 GB | q8_0  |  22 |    708 |  32s |    0 |      0 % |                                |
| 29/31 |   6 | 128 k | 15.2 GB | q8_0  |  21 |   1741 |  82s |    0 |      0 % |                                |
| 29/31 |   7 |  64 k | 14.1 GB | q8_0  |  20 |    822 |  40s |    0 |      0 % |                                |
| 31/31 |   4 |  64 k | 15.7 GB | q8_0  |  16 |    883 |  56s |    0 |      0 % |                                |


unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf


## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | tokens | Time | pred | pred acc | Batch/Ubatch | VRAM/RAM | Note                           |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---- | -------- | ------------ | -------- | ------------------------------ |
| unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf                                                                                                    |
|  33 t/s | 31/31 |   3 |  64 k | 15.7 GB | q8_0  |    997 |  30s |    0 |      0 % | 512/256      | 14.4/2.1 |                                |
|  28 t/s | 31/31 |   5 |  64 k | 15.1 GB | q8_0  |   1600 |  56s |    0 |      0 % | 1024/512     | 13.6/2.9 |                                |
|   4 t/s | 31/31 |   1 | 128 k |         | q8_0  |   1600 |  56s |    0 |      0 % | 1024/512     |          |                                |
|   3 t/s | 31/31 |   2 |  64 k | 15.7 GB | q8_0  |   1419 | 416s |    0 |      0 % | 512/256      | 14.9/1.6 |                                |
| noctrex_gemma-4-26B-A4B-it-MXFP4_MOE.gguf                                                                                                    |
|  38 t/s | 31/31 |   1 |  64 k | 15.5 GB | q8_0  |    804 |  21s |    0 |      0 % | 1024/512     | 14.0/1.8 |                                |
|  37 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1580 |  42s |    0 |      0 % | 1024/512     | 14.0/1.8 |                                |
|  36 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |    810 |  22s |    0 |      0 % | 1024/512     | 14.0/1.8 |                                |
|  37 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   2010 |  55s |    0 |      0 % | 1024/256     | 14.0/1.8 |                                |
|  37 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1330 |  36s |    0 |      0 % | 384/256      | 14.0/1.8 |                                |
|  37 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1145 |  31s |    0 |      0 % | 384/192      | 14.0/1.8 |                                |
|  37 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1655 |  44s |    0 |      0 % | 256/128      | 14.0/1.8 |                                |
|  33 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1444 |  43s |    0 |      0 % | 512/256      | 14.0/1.8 |                                |
|  34 t/s | 31/31 |   2 |  96 k | 15.4 GB | q8_0  |   2048 |  60s |    0 |      0 % | 1024/512     | 13.6/2.1 |                                |
|  33 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1525 |  46s |    0 |      0 % | 1024/512     | 14.0/1.8 |                                |
|  32 t/s | 31/31 |   3 |  96 k | 15.1 GB | q8_0  |    970 |  30s |    0 |      0 % | 1024/512     | 13.2/2.5 |                                |
|  29 t/s | 31/31 |   4 |  96 k | 14.7 GB | q8_0  |   1133 |  38s |    0 |      0 % | 1024/512     | 12.8/2.9 |                                |
|  28 t/s | 31/31 |   5 |  64 k | 14.0 GB | q8_0  |    716 |  26s |    0 |      0 % | 1024/512     | 12.5/3.3 |                                |
|  28 t/s | 31/31 |   5 |  96 k | 14.3 GB | q8_0  |   1333 |  48s |    0 |      0 % | 1024/512     | 12.5/3.3 |                                |
|  27 t/s | 31/31 |   0 |  64 k | 14.0 GB | q8_0  |   2048 |  76s |    0 |      0 % | 1024/512     | 12.4/3.3 |                                |
|  25 t/s | 31/31 |   0 |  96 k | 14.0 GB | q8_0  |   1428 |  57s |    0 |      0 % | 1024/512     | 12.1/3.6 |                                |
|  25 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1580 |  63s |    0 |      0 % | 512/256      | 14.0/1.8 | ↓ batch 1024 > 512             |
|  13 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1599 | 123s |    0 |      0 % | 2048/1024    | 14.0/1.8 | ↓ batch 1024 > 2048            |
|   4 t/s | 31/31 |   1 | 192 k | 15.7 GB | q8_0  |   1711 | 479s |    0 |      0 % | 1024/512     | 14.0/1.8 |                                |


↑

```bash
cd scripts

#model=unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf
model=noctrex_gemma-4-26B-A4B-it-MXFP4_MOE.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=1
dflash=0
draft_model=none
predict_token=0
mtp=0
jinjia=0
batch=1024
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
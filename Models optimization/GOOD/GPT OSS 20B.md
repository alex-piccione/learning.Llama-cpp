# GPT OSS 20B

Model: GPT OSS 20B
Quantized by: Unsloth
File 1: unsloth_gpt-oss-20b-Q4_K_M.gguf
File 2: unsloth_gpt-oss-20b-UD-Q6_K_XL.gguf
File 3: unsloth_gpt-oss-20b-Q8_0.gguf
Moe: ?
MTP: No
Max context: 128 k
OpenAI tools compatibility: ✔️


| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | tokens | Time | pred | pred acc | Batch/Ubatch | VRAM/RAM | Note                                       |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---- | -------- | ------------ | -------- | ------------------------------------------ |
|  73 t/s | 25/25 |   0 | 128 k | 12.4 GB | q8_0  |    765 |  10s |    0 |      0 % | 512/256      | 10.4/0.4 |                                            |
|  73 t/s | 25/25 |   0 | 192 k | 13.6 GB | q8_0  |    600 |   9s |    0 |      0 % | 1024/512     | 10.4/0.4 | CTX training is 128k                       |
|  75 t/s | 25/25 |   0 | 128 k | 12.7 GB | q8_0  |    906 |  12s |    0 |      0 % | 1024/512     | 10.4/0.4 |                                            |
|  74 t/s | 25/25 |   0 | 192 k | 13.3 GB | q8_0  |    768 |  10s |    0 |      0 % | 512/256      | 10.4/0.4 |                                            |
|  70 t/s | 25/25 |   0 | 128 k | 12.6 GB | q8_0  |    927 |  14s |    0 |      0 % | 512/256      | 10.6/0.6 | UD-Q6_K_XL                                 |
|  71 t/s | 25/25 |   0 | 128 k | 12.9 GB | ---   |    601 |   9s |    0 |      0 % | 1024/512     | 10.7/0.6 | Q8_0, DFlash, ngram-simple, predict 4 (10) |
|  69 t/s | 25/25 |   0 | 128 k | 12.9 GB | ---   |    621 |   9s |    0 |     -0 % | 1024/512     | 10.7/0.6 | Q8_0                                       |
|  69 t/s | 25/25 |   0 | 128 k | 12.9 GB | ---   |    680 |  10s |    0 |      0 % | 1024/512     | 10.7/0.6 | Q8_0, DFlash, predict 6                    |
|  56 t/s | 25/25 |   0 | 192 k | 14.0 GB | q8_0  |    636 |  11s |    0 |      0 % | 2048/1024    | 10.2/0.6 |                                            |
|  51 t/s | 25/25 |   1 | 128 k | 12.5 GB | ---   |    712 |  14s |    0 |      0 % | 1024/512     | 10.3/1.0 | Q8_0, DFlash, predict 6                    |
|  43 t/s | 25/25 |   2 | 128 k | 11.9 GB | q8_0  |    724 |  17s |    0 |      0 % | 1024/512     | --       |                                            |
|  36 t/s | 25/25 |   3 |  64 k | 10.7 GB | q8_0  |    680 |  19s |    0 |      0 % | 1024/512     | --       |                                            |
|  25 t/s | 25/25 |   5 |  16 k |  9.3 GB | q8_0  |    692 |  27s |    0 |      0 % | 1024/512     | --       |                                            |
|  25 t/s | 25/25 |   5 |  16 k |  9.3 GB | q8_0  |    950 |  37s |    0 |      0 % | 1024/512     | --       |                                            |
|  26 t/s | 25/25 |   5 |  64 k |  9.9 GB | q8_0  |    569 |  22s |    0 |      0 % | 1024/512     | --       |                                            |
|  23 t/s | 25/25 |   3 | 128 k | 11.5 GB | q8_0  |    930 |  40s |    0 |      0 % | 1024/512     | --       |                                            |
|  63 t/s | 25/25 |   0 | 128 k | 12.9 GB | ---   |    687 |  11s |    0 |      0 % | 1024/512     | 10.7/0.6 | Q8_0, DFlash, ngram-simple, predict 4 (10) |


## Run tests

```bash
cd scripts

#model=unsloth_gpt-oss-20b-Q4_K_M.gguf
#model=unsloth_gpt-oss-20b-UD-Q6_K_XL.gguf
model=unsloth_gpt-oss-20b-Q8_0.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=0
dflash=1
draft_model=none
predict_token=4
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
# Qwen 3.6 35B A3B

Hu6ggingFace link: ?
Quantized by: Unsloth
file: unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
MTP: ?
MoE: Yes
Max context: 256 k
OpenAI tools compatibility : ✔️



## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |
|  28 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |   1179 |  41s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 2048/384     | 14.2/6.4 |                 |
|  28 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |    647 |  23s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 2048/512     | 14.2/6.4 |                 |
|  27 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |    740 |  27s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 2048/512     | 14.2/6.4 |                 |
|  25 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |   1085 |  43s | DFlash (N-gram)  | size_n=12 size_m=8 min_hits=1  | 2048/384     | 14.2/6.4 | > size_n        |
|  25 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |   1187 |  48s | DFlash (N-gram)  | size_n=10 size_m=6 min_hits=1  | 2048/384     | 14.2/6.4 | < size_m        |
|  25 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |   2048 |  83s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 2048/384     | 14.2/6.4 | > size_m        |
|  24 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |    671 |  27s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 512/256      | 14.2/6.4 |                 |

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | tokens | Time | pred | pred acc | Batch/Ubatch | VRAM/RAM | Note                                   |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---- | -------- | ------------ | -------- | -------------------------------------- |
|  27 t/s | 41/41 |  13 |  96 k | 15.6 GB | ---   |   1058 |  39s |    0 |      0 % | 768/384      | 14.2/6.4 | DFlash, ngram-simple, predict 10 (12)  |
|  26 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |   1142 |  44s |    0 |      0 % | 512/256      | 14.2/6.4 | DFlash, ngram-simple, predict 8 (10)   |
|  26 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |    714 |  27s |    0 |      0 % | 1024/512     | 14.2/6.4 | DFlash, ngram-simple, predict 8 (12)   |
|  26 t/s | 41/41 |  13 |  80 k | 15.7 GB | ---   |    632 |  24s |    0 |      0 % | 1024/512     | 14.2/6.4 | DFlash, ngram-simple, predict 8 (12)   |
|  25 t/s | 41/41 |  13 |  64 k | 15.6 GB | ---   |    653 |  26s |    0 |      0 % | 1024/512     | 14.2/6.4 | DFlash, ngram-simple, predict 8 (12)   |
|  26 t/s | 41/41 |  14 |  64 k | 15.2 GB | ---   |   1059 |  41s |    0 |      0 % | 1024/512     | 13.8/6.8 | DFlash, ngram-simple, predict 12 (24)  |
|  25 t/s | 41/41 |  14 |  64 k | 15.2 GB | ---   |   1162 |  46s |    0 |      0 % | 1024/512     | 13.8/6.8 | DFlash, ngram-simple, predict 10 (24)  |
|  25 t/s | 41/41 |  14 |  64 k | 15.2 GB | ---   |    771 |  30s |    0 |      0 % | 1024/512     | 13.8/6.8 | DFlash, ngram-simple, predict 10 (16)  |
|  25 t/s | 41/41 |  14 |  64 k | 15.2 GB | ---   |    724 |  29s |    0 |      0 % | 1024/512     | 13.8/6.8 | DFlash, ngram-simple, predict 10 (12)  |
|  25 t/s | 41/41 |  14 |  64 k | 15.2 GB | ---   |    646 |  26s |    0 |      0 % | 1024/512     | 13.8/6.8 | DFlash, ngram-simple, predict 8 (12)   |
|  24 t/s | 41/41 |  15 |  48 k | 14.5 GB | ---   |    686 |  29s |    0 |      0 % | 1024/512     | 13.3/7.3 |                                        |
|  24 t/s | 41/41 |  15 |  32 k | 14.4 GB | ---   |    704 |  30s |    0 |      0 % | 1024/512     | 13.3/7.3 | DFlash, ngram-simple, predict 8 (12)   |
|  23 t/s | 41/41 |  16 |  32 k | 13.9 GB | ---   |    697 |  30s |    0 |      0 % | 1024/512     | 12.9/7.8 | DFlash, ngram-simple, predict 8 (12)   |
|  22 t/s | 41/41 |  16 |  32 k | 13.9 GB | ---   |   1110 |  50s |    0 |      0 % | 1024/512     | 12.9/7.8 | DFlash, ngram-simple, predict 8 (12)   |
|  22 t/s | 41/41 |  13 |  96 k | 15.6 GB | ---   |    721 |  33s |    0 |      0 % | 768/384      | 14.2/6.4 | DFlash, ngram-simple, predict 10 (16)  |
|  21 t/s | 41/41 |  18 |  32 k | 13.0 GB | ---   |    696 |  33s |    0 |      0 % | 1024/512     | 11.9/8.7 | DFlash, ngram-simple, predict 8 (12)   |
|  19 t/s | 41/41 |  18 |  16 k | 12.8 GB | ---   |   1397 |  73s |    0 |      0 % | 1024/512     | 11.9/8.7 | DFlash, ngram-simple, predict 8 (12)   |
|   3 t/s | 41/41 |  12 |  96 k |         | ---   |        |      |    0 |      0 % | 1024/512     |          | DFlash, ngram-simple, predict 8 (12)   |
|   3 t/s | 41/41 |  13 | 128 k |         | ---   |        |      |    0 |      0 % | 1024/512     |          | DFlash, ngram-simple, predict 8 (12)   |

```bash
cd scripts

# for 80k Context : -ngl 999 --n-cpu-moe 17 -c 80000 --no-mmap --mlock --cache-type-k q8_0 --cache-type-v q8_0 -fa on -ub 1024

model=unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
ctx_k=96
gpu_layers=-1
cpu_moe=13
dflash=1
draft_model=none
predict_token=7
mtp=0
jinjia=0
batch=1512
ubatch=384

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
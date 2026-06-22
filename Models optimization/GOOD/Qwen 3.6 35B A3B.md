# Qwen 3.6 35B A3B

HuggingFace: ?
Quantized by: Unsloth
File: unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
MTP: ?
MoE: Yes
Max context: 256 k
OpenAI tools compatibility : ✔️

Note.  
- With less than CPU_MOE=13 the speed drops down.  (?!)
- Using 64k instead of 96k of context gives exactly the same speed. (?!)
- Switching 

## Thetom-ai
Use Config-I quantization instead of Q4_K_M
Huggingface: https://huggingface.co/thetom-ai/Qwen3.6-35B-A3B-ConfigI-GGUF
Quantizer: thetom_ai
File: 



## Run tests

| Speed   | Ctx   | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
|  24 t/s |  64 k | 41/41  | 14.0 GB | 12.7/7.9  | --    |    796 |  34s | none             | --                             | 2048/256     |                 |
|  23 t/s |  64 k | 41/41  | 14.0 GB | 12.7/7.9  | --    |   1058 |  45s | none             | --                             | 2048/256     |                 |
|  19 t/s |  64 k | 41/41  | 14.0 GB | 12.7/7.9  | --    |    691 |  37s | DFlash (N-gram)  | M=24 N=12 min=1 (17%)          | 2048/256     |                 |


| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
|  15 t/s |  96 k | 41/41 |  -- | 15.7 GB | --    |    680 |  45s | DFlash (N-gram)  | size_M=10 size_N=7 min_hits=1  | 2048/384     | 14.2/6.4  |                 |
|  15 t/s |  96 k | 41/41 |  -- | 15.7 GB | --    |    674 |  44s | DFlash (N-gram)  | size_M=10 size_N=6 min_hits=1  | 2048/384     | 14.2/6.4  |                 |


| old values thta I'm not able to replicate ! (I tried also with the same llama.cpp version)
|  28 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |   1179 |  41s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 2048/384     | 14.2/6.4  |                 |
|  28 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |    647 |  23s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 2048/512     | 14.2/6.4  |                 |
|  27 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |    740 |  27s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 2048/512     | 14.2/6.4  |                 |
|  25 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |   1085 |  43s | DFlash (N-gram)  | size_n=12 size_m=8 min_hits=1  | 2048/384     | 14.2/6.4  | > size_n        |
|  25 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |   1187 |  48s | DFlash (N-gram)  | size_n=10 size_m=6 min_hits=1  | 2048/384     | 14.2/6.4  | < size_m        |
|  25 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |   2048 |  83s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 2048/384     | 14.2/6.4  | > size_m        |
|  24 t/s | 41/41 |  13 |  96 k | 15.7 GB | ---   |    671 |  27s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 512/256      | 14.2/6.4  |                 |
|  26 t/s | 41/41 |  13 |  64 k | 15.5 GB | ---   |   1106 |  42s | DFlash (N-gram)  | size_M=10 size_N=12 min_hits=1 | 2048/256     | 14.2/6.4  |                 |
|  26 t/s | 41/41 |  13 |  64 k | 15.5 GB | ---   |   1114 |  43s | DFlash (N-gram)  | size_M=8 size_N=12 min_hits=1  | 2048/256     | 14.2/6.4  |                 |


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

### Max CTX

model=unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
ctx_k=96
gpu_layers=-1
cpu_moe=0
spec=1
draft_model=none
predict_token=8/12
mtp=0
jinjia=0
batch=2048
ubatch=256

### Max Speed

model=unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
ctx_k=96
gpu_layers=-1
cpu_moe=0
spec=0
draft_model=none
predict_token=6/12
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
    $spec \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia \
    $batch \
    $ubatch

source test_models_common.sh && print_test_call

```
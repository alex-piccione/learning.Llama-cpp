# GPT OSS 20B

Model: GPT OSS 20B
Quantized by: Unsloth
File 1: unsloth_gpt-oss-20b-Q4_K_M.gguf
File 2: unsloth_gpt-oss-20b-UD-Q6_K_XL.gguf
File 3: unsloth_gpt-oss-20b-Q8_0.gguf
File 4: unsloth_gpt-oss-20b-UD-Q8_K_XL.gguf
File 5: davidau_OpenAI-20B-NEO-CODE2-Plus-Uncensored-IQ4_NL.gguf
Moe: ?
MTP: No
Max context: 128 k
OpenAI tools compatibility: ✔️


| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
|  73 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |   1345 |  18s | DFlash (N-gram)  | size_n=12 size_m=16 min_hits=1 | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  72 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |    738 |  10s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  72 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |    734 |  10s | DFlash (N-gram)  | size_n=16 size_m=14 min_hits=1 | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  72 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |    691 |   9s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  72 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |    950 |  14s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  71 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |   1042 |  14s | DFlash (N-gram)  | size_n=12 size_m=12 min_hits=1 | 512/256      | 10.6/0.6  | UD-Q6_K_XL      |
|  71 t/s | 25/25 |   0 | 128 k | 12.8 GB | ---   |    708 |  10s | DFlash (N-gram)  | size_n=10 size_m=5 min_hits=1  | 2048/384     | 10.7/0.6  | Q8_0            |
|  70 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |    685 |   9s | DFlash (N-gram)  | size_n=16 size_m=12 min_hits=1 | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  70 t/s | 25/25 |   0 | 128 k | 12.7 GB | ---   |    811 |  11s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 2048/256     | 10.7/0.6  | Q8_0            |
|  70 t/s | 25/25 |   0 | 128 k | 12.7 GB | ---   |    714 |  11s | DFlash (N-gram)  | size_n=10 size_m=6 min_hits=1  | 2048/256     | 10.7/0.6  | Q8_0            |
|  70 t/s | 25/25 |   0 | 128 k | 12.9 GB | ---   |    727 |  10s | DFlash (N-gram)  | size_n=10 size_m=4 min_hits=1  | 1024/512     | 10.7/0.6  | Q8_0            |
|  70 t/s | 25/25 |   0 | 128 k | 12.8 GB | ---   |    678 |  10s | DFlash (N-gram)  | size_n=10 size_m=4 min_hits=1  | 1024/384     | 10.7/0.6  | Q8_0            |
|  68 t/s | 25/25 |   0 | 128 k | 12.9 GB | ---   |    714 |  10s | DFlash (N-gram)  | size_n=10 size_m=4 min_hits=1  | 2048/512     | 10.7/0.6  | Q8_0            |



| Speed   | Ctx   | GPU   | MoE | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | ----- | --- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
| unsloth_gpt-oss-20b-UD-Q8_K_XL.gguf
|  67 t/s | 128 k | 25/25 |  -- | 13.2 GB | --    |    782 |  12s | DFlash (N-gram)  | size_M=8 size_N=5 min_hits=1   | 1024/256     | 11.2/1.1  |                 |
|  64 t/s | 128 k | 25/25 |  -- | 13.2 GB | --    |    647 |  10s | DFlash (N-gram)  | size_M=15 size_N=10 min_hits=1 | 1024/256     | 11.2/1.1  |                 |
|  64 t/s | 128 k | 25/25 |  -- | 13.2 GB | --    |   1202 |  19s | DFlash (N-gram)  | size_M=15 size_N=10 min_hits=1 | 1024/256     | 11.2/1.1  |                 |
|  62 t/s | 128 k | 25/25 |  -- | 13.2 GB | --    |   1162 |  18s | none             | --                             | 1024/256     | 11.2/1.1  |                 |
|  62 t/s | 128 k | 25/25 |  -- | 13.2 GB | --    |   1184 |  19s | DFlash (N-gram)  | size_M=6 size_N=4 min_hits=1   | 1024/256     | 11.2/1.1  |                 |
| davidau_OpenAI-20B-NEO-CODE2-Plus-Uncensored-IQ4_NL.gguf
|  83 t/s | 128 k | 25/25 |  -- | 12.7 GB | --    |   2549 |  31s | DFlash (N-gram)  | size_M=6 size_N=4 min_hits=1   | 1024/256     | 10.7/0.1  | 51% accepted    |
|  78 t/s | 128 k | 25/25 |  -- | 12.7 GB | --    |   2075 |  26s | DFlash (N-gram)  | size_M=6 size_N=3 min_hits=1   | 1024/256     | 10.7/0.1  | 45% accepted    |
|  82 t/s | 128 k | 25/25 |  -- | 12.7 GB | --    |   3948 |  48s | DFlash (N-gram)  | size_M=4 size_N=6 min_hits=1   | 1024/256     | 10.7/0.1  |                 |



## Run tests

```bash
cd scripts

#model=unsloth_gpt-oss-20b-Q4_K_M.gguf
#model=unsloth_gpt-oss-20b-UD-Q6_K_XL.gguf
#model=unsloth_gpt-oss-20b-Q8_0.gguf
#model=unsloth_gpt-oss-20b-UD-Q8_K_XL.gguf
model=davidau_OpenAI-20B-NEO-CODE2-Plus-Uncensored-IQ4_NL.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=0
dflash=0
draft_model=none
predict_token=3/6
mtp=0
jinjia=0
batch=1024
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

source test_models_common.sh && test_call_result_row

```
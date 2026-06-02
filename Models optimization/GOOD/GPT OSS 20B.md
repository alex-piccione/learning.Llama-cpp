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


## Run tests

```bash
cd scripts

#model=unsloth_gpt-oss-20b-Q4_K_M.gguf
model=unsloth_gpt-oss-20b-UD-Q6_K_XL.gguf
#model=unsloth_gpt-oss-20b-Q8_0.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=0
dflash=1
draft_model=none
predict_token=12
mtp=0
jinjia=0
batch=512
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

source test_models_common.sh && \
test_call_result_row $(flag_or $dflash $mtp)

```
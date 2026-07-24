# OpenAI 20B (by DavidAU)

File: OpenAI-20B-NEO-CODE2-Plus-Uncensored-IQ4_NL_davidau.gguf
Max context                   : 128 k
OpenAI tools compatibility    : ❌

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
|  78 t/s |  16 k |   0 | 25/25  | 11.1 GB | 10.7/0.0  | --    |   2048 |  26s | none             | --                             | 1024/256     |                 |


| OpenAI-20B-NEO-CODE2-Plus-Uncensored-IQ4_NL_davidau.gguf
|  83 t/s | 128 k | 25/25 |  -- | 12.7 GB | --    |   2549 |  31s | DFlash (N-gram)  | size_M=6 size_N=4 min_hits=1   | 1024/256     | 10.7/0.1  | 51% accepted    |
|  78 t/s | 128 k | 25/25 |  -- | 12.7 GB | --    |   2075 |  26s | DFlash (N-gram)  | size_M=6 size_N=3 min_hits=1   | 1024/256     | 10.7/0.1  | 45% accepted    |
|  82 t/s | 128 k | 25/25 |  -- | 12.7 GB | --    |   3948 |  48s | DFlash (N-gram)  | size_M=4 size_N=6 min_hits=1   | 1024/256     | 10.7/0.1  |                 |

```bash
cd scripts

model=OpenAI-20B-NEO-CODE2-Plus-Uncensored-IQ4_NL_davidau.gguf
ctx_k=16
gpu_layers=-1
cpu_moe=0
spec=0
draft_model=none
predict_token=0/0
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
    $spec \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia \
    $batch \
    $ubatch
    
source test_models_common.sh && print_test_call

```
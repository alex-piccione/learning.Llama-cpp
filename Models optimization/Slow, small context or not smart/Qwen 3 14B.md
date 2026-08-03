# Qwen 3 14B

❌ Training context is just 40K


## ✔️ UD Q5_K_XL
Qwen3-14B-UD-Q5_K_XL_unsloth.gguf                          9.82 GB
Can't go ober 64k !!

##  Q4_K_M (Unsloth)               [FILE MISSING]
qwen_Qwen3-14B-Q4_K_M.gguf


| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |
|  27 t/s | 41/41 |   0 |  32 k | 11.1 GB | ---   |    749 |  28s | none             | --                             | 1024/512     | 8.0/0.1  |                 |



## Run tests

```bash

model=Qwen3-14B-UD-Q5_K_XL_unsloth.gguf
ctx_k=40
gpu_layers=-1
cpu_moe=0
spec=simple
draft_model=none
predict_token=3/8
jinja=1
batch=1024
ubatch=1024
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  31 t/s |  64 k |   0 | 41/41 | 15.2 | 9.3/0.1   | q8_0  |    795 |  26s | N-gram       N=3 M=8 min=1 (31%) |  1024/512 |            |
|  30 t/s |  64 k |   0 | 41/41 | 15.2 | 9.3/0.1   | q8_0  |    750 |  25s | N-gram       N=3 M=6 min=1 (37%) |  1024/512 |            |
|  29 t/s |  64 k |   0 | 41/41 | 15.3 | 9.3/0.2   | q8_0  |    852 |  30s | N-gram       N=4 M=6 min=1 (43%) | 2048/1024 |            |
|  28 t/s |  64 k |   0 | 41/41 | 15.2 | 9.3/0.1   | q8_0  |    762 |  28s | N-gram      N=6 M=12 min=1 (33%) |  1024/512 |            |
|  27 t/s |  64 k |   0 | 41/41 | 15.3 | 9.3/0.2   | q8_0  |    788 |  30s | N-gram      N=8 M=16 min=1 (27%) | 2048/1024 |            |
|  28 t/s |  64 k |   0 | 41/41 | 15.3 | 9.3/0.2   | q8_0  |    730 |  26s | N-gram       N=1 M=1 min=1 (33%) | 2048/1024 |            |
|  24 t/s |  64 k |   0 | 41/41 | 15.3 | 9.3/0.2   | q8_0  |    730 |  30s | none                          -- | 2048/1024 |            |

|  30 t/s |  40 k |   0 | 41/41 | 13.2 | 9.3/0.1   | q8_0  |    761 |  25s | N-gram       N=3 M=8 min=1 (31%) | 1024/1024 |            |

model=qwen_Qwen3-14B-Q4_K_M.gguf
ctx_k=32
gpu_layers=-1
cpu_moe=0
dflash=0
draft_model=none
predict_token=0
jinja=0
batch=1024
ubatch=auto


_test_model() {
source server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $spec \
    $draft_model \
    $predict_token \
    $jinja \
    $batch \
    $ubatch
    
source test_models_common.sh && print_test_call
}
```
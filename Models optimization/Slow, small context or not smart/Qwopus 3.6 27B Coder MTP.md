# Qwopus 3.6 27B Coder MTP

## Coder Compact MTP Q_3_K_M (by Jackrong)
https://huggingface.co/Jackrong/Qwopus3.6-27B-Coder-Compat-MTP-GGUF
Qwopus3.6-27B-Coder-Compat-MTP-Q3_K_M_jackrong.gguf           12.5 GB

**With MTP enables i supe slow**


| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
|  17 t/s |  64 k |   3 | 66/66  | 14.8 GB | 12.1/0.0  | --    |    591 |  35s | none             | --                             | 1024/256     |                 |

```bash

model=Qwopus3.6-27B-Coder-Compat-MTP-Q3_K_M_jackrong.gguf
ctx_k=128
cpu_moe=0
gpu_layers=-1
spec=1
draft_model=none
predict_token=12/12
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


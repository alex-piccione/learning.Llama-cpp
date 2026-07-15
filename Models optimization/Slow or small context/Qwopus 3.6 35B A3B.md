# Qwopus 3.6 35B A3B


| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwopus3.6-35B-A3B-Coder-MTP-Q3_K_M_jackrong.gguf
|  47 t/s |  64 k |   4 | 42/42  | 15.5 GB | 14.3/1.5  | --    |    800 |  17s | none             | --                             | 1024/256     |                 |
|  39 t/s |  64 k |   3 | 42/42  | 15.7 GB | 14.6/1.1  | --    |    638 |  16s | none             | --                             | 1024/256     |                 |
|  37 t/s |  64 k |   3 | 42/42  | 15.7 GB | 14.6/1.1  | --    |    638 |  17s | none             | --                             | 1024/256     |                 |


## ❌ v1 MTP (Noctrex)
Qwopus3.6-35B-A3B-v1-MTP-MXFP4_MOE_noctrex.gguf
HuggingFace: https://huggingface.co/noctrex/Qwopus3.6-35B-A3B-v1-MTP-MXFP4_MOE-GGUF

Max speed reached: 1 tk/s


## Qwopus 3.6 35B-A3B Coder MTP Q3_K_M (Jackrong)
https://huggingface.co/Jackrong/Qwopus3.6-35B-A3B-Coder-MTP-GGUF
Qwopus3.6-35B-A3B-Coder-MTP-Q3_K_M_jackrong.gguf                       15.9GB



```bash
cd scripts

model=noctrex_Qwopus3.6-35B-A3B-v1-MTP-MXFP4_MOE.gguf
ctx_k=8
gpu_layers=-1
cpu_moe=5
dflash=0
draft_model=none
predict_token=6
mtp=1
jinjia=0
batch=512
ubatch=auto


model=Qwopus3.6-35B-A3B-Coder-MTP-Q3_K_M_jackrong.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=4
spec=0
draft_model=none
predict_token=8/8
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



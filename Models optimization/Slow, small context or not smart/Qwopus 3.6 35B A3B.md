# Qwopus 3.6 35B A3B


| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwopus3.6-35B-A3B-Coder-MTP-Q3_K_M_jackrong.gguf
|  46 t/s |  96 k |   4 | 42/42  | 15.7 GB | 14.3/1.5  | --    |    800 |  17s | none             | --                             | 1024/256     |                 |
|  47 t/s |  64 k |   4 | 42/42  | 15.5 GB | 14.3/1.5  | --    |    800 |  17s | none             | --                             | 1024/256     |                 |
|  44 t/s |  32 k |   4 | 42/42  | 15.2 GB | 14.3/1.5  | --    |    800 |  18s | DFlash (N-gram)  | s_M=6 s_N=10 min=1             | 1024/256     |                 |
|  39 t/s |  64 k |   3 | 42/42  | 15.7 GB | 14.6/1.1  | --    |    638 |  16s | none             | --                             | 1024/256     |                 |
|  37 t/s |  64 k |   3 | 42/42  | 15.7 GB | 14.6/1.1  | --    |    638 |  17s | none             | --                             | 1024/256     |                 |


## ❌ v1 MTP (Noctrex)
Qwopus3.6-35B-A3B-v1-MTP-MXFP4_MOE_noctrex.gguf
HuggingFace: https://huggingface.co/noctrex/Qwopus3.6-35B-A3B-v1-MTP-MXFP4_MOE-GGUF

Max speed reached: 1 tk/s


## ❌ Qwopus 3.6 35B-A3B Coder MTP Q3_K_M (Jackrong)
https://huggingface.co/Jackrong/Qwopus3.6-35B-A3B-Coder-MTP-GGUF
Qwopus3.6-35B-A3B-Coder-MTP-Q3_K_M_jackrong.gguf                       15.9 GB

**With MTP enabled it is slower!**

❌ Loop on first question. Asking to create a ASCII Art for Coca-Cola logo it went crazy

```bash
cd scripts


model=Qwopus3.6-35B-A3B-Coder-MTP-Q3_K_M_jackrong.gguf
ctx_k=96
gpu_layers=-1
cpu_moe=4
spec=0
draft_model=none
predict_token=8/8
mtp=0
jinja=0
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
    $jinja \
    $batch \
    $ubatch
    
source test_models_common.sh && print_test_call

```



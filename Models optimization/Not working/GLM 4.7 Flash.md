# GLM 4.7 Flash

Max context                   : 198 k

| File                                                              | Result                                      |
| GLM-4.7-Flash-UD-Q3_K_XL_unsloth.gguf                             |                                             |
| GLM-4.7-Flash-Q4_K_M_unsloth.gguf                                 | ??                                          |
| GLM-4.7-flash-Q4_K_M_gaionaus.gguf                                | ❌ Gibberish and not valid format in Pi     |
| GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL_unsloth.gguf                | ❌ Total non-semse in Pi  (45 t/s at 96k)   |
| GLM-4.7-Flash-REAP-09.Q3_K_L_akicou.gguf                          | ❌ No tool calls                            |
| GLM-4.7-Flash-REAP-19.Q4_K_M_akicou.gguf                          | ❌ No tool calls                            |


## UD Q3_K_XL (Unsloth)
GLM-4.7-Flash-UD-Q3_K_XL_unsloth.gguf                                  12.8 GB


## ❌ Q4_K_M (by Unsloth)    [MISSING FILE]
https://huggingface.co/unsloth/GLM-4.7-Flash-GGUF
GLM-4.7-Flash-Q4_K_M_unsloth.gguf
OpenAI tools compatibility : ✔️

## ❌Q4_K_M (by gaionaus)   [DELETED]
https://huggingface.co/gaionaus/GLM-4.7-Flash-REAP-50_Q4_K_M_GGUF
GLM-4.7-flash-Q4_K_M_gaionaus.gguf                                      9.1 GB
❌ Gibbersih and not valid format in Pi
60 t/s at 128k

## ❌ REAP-23B-A3B UD-Q4_K_XL (by Unsloth)
GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL_unsloth.gguf                       13.2 GB
https://huggingface.co/unsloth/GLM-4.7-Flash-REAP-23B-A3B-GGUF
For llama.cpp, use --jinja

❌ Total rubbish on Pi

## ❌REAP-09.Q3_K_L (by akicou)   [DELETED]
GLM-4.7-Flash-REAP-09.Q3_K_L_akicou.gguf
OpenAI tools compatibility    : ❌

## ❌ REAP-19.Q4_K_M (by akicou)    [DELETED]
GLM-4.7-Flash-REAP-19.Q4_K_M_akicou.gguf                           13.9 GB
OpenAI tools compatibility    : ❌


| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/U. |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | -------- |
| GLM-4.7-Flash-UD-Q3_K_XL_unsloth.gguf
|  25 t/s | 128 k |   2 | 45/48  | 15.7 GB | 12.0/0.8  | --    |   1198 |  47s | none             | --                             | 1024/256 |
| ❌ GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL_unsloth.gguf
|  51 t/s |  96 k |   2 | 48/48  | 15.7 GB | 12.8/0.4  | --    |    932 |  18s | none             | --                             | 1024/256 |
|  45 t/s |  96 k |   3 | 48/48  | 15.6 GB | 12.5/0.7  | --    |   1316 |  29s | none             | --                             | 1024/256 |
|  47 t/s |  64 k |   3 | 48/48  | 14.7 GB | 12.5/0.7  | --    |   1316 |  28s | none             | --                             | 1024/256 |
|  43 t/s |  64 k |   4 | 48/48  | 14.4 GB | 12.3/1.0  | --    |   1001 |  23s | none             | --                             | 1024/256 |

| ❌ GLM-4.7-Flash-REAP-19.Q4_K_M_akicou.gguf
|  44 t/s |  64 k |   4 | 48/48  | 15.0 GB | 12.9/0.9  | --    |   2048 |  47s | none             | --                             | 1024/256 |
|  42 t/s |  64 k |   5 | 48/48  | 14.7 GB | 12.6/1.2  | --    |   2048 |  49s | DFlash (N-gram)  | s_M=2 s_N=4 min=1              | 1024/256 |
|  42 t/s |  80 k |   5 | 48/48  | 15.2 GB | 12.6/1.2  | --    |   2048 |  48s | DFlash (N-gram)  | s_M=6 s_N=24 min=1             | 1024/256 |
|  41 t/s |  80 k |   5 | 48/48  | 15.2 GB | 12.6/1.2  | --    |   2048 |  50s | DFlash (N-gram)  | s_M=4 s_N=12 min=1             | 1024/256 |
|  41 t/s |  80 k |   5 | 48/48  | 15.2 GB | 12.6/1.2  | --    |   2048 |  50s | DFlash (N-gram)  | s_M=6 s_N=24 min=1             | 1024/256 |
|  39 t/s |  80 k |   5 | 48/48  | 15.2 GB | 12.6/1.2  | --    |   2048 |  52s | none             | --                             | 1024/256 |

| ❌ GLM-4.7-Flash-REAP-19.Q4_K_M_akicou.gguf
|  36 t/s |  64 k |   5 | 48/48  | 14.2 GB | 12.1/1.1  | --    |   2048 |  56s | DFlash (N-gram)  | s_M=6 s_N=24 min=1             | 1024/256 |

| ❌ GLM-4.7-flash-Q4_K_M_gaionaus.gguf
|  59 t/s | 128 k |   1 | 48/48  | 12.8 GB | 8.9/0.2   | --    |   4096 |  69s | none             | --                             | 1024/256 |
|  55 t/s | 128 k |   2 | 48/48  | 12.7 GB | 8.7/0.3   | --    |    612 |  12s | none             | --                             | 1024/256 |
|  46 t/s | 128 k |   3 | 48/48  | 12.5 GB | 8.5/0.5   | --    |   4096 |  90s | none             | --                             | 1024/256 |
|  26 t/s | 128 k |   2 | 45/48  | 12.5 GB | 8.4/0.6   | --    |   1400 |  53s | none             | --                             | 1024/256 |


## Run tests

```bash

## GLM-4.7-Flash-UD-Q3_K_XL_unsloth.gguf
model=GLM-4.7-Flash-UD-Q3_K_XL_unsloth.gguf
ctx_k=128
gpu_layers=45
cpu_moe=2
spec=none
draft_model=none
predict_token=1/2   # (N/M)
mtp=0
jinja=1
batch=1024
ubatch=256
_start_server


|  25 t/s | 128 k |   2 | 45/48  | 15.7 GB | 12.0/0.8  | --    |   1198 |  48s | none             | --                             | 1024/256     |                 |
|  24 t/s | 128 k |   3 | 45/48  | 15.7 GB | 12.0/0.8  | --    |   1198 |  50s | none             | --                             | 1024/256     |                 |
|  21 t/s | 128 k |   2 | 45/48  | 15.7 GB | 12.0/0.8  | --    |   1198 |  57s | none             | --                             | 1024/256     |                 |
|  18 t/s | 128 k |   5 | 45/48  | 15.6 GB | 11.5/1.3  | --    |    967 |  54s | none             | --                             | 1024/256     |                 |
|  16 t/s | 128 k |   2 | 43/48  | 15.4 GB | 11.5/1.3  | --    |    958 |  60s | none             | --                             | 1024/256     |                 |
|  14 t/s | 128 k |   1 | 43/48  | 15.4 GB | 11.5/1.3  | --    |    958 |  66s | none             | --                             | 1024/256     |                 |
|  12 t/s | 128 k |   2 | 41/48  | 14.8 GB | 11.0/1.9  | --    |    810 |  69s | none             | --                             | 1024/256     |                 |

## REAP-23B-A3B
model=GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL_unsloth.gguf
ctx_k=128
gpu_layers=45
cpu_moe=2
spec=none
draft_model=none
predict_token=1/2   # (N/M)
mtp=0
jinja=1
batch=1024
ubatch=256
_start_server

# experimenting with GPU Offload
|  27 t/s |  96 k |   3 | 45/48  | 15.6 GB | 12.4/0.8  | --    |    957 |  35s | none             | --                             | 1024/256     |                 |
|  23 t/s |  96 k |   3 | 44/48  | 15.2 GB | 12.1/1.1  | --    |    954 |  42s | none             | --                             | 1024/256     |                 |
|  22 t/s |  96 k |   2 | 44/48  | 15.2 GB | 12.1/1.1  | --    |    954 |  43s | none             | --                             | 1024/256     |                 |
|  36 t/s |  96 k |   3 | 47/48  | 15.7 GB | 12.5/0.8  | --    |    972 |  27s | none             | --                             | 1024/256     |                 |
|   8 t/s |  96 k |   1 | 46/48  | 15.7 GB | 12.7/0.5  | --    |   1310 | 174s | none             | --                             | 1024/256     |                 |


model=GLM-4.7-flash-Q4_K_M_gaionaus.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=1
spec=none
draft_model=none
predict_token=1/2   # (N/M)
mtp=0
jinja=1
batch=1024
ubatch=256
_start_server


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


model=GLM-4.7-Flash-REAP-09.Q3_K_L_akicou.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=5
spec=1
draft_model=none
predict_token=24/6  # N lookup /M predict
mtp=0
jinja=0
batch=1024
ubatch=256



_start_server() {
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
}

```


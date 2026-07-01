# GLM 4.7 Flash

Max context                   : 198 k

## GLM-4.7-REAP-50 (by Akicou)
HuggingFace: https://huggingface.co/Akicou/GLM-4.7-Flash-REAP-50


https://huggingface.co/gaionaus/GLM-4.7-Flash-REAP-50_Q4_K_M_GGUF


Then see: https://huggingface.co/fy168/GLM-4.7-Flash-REAP-50_Q4_K_M_GGUF

## 1
HuggingFace: https://huggingface.co/unsloth/GLM-4.7-Flash-GGUF
Quantized by: Unsloth
File: unsloth_GLM-4.7-Flash-Q4_K_M.gguf
MoE: ?
MTP: ?
Max context: 198 k
OpenAI tools compatibility : ✔️

## REAP-23B-A3B-GGUF UD-Q4_K_XL (by Unsloth)
HuggingFace: https://huggingface.co/unsloth/GLM-4.7-Flash-REAP-23B-A3B-GGUF
File: GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL_unsloth.gguf
Size: 13.2 GB
For llama.cpp, use --jinja

OpenAI tools compatibility    : ✔️

## REAP-09.Q3_K_L (by akicou)
File: GLM-4.7-Flash-REAP-09.Q3_K_L_akicou.gguf
OpenAI tools compatibility    : ❌

## REAP-19.Q4_K_M (by akicou)
HuggingFace: 
File: GLM-4.7-Flash-REAP-19.Q4_K_M_akicou.gguf
Quantized by: Akicou
Size: 13.9 GB
Max context                   : 198 k
OpenAI tools compatibility    : ❌
More that 64


| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL_unsloth.gguf
|            64 k
|  42 t/s |  64 k |   4 | 48/48  | 14.4 GB | 12.3/0.8  | --    |   2048 |  49s | none             | --                             | 1024/256     |                 |
|  40 t/s |  64 k |   5 | 48/48  | 14.1 GB | 12.0/1.1  | --    |   1071 |  27s | none             | --                             | 768/256      |                 |
|  39 t/s |  64 k |   5 | 48/48  | 14.1 GB | 12.0/1.1  | --    |   1306 |  33s | none             | --                             | 1024/256     |                 |
|  39 t/s |  64 k |   5 | 48/48  | 14.1 GB | 12.0/1.1  | --    |   1306 |  33s | none             | --                             | 512/256      |                 |
|            96 k
|  36 t/s |  96 k |   5 | 48/48  | 15.0 GB | 12.0/1.1  | --    |   1306 |  36s | none             | --                             | 1024/256     |                 |
|  35 t/s |  96 k |   6 | 48/48  | 14.8 GB | 11.8/1.3  | --    |    904 |  25s | none             | --                             | 1024/256     |                 |
|  34 t/s |  96 k |   6 | 48/48  | 14.8 GB | 11.8/1.3  | --    |   1275 |  38s | none             | --                             | 1024/384     |                 |
|  30 t/s |  96 k |   6 | 48/48  | 14.8 GB | 11.8/1.3  | --    |    904 |  30s | none             | --                             | 512/256      |                 |
|           128 k  ❌ ERROR: Aborted_Low_Speed_Detected_4.64_ts

| ❌ GLM-4.7-Flash-REAP-19.Q4_K_M_akicou.gguf
|  44 t/s |  64 k |   4 | 48/48  | 15.0 GB | 12.9/0.9  | --    |   2048 |  47s | none             | --                             | 1024/256     |                 |
|  42 t/s |  64 k |   5 | 48/48  | 14.7 GB | 12.6/1.2  | --    |   2048 |  49s | DFlash (N-gram)  | s_M=2 s_N=4 min=1              | 1024/256     |                 |
|  42 t/s |  80 k |   5 | 48/48  | 15.2 GB | 12.6/1.2  | --    |   2048 |  48s | DFlash (N-gram)  | s_M=6 s_N=24 min=1             | 1024/256     |                 |
|  41 t/s |  80 k |   5 | 48/48  | 15.2 GB | 12.6/1.2  | --    |   2048 |  50s | DFlash (N-gram)  | s_M=4 s_N=12 min=1             | 1024/256     |                 |
|  41 t/s |  80 k |   5 | 48/48  | 15.2 GB | 12.6/1.2  | --    |   2048 |  50s | DFlash (N-gram)  | s_M=6 s_N=24 min=1             | 1024/256     |                 |
|  39 t/s |  80 k |   5 | 48/48  | 15.2 GB | 12.6/1.2  | --    |   2048 |  52s | none             | --                             | 1024/256     |                 |
| ❌ GLM-4.7-Flash-REAP-19.Q4_K_M_akicou.gguf
|  36 t/s |  64 k |   5 | 48/48  | 14.2 GB | 12.1/1.1  | --    |   2048 |  56s | DFlash (N-gram)  | s_M=6 s_N=24 min=1             | 1024/256     |                 |


| unsloth_GLM-4.7-Flash-REAP-23B-A3B-Q4_K_M.gguf
|  34 t/s | 128 k | 48/48 |   7 | 15.4 GB | ---   |   1026 |  30s | DFlash (N-gram)  | size_M=30 size_N=30 min_hits=1 | 2048/256     | 11.4/1.6  |                 |
|  33 t/s | 128 k | 48/48 |   8 | 15.2 GB | ---   |    971 |  30s | DFlash (N-gram)  | size_M=30 size_N=30 min_hits=1 | 2048/256     | 11.1/1.8  |                 |
|  33 t/s | 128 k | 48/48 |   8 | 15.2 GB | ---   |   1159 |  35s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 2048/256     | 11.1/1.8  |                 |
|  32 t/s | 128 k | 48/48 |   8 | 15.2 GB | ---   |    942 |  29s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 11.1/1.8  |                 |
|  33 t/s |  96 k | 48/48 |   8 | 14.3 GB | ---   |    951 |  28s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 11.1/1.8  |                 |
|  31 t/s |  96 k | 48/48 |   9 | 14.0 GB | ---   |   1008 |  32s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 10.9/2.1  |                 |
|  27 t/s |  96 k | 48/48 |  11 | 13.5 GB | ---   |    726 |  27s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 10.4/2.6  |                 |
|  27 t/s |  64 k | 48/48 |  11 | 12.6 GB | ---   |    917 |  34s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 10.4/2.6  |                 |

| unsloth_GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL.gguf
|  44 t/s |  96 k | 48/48 |   4 | 15.5 GB | ---   |    969 |  22s | none             | --                             | 1024/384     | 12.3/0.8  |                 |
|  44 t/s |  96 k | 48/48 |   4 | 15.3 GB | ---   |    931 |  22s | none             | --                             | 1024/128     | 12.3/0.8  |                 |
|  44 t/s |  96 k | 48/48 |   4 | 15.4 GB | ---   |    989 |  23s | none             | --                             | 2048/256     | 12.3/0.8  |                 |
|  40 t/s |  96 k | 48/48 |   5 | 15.1 GB | ---   |   1145 |  29s | none             | --                             | 2048/256     | 12.0/1.1  |                 |

|  41 t/s |  64 k | 48/48 |   5 | 14.2 GB | ---   |   1035 |  25s | none             | --                             | 2048/256     | 12.0/1.1  |                 |
|  36 t/s |  64 k | 48/48 |   7 | 13.7 GB | ---   |    967 |  27s | DFlash (N-gram)  | size_M=6 size_N=10 min_hits=1  | 2048/256     | 11.5/1.6  |                 |
|  35 t/s |  64 k | 48/48 |   7 | 13.7 GB | ---   |   1038 |  29s | DFlash (N-gram)  | size_M=6 size_N=10 min_hits=1  | 2048/256     | 11.5/1.6  |                 |
|  34 t/s |  64 k | 48/48 |   7 | 13.7 GB | ---   |   2048 |  60s | DFlash (N-gram)  | size_M=8 size_N=8 min_hits=1   | 2048/256     | 11.5/1.6  |                 |
|  36 t/s |  64 k | 48/48 |   7 | 13.7 GB | ---   |    974 |  28s | DFlash (N-gram)  | size_M=6 size_N=8 min_hits=1   | 2048/256     | 11.5/1.6  |                 |
|  31 t/s |  64 k | 48/48 |   7 | 13.7 GB | ---   |   1096 |  35s | DFlash (N-gram)  | size_M=8 size_N=8 min_hits=1   | 2048/256     | 11.5/1.6  |                 |
|  28 t/s |  64 k | 48/48 |   7 | 13.7 GB | ---   |   1045 |  37s | DFlash (N-gram)  | size_M=10 size_N=6 min_hits=1  | 2048/256     | 11.5/1.6  |                 |



## Run tests

```bash
cd scripts

#model=unsloth_GLM-4.7-Flash-Q4_K_M.gguf
#model=unsloth_GLM-4.7-Flash-REAP-23B-A3B-Q4_K_M.gguf

model=GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL_unsloth.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=4
spec=0
draft_model=none
predict_token=12/6  # N lookup /M predict
mtp=0
jinjia=1
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



model=GLM-4.7-Flash-REAP-19.Q4_K_M_akicou.gguf
ctx_k=80
gpu_layers=999
cpu_moe=5
spec=1
draft_model=none
predict_token=24/6  # N lookup /M predict
mtp=0
jinjia=0
batch=1024
ubatch=256


model=GLM-4.7-Flash-REAP-09.Q3_K_L_akicou.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=5
spec=1
draft_model=none
predict_token=24/6  # N lookup /M predict
mtp=0
jinjia=0
batch=1024
ubatch=256



```


# GLM 4.7 Flash

Model: GLM 4.7 Flash
HuggingFace: https://huggingface.co/unsloth/GLM-4.7-Flash-GGUF
Quantized by: Unsloth
File: unsloth_GLM-4.7-Flash-Q4_K_M.gguf
MoE: ?
MTP: ?
Max context: 198 k
OpenAI tools compatibility : ✔️



| Speed   | Ctx   | GPU   | MoE | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | ----- | --- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
|  36 t/s |  32 k | 48/48 |  10 | 15.1 GB | ---   |   1123 |  32s | DFlash (N-gram)  | size_M=24 size_N=24 min_hits=1 | 1024/256     | 13.8/3.1  |                 |
|  33 t/s |  32 k | 48/48 |   9 | 15.4 GB | ---   |    968 |  29s | DFlash (N-gram)  | size_M=32 size_N=32 min_hits=1 | 1024/256     | 14.1/2.8  |                 |
|  32 t/s |  32 k | 48/48 |   9 | 15.4 GB | ---   |    746 |  23s | none             | --                             | 1024/256     | 14.1/2.8  |                 |
|  31 t/s |  32 k | 48/48 |  10 | 15.0 GB | ---   |   1009 |  32s | DFlash (N-gram)  | size_M=10 size_N=12 min_hits=1 | 1024/256     | 13.8/3.1  |                 |
|  30 t/s |  32 k | 48/48 |   9 | 15.4 GB | ---   |   1223 |  40s | DFlash (N-gram)  | size_M=22 size_N=24 min_hits=1 | 1024/256     | 14.1/2.8  |                 |
|  30 t/s |  32 k | 48/48 |  11 | 14.7 GB | ---   |    969 |  33s | DFlash (N-gram)  | size_M=24 size_N=24 min_hits=1 | 1024/256     | 13.4/3.5  |                 |
|  30 t/s |  32 k | 48/48 |  10 | 15.0 GB | ---   |   1068 |  36s | DFlash (N-gram)  | size_M=22 size_N=24 min_hits=1 | 1024/256     | 13.8/3.1  |                 |
|  30 t/s |  32 k | 48/48 |  10 | 15.0 GB | ---   |   1070 |  36s | DFlash (N-gram)  | size_M=8 size_N=12 min_hits=1  | 1024/256     | 13.8/3.1  |                 |
|  30 t/s |  32 k | 48/48 |  10 | 15.0 GB | ---   |    967 |  33s | none             | --                             | 1024/256     | 13.8/3.1  |                 |
|  25 t/s |  32 k | 48/48 |   0 | 13.9 GB | ---   |    794 |  32s | none             | --                             | 1024/512     | 12.5/4.3  |                 |
|   9 t/s |  32 k | 48/48 |   5 | 15.7 GB | ---   |    990 | 115s | none             | --                             | 1024/256     | 15.4/1.5  |                 |
|   7 t/s |  32 k | 48/48 |   7 | 15.7 GB | ---   |   1180 | 163s | none             | --                             | 1024/256     | 14.8/2.1  |                 |
|   4 t/s |  32 k | 48/48 |   1 | 15.7 GB | ---   |   1290 | 306s | none             | --                             | 1024/256     | 16.9/0.0  |                 |

|  28 t/s |  48 k | 48/48 |  11 | 15.2 GB | ---   |   1037 |  36s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 13.4/3.5  |                 |
|  28 t/s |  48 k | 48/48 |  11 | 15.2 GB | ---   |   1000 |  36s | DFlash (N-gram)  | size_M=20 size_N=24 min_hits=1 | 1024/256     | 13.4/3.5  |                 |
|  27 t/s |  48 k | 48/48 |  11 | 15.2 GB | ---   |   1360 |  50s | none             | --                             | 1024/256     | 13.4/3.5  |                 |
|  26 t/s |  48 k | 48/48 |  12 | 14.9 GB | ---   |    695 |  26s | DFlash (N-gram)  | size_M=32 size_N=32 min_hits=1 | 1024/256     | 13.1/3.8  |                 |
|  26 t/s |  48 k | 48/48 |  11 | 15.2 GB | ---   |   1181 |  45s | DFlash (N-gram)  | size_M=22 size_N=24 min_hits=1 | 1024/256     | 13.4/3.5  |                 |
|  17 t/s |  48 k | 48/48 |  11 | 15.2 GB | ---   |   1070 |  64s | DFlash (N-gram)  | size_M=32 size_N=32 min_hits=1 | 1024/256     | 13.4/3.5  |                 |
|  15 t/s |  48 k | 48/48 |   9 | 15.7 GB | ---   |   1079 |  69s | none             | --                             | 1024/256     | 14.1/2.8  |                 |

| unsloth_GLM-4.7-Flash-REAP-23B-A3B-Q4_K_M.gguf
|  34 t/s | 128 k | 48/48 |   7 | 15.4 GB | ---   |   1026 |  30s | DFlash (N-gram)  | size_M=30 size_N=30 min_hits=1 | 2048/256     | 11.4/1.6  |                 |
|  33 t/s | 128 k | 48/48 |   8 | 15.2 GB | ---   |    971 |  30s | DFlash (N-gram)  | size_M=30 size_N=30 min_hits=1 | 2048/256     | 11.1/1.8  |                 |
|  33 t/s | 128 k | 48/48 |   8 | 15.2 GB | ---   |   1159 |  35s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 2048/256     | 11.1/1.8  |                 |
|  32 t/s | 128 k | 48/48 |   8 | 15.2 GB | ---   |    942 |  29s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 11.1/1.8  |                 |
|  33 t/s |  96 k | 48/48 |   8 | 14.3 GB | ---   |    951 |  28s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 11.1/1.8  |                 |
|  31 t/s |  96 k | 48/48 |   9 | 14.0 GB | ---   |   1008 |  32s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 10.9/2.1  |                 |
|  27 t/s |  96 k | 48/48 |  11 | 13.5 GB | ---   |    726 |  27s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 10.4/2.6  |                 |
|  27 t/s |  64 k | 48/48 |  11 | 12.6 GB | ---   |    917 |  34s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 10.4/2.6  |                 |
|  26 t/s |  48 k | 48/48 |  11 | 12.1 GB | ---   |   1042 |  39s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 10.4/2.6  |                 |

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
model=unsloth_GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL.gguf
ctx_k=96
gpu_layers=-1
cpu_moe=4
spec=0
draft_model=none
predict_token=4/2  # N lookup /M predict
mtp=0
jinjia=0
batch=1024
ubatch=384

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

source test_models_common.sh && test_call_result_row

```
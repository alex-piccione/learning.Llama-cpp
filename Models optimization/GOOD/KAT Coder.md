# KAT Coder

| File                                                   | Result                                |
| ---                                                    | ---                                   |
| KAT-Coder-V2.5-Dev_Q3_K_M_imatrix_MTP_offmonreal.gguf  | ✔️ 40 t/s (64k) / 40 t/s (52k) Q8     |
| KAT-Coder-V2.5-Dev-Cerebellum-14GB-v2_deucebucket.gguf | ✔️ 45 t/s (160k)                      |
| KAT-Coder-V2.5-Dev_Q2_K-AllGPU_offmonreal.gguf         | ✔️ 50 t/s (160k)                      |
| KAT-Coder-V2.5-Dev-APEX-dynamic-v2_myric.gguf          | ✔️ 40 t/s (192k)                      |
| KAT-Coder-V2.5-Dev-MTP-MXFP4_MOE_noctrex.gguf          | ❌ Too slow                           |


## ✔️ Q3_K_M imatrix MTP (offmonreal)
KAT-Coder-V2.5-Dev_Q3_K_M_imatrix_MTP_offmonreal.gguf               16.8 GB   
https://huggingface.co/offmonreal/KAT-Coder-V2.5-Dev-MaxQuality-MTP-GGUF

## ✔️ MTP APEX (Myric)
KAT-Coder-V2.5-Dev-APEX-dynamic-v2_myric.gguf                       11.9 GB
https://huggingface.co/Myric/KAT-Coder-V2.5-Dev-MTP-APEX-GGUF

## ✔️ Q2_K (offmonreal)
KAT-Coder-V2.5-Dev_Q2_K-AllGPU_offmonreal.gguf                      13.0 GB

## ✔️ Cerebellum-14GB-V2 (deucebucket)
KAT-Coder-V2.5-Dev-Cerebellum-14GB-v2_deucebucket.gguf              11.8 GB
https://huggingface.co/deucebucket/KAT-Coder-V2.5-Dev-Cerebellum-GGUF

## ❌ MTP-MXFP4_MOE (noctrex)
KAT-Coder-V2.5-Dev-MTP-MXFP4_MOE_noctrex.gguf                       19.0 GB
https://huggingface.co/noctrex/KAT-Coder-V2.5-Dev-MXFP4_MOE-GGUF
Too slow

```bash

model=KAT-Coder-V2.5-Dev_Q3_K_M_imatrix_MTP_offmonreal.gguf
ctx_k=56
gpu_layers=99
cpu_moe=3
quant=q8_0
spec=none
draft_model=none
predict_token=0/0
jinja=0
batch=1024
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  51 t/s |  64 k |   2 | 42/42 | 15.7 | 14.9/0.0  | q4_0 (none) |    674 |  13s | none                                 -- |  1024/256 |                   |
|  47 t/s |  64 k |   3 | 42/42 | 15.4 | 14.5/0.0  | q4_0 (none) |    572 |  13s | none                                 -- |  1024/256 |                   |
|  47 t/s |  60 k |   3 | 42/42 | 15.3 | 14.5/0.0  | q4_0 (none) |    572 |  13s | none                                 -- |  1024/256 |                   |
|  47 t/s |  56 k |   3 | 42/42 | 15.3 | 14.5/0.0  | q4_0 (none) |    572 |  12s | none                                 -- |  1024/256 |                   |
|  48 t/s |  52 k |   3 | 42/42 | 15.3 | 14.5/0.0  | q4_0 (none) |    572 |  12s | none                                 -- |  1024/256 |                   |
|  21 t/s |  52 k |   3 | 42/42 | 15.3 | 14.5/0.0  | q4_0 (none) |    729 |  35s | N-gram              N=4 M=6 min=1 (43%) |  1024/256 |                   |

|  47 t/s |  52 k |   3 | 42/42 | 15.6 | 14.5/0.1  | q8_0 (none) |    673 |  15s | none                                 -- |  1024/512 |                   |
|  49 t/s |  48 k |   2 | 42/42 | 15.7 | 14.9/0.1  | q8_0 (none) |    699 |  14s | none                                 -- |  1024/512 |                   |
|  27 t/s |  52 k |   2 | 42/42 | 15.7 | 14.9/0.1  | q8_0 (none) |    699 |  25s | none                                 -- |  1024/512 |                   |

|  52 t/s |  48 k |   2 | 42/42 | 15.7 | 14.9/0.1  | q4_0 (none) |    647 |  12s | none                                 -- |  1024/512 |                   |
|  32 t/s |  48 k |   3 | 42/42 | 15.2 | 14.5/0.0  | q4_0 (none) |    669 |  21s | N-gram            N=10 M=12 min=1 (38%) |  1024/256 |                   |
|  30 t/s |  48 k |   3 | 42/42 | 15.2 | 14.5/0.0  | q4_0 (none) |    637 |  21s | N-gram             N=8 M=12 min=1 (42%) |  1024/256 |                   |
|  20 t/s |  48 k |   3 | 42/42 | 15.2 | 14.5/0.0  | q4_0 (none) |    731 |  37s | N-gram              N=4 M=8 min=1 (35%) |  1024/256 |                   |
|  14 t/s |  48 k |   3 | 42/42 | 15.2 | 14.5/0.0  | q4_0 (none) |    579 |  43s | N-gram              N=2 M=3 min=1 (44%) |  1024/256 |                   |

|  51 t/s |  32 k |   2 | 42/42 | 15.6 | 14.9/0.0  | q4_0 (none) |    647 |  13s | none                                 -- |  1024/512 |                   |
|  48 t/s |  32 k |   3 | 42/42 | 15.1 | 14.5/0.0  | q4_0 (none) |    791 |  16s | none                                 -- |  1024/512 |                   |
|  47 t/s |  32 k |   3 | 42/42 | 15.2 | 14.5/0.0  | q4_0 (none) |    791 |  17s | none                                 -- |  1024/512 |                   |
|  39 t/s |  32 k |   6 | 42/42 | 14.2 | 13.5/0.0  | q4_0 (none) |    696 |  18s | none                                 -- |  1024/512 |                   |
|  35 t/s |  32 k |   8 | 42/42 | 13.5 | 12.7/0.0  | q4_0 (none) |    642 |  18s | none                                 -- |  1024/512 |                   |
|  31 t/s |  32 k |  10 | 42/42 | 12.8 | 12.0/0.0  | q4_0 (none) |    684 |  22s | none                                 -- |  1024/512 |                   |
|  31 t/s |  32 k |   6 | 42/42 | 15.5 | 14.3/0.0  | q4_0 (q4_0) |    821 |  27s | MTP        min=4 max=5 p_min=0.20 (52%) |  1024/512 |                   |
|  29 t/s |  32 k |   7 | 42/42 | 15.2 | 13.9/0.0  | q4_0 (q4_0) |    678 |  24s | MTP        min=4 max=6 p_min=0.20 (53%) |  1024/512 |                   |
|  25 t/s |  32 k |   6 | 40/42 | 15.4 | 14.2/0.1  | q4_0 (q4_0) |   1040 |  41s | MTP        min=2 max=3 p_min=0.20 (71%) |  1024/512 |                   |
|  12 t/s |  32 k |   5 | 40/42 | 15.7 | 14.6/0.2  | q4_0 (q4_0) |    578 |  49s | MTP       min=8 max=10 p_min=0.20 (39%) |  1024/512 |                   |
|  10 t/s |  32 k |   5 | 37/42 | 15.7 | 14.5/0.2  | q4_0 (q4_0) |    685 |  70s | MTP       min=8 max=10 p_min=0.20 (36%) |  1024/512 |                   |

model=KAT-Coder-V2.5-Dev-APEX-dynamic-v2_myric.gguf
ctx_k=192
gpu_layers=99
cpu_moe=0
quant=q8_0
spec=none
draft_model=none
predict_token=0/0
jinja=1
batch=2048
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  60 t/s | 128 k |   0 | 41/41 | 14.7 | 11.5/0.1  | bf16 (none) |    574 |   9s | none                                 -- |  2048/512 |                   |
|  59 t/s | 192 k |   0 | 41/41 | 14.6 | 11.5/0.4  | q8_0 (none) |    549 |   9s | none                                 -- | 2048/1024 |                   |

|  61 t/s | 160 k |   0 | 41/41 | 13.9 | 11.5/0.2  | q8_0 (none) |    582 |   9s | none                                 -- |  1024/512 |                   |
|  60 t/s | 160 k |   0 | 41/41 | 14.1 | 11.5/0.3  | q8_0 (none) |    549 |  10s | none                                 -- | 2048/1024 |                   |
|  59 t/s | 160 k |   0 | 41/41 | 13.9 | 11.5/0.2  | q8_0 (none) |    582 |  10s | none                                 -- |  1024/512 |                   |

|  32 t/s | 160 k |   0 | 41/41 | 13.2 | 11.5/0.2  | q4_0 (none) |    523 |  16s | N-gram             N=6 M=10 min=1 (43%) |  1024/512 |                   |
|  27 t/s | 160 k |   0 | 41/41 | 13.2 | 11.5/0.2  | q4_0 (none) |   1007 |  37s | N-gram              N=3 M=4 min=1 (68%) |  1024/512 |                   |
|  23 t/s | 160 k |   0 | 41/41 | 13.9 | 11.5/0.2  | q8_0 (none) |    571 |  26s | N-gram              N=3 M=4 min=1 (52%) |  1024/512 |                   |


model=KAT-Coder-V2.5-Dev_Q2_K-AllGPU_offmonreal.gguf
ctx_k=160
gpu_layers=99
cpu_moe=0
spec=none
draft_model=none
predict_token=4/6
jinja=1
batch=1024
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  72 t/s | 160 k |   0 | 42/42 | 14.3 | 11.9/0.2  | q8_0 (none) |    996 |  14s | none                                 -- |  1024/512 |                   |

|  71 t/s | 128 k |   0 | 42/42 | 13.9 | 11.9/0.1  | q8_0 (none) |    996 |  14s | none                                 -- |  1024/512 |                   |

|  72 t/s |  96 k |   0 | 42/42 | 13.5 | 11.9/0.1  | q8_0 (none) |    996 |  14s | none                                 -- |  1024/512 |                   |
|  53 t/s |  96 k |   0 | 42/42 | 15.1 | 12.8/0.1  | q8_0 (q8_0) |   1031 |  20s | MTP        min=4 max=6 p_min=0.20 (57%) |  1024/512 |                   |
|  52 t/s |  96 k |   0 | 42/42 | 14.9 | 12.8/0.1  | q8_0 (q8_0) |    552 |  10s | MTP        min=2 max=3 p_min=0.20 (73%) |  1024/512 |                   |
|  40 t/s |  96 k |   0 | 42/42 | 14.8 | 12.8/0.1  | q8_0 (q5_0) |    549 |  14s | MTP        min=3 max=6 p_min=0.20 (54%) |  1024/512 |                   |
|  37 t/s |  96 k |   0 | 42/42 | 14.8 | 12.8/0.1  | q8_0 (q5_0) |   1035 |  28s | MTP        min=4 max=6 p_min=0.20 (55%) |  1024/512 |                   |
|  34 t/s |  96 k |   0 | 42/42 | 13.5 | 11.9/0.1  | q8_0 (none) |    997 |  29s | N-gram              N=4 M=6 min=1 (69%) |  1024/512 |                   |

|  71 t/s |  80 k |   0 | 42/42 | 13.3 | 11.9/0.1  | q8_0 (none) |    996 |  14s | none                                 -- |  1024/512 |                   |
|  69 t/s |  80 k |   0 | 42/42 | 13.3 | 11.9/0.1  | q8_0 (none) |    996 |  14s | none                                 -- |  1024/512 |                   |
|  56 t/s |  80 k |   0 | 42/42 | 14.7 | 12.8/0.1  | q8_0 (q8_0) |    988 |  17s | MTP        min=3 max=4 p_min=0.20 (69%) |  1024/512 |                   |



model=KAT-Coder-V2.5-Dev-Cerebellum-14GB-v2_deucebucket.gguf
ctx_k=192
gpu_layers=99
cpu_moe=0
spec=0
draft_model=none
predict_token=0/0
jinja=0
batch=1024
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  68 t/s | 192 k |   0 | 41/41 | 14.5 | 11.6/0.2  | q8_0  |   1223 |  18s | none                          -- |  1024/512 |            |
|  68 t/s | 160 k |   0 | 41/41 | 14.1 | 11.6/0.2  | q8_0  |    643 |  10s | none                          -- |  1024/512 |            |
|  68 t/s | 128 k |   0 | 41/41 | 13.6 | 11.6/0.1  | q8_0  |    643 |   9s | none                          -- |  1024/512 |            |
|  65 t/s | 128 k |   0 | 41/41 | 13.5 | 11.6/0.1  | q8_0  |   1007 |  16s | none                          -- |   512/256 |            |
|  68 t/s |  96 k |   0 | 41/41 | 13.2 | 11.6/0.1  | q8_0  |    643 |   9s | none                          -- |  1024/512 |            |


model=KAT-Coder-V2.5-Dev-MTP-MXFP4_MOE_noctrex.gguf
ctx_k=48
gpu_layers=99
cpu_moe=9
spec=draft-mtp
draft_model=none
predict_token=2/3
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  19 t/s |  64 k |  10 | 42/42 | 15.7 | 14.5/0.0  | q4_0 (q4_0) |    673 |  36s | MTP        min=2 max=3 p_min=0.20 (73%) |  1024/256 |                   |
|  19 t/s |  64 k |  11 | 42/42 | 15.5 | 14.1/0.0  | q4_0 (q4_0) |    644 |  34s | MTP        min=2 max=3 p_min=0.20 (76%) |  1024/256 |                   |
|  19 t/s |  64 k |  11 | 42/42 | 15.5 | 14.1/0.0  | q4_0 (q4_0) |    681 |  36s | MTP        min=3 max=4 p_min=0.20 (67%) |  1024/256 |                   |
|  18 t/s |  64 k |  11 | 42/42 | 15.6 | 14.1/0.0  | q4_0 (q4_0) |    640 |  35s | MTP        min=4 max=5 p_min=0.20 (60%) |  1024/256 |                   |
|  17 t/s |  64 k |  12 | 42/42 | 15.2 | 13.7/0.1  | q4_0 (q4_0) |    621 |  37s | MTP        min=3 max=4 p_min=0.20 (67%) |  1024/512 |                   |
|  16 t/s |  64 k |  12 | 39/42 | 15.3 | 13.6/0.1  | q8_0 (q4_0) |    511 |  31s | MTP        min=3 max=4 p_min=0.20 (68%) |  1024/512 |                   |
|  16 t/s |  64 k |  10 | 42/42 | 15.7 | 14.5/0.0  | q8_0 (q4_0) |    511 |  33s | MTP        min=2 max=3 p_min=0.20 (73%) |  1024/256 |                   |
|  16 t/s |  64 k |  11 | 42/42 | 15.6 | 14.1/0.0  | q4_0 (q4_0) |    707 |  43s | MTP        min=1 max=5 p_min=0.20 (59%) |  1024/256 |                   |


| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  17 t/s |  64 k |  12 | 42/42 | 15.6 | 13.7/0.1  | q8_0  |    621 |  37s | MTP min=4 max=5 p_min=0.70 (81%) |  1024/512 |            |
|  16 t/s |  64 k |  13 | 42/42 | 15.2 | 13.3/0.1  | q8_0  |    572 |  35s | MTP min=4 max=5 p_min=0.70 (83%) |  1024/512 |            |
|  13 t/s |  64 k |  11 | 42/42 | 15.7 | 14.1/0.1  | q8_0  |    792 |  60s | MTP min=3 max=4 p_min=0.70 (88%) |  1024/512 |            |
|  12 t/s |  64 k |  10 | 42/42 | 15.7 | 14.5/0.1  | q8_0  |    527 |  43s | MTP min=3 max=4 p_min=0.70 (90%) |  1024/512 |            |
|  11 t/s |  64 k |  13 | 39/42 | 15.0 | 13.2/0.2  | q8_0  |    527 |  47s | MTP min=5 max=6 p_min=0.70 (84%) |  1024/512 |            |
|
|  27 t/s |  32 k |   9 | 42/42 | 15.4 | 14.5/0.0  | q8_0  |    527 |  20s | none                          -- |  1024/512 |            |
|  26 t/s |  32 k |  10 | 42/42 | 15.0 | 14.1/0.0  | q8_0  |    511 |  20s | none                          -- |  1024/512 |            |
|  16 t/s |  32 k |  10 | 42/42 | 15.7 | 14.5/0.0  | q8_0  |    511 |  32s | MTP min=2 max=4 p_min=0.70 (94%) |  1024/512 |            |

|  18 t/s |  60 k |   9 | 42/42 | 15.7 | 14.9/0.0  | q4_0 (q4_0) |    680 |  39s | MTP        min=1 max=2 p_min=0.20 (83%) |  1024/256 |                   |

```
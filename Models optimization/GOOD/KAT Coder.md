# KAT Coder

| File                                                   | Result                                |
| ---                                                    | ---                                   |
| KAT-Coder-V2.5-Dev-Cerebellum-14GB-v2_deucebucket.gguf | ✔️ 45 t/s (160k)                     |
| KAT-Coder-V2.5-Dev-MTP-MXFP4_MOE_noctrex.gguf          | ❌ Too slow                          |


## ✔️ Cerebellum-14GB-V2 (deucebucket)
KAT-Coder-V2.5-Dev-Cerebellum-14GB-v2_deucebucket.gguf                 11.8 GB
https://huggingface.co/deucebucket/KAT-Coder-V2.5-Dev-Cerebellum-GGUF


## ❌ MTP-MXFP4_MOE (noctrex)
KAT-Coder-V2.5-Dev-MTP-MXFP4_MOE_noctrex.gguf                          19.0 GB
https://huggingface.co/noctrex/KAT-Coder-V2.5-Dev-MXFP4_MOE-GGUF
Too slow

```bash

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
ctx_k=64
gpu_layers=39
cpu_moe=9
spec=mtp
draft_model=none
predict_token=5/6
jinja=0
batch=1024
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  27 t/s |  32 k |   9 | 42/42 | 15.4 | 14.5/0.0  | q8_0  |    527 |  20s | none                          -- |  1024/512 |            |
|  26 t/s |  32 k |  10 | 42/42 | 15.0 | 14.1/0.0  | q8_0  |    511 |  20s | none                          -- |  1024/512 |            |
|  16 t/s |  32 k |  10 | 42/42 | 15.7 | 14.5/0.0  | q8_0  |    511 |  32s | MTP min=2 max=4 p_min=0.70 (94%) |  1024/512 |            |

|  17 t/s |  64 k |  12 | 42/42 | 15.6 | 13.7/0.1  | q8_0  |    621 |  37s | MTP min=4 max=5 p_min=0.70 (81%) |  1024/512 |            |
|  16 t/s |  64 k |  13 | 42/42 | 15.2 | 13.3/0.1  | q8_0  |    572 |  35s | MTP min=4 max=5 p_min=0.70 (83%) |  1024/512 |            |
|  13 t/s |  64 k |  11 | 42/42 | 15.7 | 14.1/0.1  | q8_0  |    792 |  60s | MTP min=3 max=4 p_min=0.70 (88%) |  1024/512 |            |
|  12 t/s |  64 k |  10 | 42/42 | 15.7 | 14.5/0.1  | q8_0  |    527 |  43s | MTP min=3 max=4 p_min=0.70 (90%) |  1024/512 |            |
|  11 t/s |  64 k |  13 | 39/42 | 15.0 | 13.2/0.2  | q8_0  |    527 |  47s | MTP min=5 max=6 p_min=0.70 (84%) |  1024/512 |            |


```
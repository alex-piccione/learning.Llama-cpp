# KAT Coder

| File                                                   | Result                                |
| ---                                                    | ---                                   |
| KAT-Coder-V2.5-Dev-Cerebellum-14GB-v2_deucebucket.gguf | 45 t/s (128k) 


##
KAT-Coder-V2.5-Dev-Cerebellum-14GB-v2_deucebucket.gguf              
https://huggingface.co/deucebucket/KAT-Coder-V2.5-Dev-Cerebellum-GGUF


##
https://huggingface.co/noctrex/KAT-Coder-V2.5-Dev-MXFP4_MOE-GGUF


```bash

model=KAT-Coder-V2.5-Dev-Cerebellum-14GB-v2_deucebucket.gguf
ctx_k=160
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
|  68 t/s | 160 k |   0 | 41/41 | 14.1 | 11.6/0.2  | q8_0  |    643 |  10s | none                          -- |  1024/512 |            |
|  68 t/s | 128 k |   0 | 41/41 | 13.6 | 11.6/0.1  | q8_0  |    643 |   9s | none                          -- |  1024/512 |            |
|  65 t/s | 128 k |   0 | 41/41 | 13.5 | 11.6/0.1  | q8_0  |   1007 |  16s | none                          -- |   512/256 |            |
|  68 t/s |  96 k |   0 | 41/41 | 13.2 | 11.6/0.1  | q8_0  |    643 |   9s | none                          -- |  1024/512 |            |

```
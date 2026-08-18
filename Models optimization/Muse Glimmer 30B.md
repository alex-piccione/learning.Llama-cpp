# Muse Glimmer 30B

| File                                                    | Result                             |
| ---                                                     |                                    |
| Muse-Glimmer-30B-MIX20_Q3Q4_capefm.gguf                 |


## 
Muse-Glimmer-30B-MIX20_Q3Q4_capefm.gguf                   13.2 GB
Always use 2000 tokens for the test  ?!


```bash

model=Muse-Glimmer-30B-MIX20_Q3Q4_capefm.gguf
ctx_k=96
gpu_layers=99
cpu_moe=5
spec=0
draft_model=none
predict_token=0/0
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  17 t/s |  96 k |   7 | 53/53 | 13.6 | 12.6/0.1  | q8_0  |   2048 | 122s | none                          -- |  1024/256 |            |
|  17 t/s |  64 k |   6 | 53/53 | 13.3 | 12.6/0.0  | q8_0  |   2048 | 122s | none                          -- |  1024/256 |            |
|  17 t/s |  64 k |   7 | 53/53 | 13.3 | 12.6/0.0  | q8_0  |   2048 | 122s | none                          -- |  1024/256 |            |

```
# Qwen 3.8 27B

| File                                                       | Result                                      |
|------------------------------------------------------------|---------------------------------------------|
| Qwen3.8-27B-IQ4_XS_unsloth.gguf                            | ❌ Toos low. Unusable.                      |
| Qwen3.8-27B-YMQ-M_zerodigest.gguf                          | ❌ Rubbish                                  |


## MTP  ()
https://huggingface.co/Jackrong/Qwen3.8-27B-MTP-GGUF
Try Q4 and Q3 !


## ❌ YMQ-M (zerodigest)
Qwen3.8-27B-YMQ-M_zerodigest.gguf
https://huggingface.co/zerodigest/Qwen3.8-27B-YMQ-MTP-GGUF
20 t/s. Not pass simple test (more than 2000 tokens)

## ❌ IQ4_XS (Unsloth)
Qwen3.8-27B-IQ4_XS_unsloth.gguf 

```bash

model=Qwen3.8-27B-YMQ-M_zerodigest.gguf
ctx_k=64
gpu_layers=99
cpu_moe=0
spec=mtp
draft_model=none
predict_token=3/4
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  23 t/s |  64 k |   0 | 66/66 | 15.7 | 13.1/0.0  | q4_0  |   2048 |  90s | MTP     2/4             -- (87%) |   512/256 |            |
|  17 t/s |  64 k |   0 | 66/66 | 15.7 | 13.1/0.0  | q4_0  |   2048 | 122s | MTP     3/4             -- (75%) |  1024/256 |            |
|  16 t/s |  64 k |   0 | 66/66 | 14.9 | 13.1/0.0  | q4_0  |   1468 |  89s | none                          -- |   512/256 |            |


model=Qwen3.8-27B-IQ4_XS_unsloth.gguf 
ctx_k=64
gpu_layers=99
cpu_moe=0
spec=none
draft_model=none
predict_token=4/6
jinja=0
batch=512
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  16 t/s |  64 k |   0 | 66/66 | 15.7 | 14.0/0.0  | q4_0  |    650 |  41s | none                          -- |   512/256 |            |

```
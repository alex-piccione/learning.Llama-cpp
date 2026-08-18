# Qwen 3.8 27B

| File                                                       | Result                                      |
|------------------------------------------------------------|---------------------------------------------|
| Qwen3.8-27B-IQ4_XS_unsloth.gguf                            | ❌ Toos low. Unusable.                      |
| Qwen3.8-27B-YMQ-M_zerodigest.gguf                          | ❌ Rubbish                                  |

**REGERENCE for better performance:**  
https://www.reddit.com/r/LocalLLaMA/comments/1vqrt86/after_pushing_1m_tokens_through_qwen_38_27b_here/


## MTP  ()
https://huggingface.co/Jackrong/Qwen3.8-27B-MTP-GGUF
Try Q4 and Q3 !


## 
Qwen3.8-27B-UD-Q3_K_XL_unsloth.gguf                       12.5 GB



## ❌ YMQ-M (zerodigest)
Qwen3.8-27B-YMQ-M_zerodigest.gguf
https://huggingface.co/zerodigest/Qwen3.8-27B-YMQ-MTP-GGUF
20 t/s. Not pass simple test (more than 2000 tokens)

## ❌ IQ4_XS (Unsloth)
Qwen3.8-27B-IQ4_XS_unsloth.gguf 

```bash



model=Qwen3.8-27B-UD-Q3_K_XL_unsloth.gguf
ctx_k=96
gpu_layers=99
cpu_moe=0
spec=mtp
draft_model=none
predict_token=3/4
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | -------------------------------- | --------- |----------- |
|  43 t/s |  96 k |   0 | 66/66 | 15.7 | 12.0/0.1  | q4_0 (q4_0) |   1409 |  33s | MTP min=3 max=4 p_min=0.20 (85%) |  1024/512 |            |
|  41 t/s |  96 k |   0 | 66/66 | 15.6 | 12.0/0.1  | q4_0 (q4_0) |    911 |  22s | MTP min=3 max=4 p_min=0.20 (80%) |  1024/256 |            |
|  36 t/s |  96 k |   0 | 66/66 | 15.7 | 12.0/0.1  | q4_0 (q8_0) |   1409 |  39s | MTP min=3 max=4 p_min=0.20 (84%) |  1024/512 |            |
|  30 t/s |  96 k |   0 | 66/66 | 15.4 | 12.0/0.1  | q4_0 (q5_1) |   1409 |  47s | MTP min=3 max=4 p_min=0.20 (84%) |  1024/512 |            |

|  42 t/s |  80 k |   0 | 66/66 | 15.2 | 12.0/0.0  | q4_0 (q4_0) |    911 |  22s | MTP min=3 max=4 p_min=0.20 (80%) |  1024/256 |            |

|  43 t/s |  64 k |   0 | 66/66 | 14.9 | 12.0/0.1  | q4_0 (q4_0) |   1409 |  33s | MTP min=3 max=4 p_min=0.20 (85%) |  1024/512 |            |
|  43 t/s |  64 k |   0 | 66/66 | 15.0 | 12.0/0.1  | q4_0 (q8_0) |   1409 |  33s | MTP min=3 max=4 p_min=0.20 (84%) |  1024/512 |            |

|  30 t/s |  64 k |   0 | 66/66 | 14.7 | 12.0/0.1  | q4_0 (q5_1) |   1409 |  46s | MTP min=3 max=4 p_min=0.20 (84%) |  1024/512 |            |
|  28 t/s |  64 k |   0 | 66/66 | 14.7 | 12.0/0.1  |     (none) |   1509 |  53s | MTP        min=3 max=4 p_min=0.20 (76%) |  1024/512 |            |
|  42 t/s |  64 k |   0 | 66/66 | 15.1 | 12.0/0.0  | q4_0 (q4_0) |    911 |  22s | MTP min=5 max=6 p_min=0.20 (71%) |  1024/256 |            |
|  34 t/s |  64 k |   0 | 66/66 | 14.7 | 12.0/0.0  | q4_0 (????) |    828 |  25s | MTP min=3 max=4 p_min=0.70 (91%) |  1024/256 |            |
|  31 t/s |  64 k |   0 | 66/66 | 15.0 | 12.0/0.0  | q4_0 (????) |    838 |  27s | MTP min=5 max=6 p_min=0.70 (85%) |  1024/256 |            |
|  24 t/s |  64 k |   0 | 66/66 | 15.3 | 12.0/0.1  | q4_0 (????) |   1670 |  70s | MTP min=7 max=8 p_min=0.20 (58%) |  1024/512 |            |
|  17 t/s |  64 k |   0 | 66/66 | 13.6 | 11.8/0.0  | q4_0        |   1741 | 100s | none                          -- |  1024/256 |            |


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
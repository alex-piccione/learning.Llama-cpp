# Wen 3.5 27B

3.5 models are smaller than 3.6 models, allowing more context.  
I think 3.5 models require the --jinja parameter.

| File                                                  | Result                                      |
| ---                                                   | ---                                         |
| Qwen3.5-27B-IQ4_XS_unsloth.gguf                       | ✔️ 64k 16 t/s                              |
| Qwen3.5-27B-IQ3_M_gammaception.gguf                   |  128k 17 t/s                      |
| Qwen3.5-27B-UD-Q3_K_XL_unsloth.gguf                   | 
       


## ✔️ Qwen3.5-27B-IQ4_XS_unsloth.gguf
Qwen3.5-27B-IQ4_XS_unsloth.gguf                            13.9 GB
MTP: NO

## ✔️ IQ3_K_M (Gammaception)
Qwen3.5-27B-IQ3_M_gammaception.gguf                        12.4 GB
https://huggingface.co/Gammaception/Qwen3.5-27B-Thireus-16gb-optimized-GGUF
MTP: NO

## UD Q3_K_XL (Unsloth)
Qwen3.5-27B-UD-Q3_K_XL_unsloth.gguf                                             13.4 GB
Not tested in Pi yet because has same speed of more intelligent quantization

## Tests


```bash

model=Qwen3.5-27B-IQ4_XS_unsloth.gguf
ctx_k=80
gpu_layers=99
cpu_moe=0
spec=simple
draft_model=none
predict_token=6/10  # N/M
jinja=1
batch=1024
ubatch=256
_test_model


| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | -------------------------------- | --------- |----------- |
|  16 t/s |  80 k |   0 | 65/65 | 15.4 | 13.3/0.0  | q4_0 (none) |    806 |  52s | N-gram      N=6 M=10 min=1 (44%) |  1024/256 |            |

|  16 t/s |  64 k |   3 | 65/65 | 15.0 | 13.3/0.0  | q4_0  |    766 |  48s | none       --                |  1024/256 |            |
|  16 t/s |  64 k |   5 | 65/65 | 15.0 | 13.3/0.0  | q4_0  |    766 |  47s | none       --                |  1024/256 |            |
|  10 t/s |  64 k |   5 | 63/65 | 14.7 | 12.9/0.0  | q4_0  |    856 |  83s | none       --                |  1024/256 |            |
|  16 t/s |  64 k |   0 | 65/65 | 15.1 | 13.3/0.0  | q4_0  |    734 |  45s | N-gram   M=8 N=8 min=1 (67%) |  1024/256 |            |
|  15 t/s |  64 k |   0 | 65/65 | 15.1 | 13.3/0.0  | q4_0  |    745 |  49s | N-gram M=12 N=12 min=1 (34%) |  1024/256 |            |
|  15 t/s |  64 k |   0 | 65/65 | 15.1 | 13.3/0.0  | q4_0  |    725 |  48s | N-gram   M=8 N=6 min=1 (56%) |  1024/256 |            |
|  14 t/s |  64 k |   0 | 65/65 | 15.1 | 13.3/0.0  | q4_0  |    665 |  47s | N-gram   M=8 N=4 min=1 (50%) |  1024/256 |            |
|  14 t/s |  64 k |   0 | 65/65 | 15.1 | 13.3/0.0  | q4_0  |    704 |  52s | N-gram   M=4 N=4 min=1 (72%) |  1024/256 |            |
|  16 t/s |  64 k |   0 | 65/65 | 15.0 | 13.3/0.0  | q4_0  |    766 |  47s | N-gram       M=4 N=8 min=1   |  1024/256 |            |


model=Qwen3.5-27B-IQ3_M_gammaception.gguf
ctx_k=128
gpu_layers=99
cpu_moe=0
spec=none
draft_model=none
predict_token=3/5  # N/M
jinja=0
batch=1024
ubatch=512
_test_model


| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  17 t/s | 160 k |   0 | 65/65 | 15.7 | 11.8/0.1  | q4_0  |    690 |  40s | none                          -- |  1024/256 |            |
|  17 t/s | 128 k |   0 | 65/65 | 15.0 | 11.8/0.1  | q4_0  |    690 |  40s | none                          -- |  1024/256 |            |
|  17 t/s |  64 k |   0 | 65/65 | 13.6 | 11.8/0.0  | q4_0  |    690 |  40s | none                          -- |  1024/256 |            |
|  16 t/s |  64 k |   0 | 65/65 | 13.7 | 11.8/0.0  | q4_0  |    587 |  38s | N-gram      N=6 M=10 min=1 (50%) |  1024/256 |            |
|  17 t/s |  64 k |   0 | 65/65 | 13.7 | 11.8/0.0  | q4_0  |    763 |  46s | N-gram       N=8 M=8 min=1 (64%) |  1024/256 |            |
|  17 t/s |  64 k |   0 | 65/65 | 13.6 | 11.8/0.0  | q4_0  |    700 |  41s | N-gram      N=8 M=16 min=1 (41%) |  1024/256 |            |
|  16 t/s | 160 k |   0 | 65/65 | 15.7 | 11.8/0.1  | q4_0  |    616 |  39s | N-gram      N=8 M=16 min=1 (32%) |  1024/256 |            |
|  16 t/s | 160 k |   0 | 65/65 | 15.7 | 11.8/0.1  | q4_0  |    770 |  48s | N-gram     N=12 M=12 min=1 (26%) |  1024/256 |            |
|  13 t/s | 160 k |   0 | 65/65 | 15.7 | 11.8/0.2  | q4_0  |    705 |  56s | N-gram       N=5 M=5 min=1 (53%) |  1024/512 |            |


model=Qwen3.5-27B-UD-Q3_K_XL_unsloth.gguf
ctx_k=64
gpu_layers=99
cpu_moe=0
spec=simple
draft_model=none
predict_token=8/16  # N/M
jinja=1
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  16 t/s |  64 k |   0 | 65/65 | 14.6 | 12.8/0.0  | q4_0  |    722 |  45s | none                          -- |  1024/256 |            |
|  16 t/s |  64 k |   0 | 65/65 | 14.6 | 12.8/0.0  | q4_0  |    722 |  45s | none                          -- |  1024/256 |            |
|  16 t/s |  64 k |   0 | 65/65 | 14.6 | 12.8/0.0  | q4_0  |    605 |  39s | N-gram      N=8 M=16 min=1 (38%) |  1024/256 |            |

```


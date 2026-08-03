# Wen 3.5 27B

3.5 models are smaller than 3.6 models, allowing more context.  
I think 3.5 models require the --jinja parameter.

| File                                                       | Result                                      |
| ---                                                        | ---                                         |
| Qwen3.5-27B-IQ4_XS_unsloth.gguf                            | ✔️ 64k 16 t/s                              |
       


## Qwen3.5-27B-IQ4_XS_unsloth.gguf
Qwen3.5-27B-IQ4_XS_unsloth.gguf              13.9 GB


##
**OPTIMIZED FOR 16GB VRAM**
https://huggingface.co/Gammaception/Qwen3.5-27B-Thireus-16gb-optimized-GGUF



| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Predicion                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------- | --------- |----------- |
|  16 t/s |  32 k |   3 | 65/65 | 14.3 | 13.3/0.0  | q4_0  |    766 |  48s | none       --              |  1024/256 |            |
|  16 t/s |  64 k |   0 | 65/65 | 15.0 | 13.3/0.0  | q4_0  |    766 |  47s | none       --              |  1024/256 |            |
|  11 t/s |  64 k |   0 | 63/65 | 15.7 | 12.9/0.0  | q8_0  |    743 |  70s | none       --              |  1024/256 |            |
|  10 t/s |  64 k |   0 | 63/65 | 14.7 | 12.9/0.0  | q4_0  |    856 |  82s | none       --              |  1024/256 |            |
|   8 t/s |  64 k |   0 | 65/65 | 15.0 | 13.3/0.1  | q5_0  |    893 | 119s | none       --              |  1024/256 |            |
|  16 t/s |  48 k |   0 | 65/65 | 14.7 | 13.3/0.0  | q8_0  |    766 |  47s | none       --              |  1024/256 |            |


| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |

|  16 t/s |  96 k |   0 | 65/65  | 15.7 GB | 13.3/0.7  | --    |    760 |  47s | none             | --                             | 1024/512     | q4_0            |
|  16 t/s |  96 k |   0 | 65/65  | 15.7 GB | 13.3/0.7  | --    |    766 |  48s | none             | --                             | 1024/256     | q4_0            |

|  16 t/s |  64 k |   0 | 65/65  | 15.0 GB | 13.3/0.7  | --    |    766 |  47s | none             | --                             | 1024/256     | q4_0            |
|  15 t/s |  64 k |   0 | 65/65  | 15.1 GB | 13.3/0.7  | --    |    758 |  49s | DFlash (N-gram)  | s_M=6 s_N=6 min=1 (63%)        | 1024/256     | q4_0            |
|  15 t/s |  64 k |   0 | 65/65  | 15.1 GB | 13.3/0.7  | --    |    745 |  48s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (34%)      | 1024/256     | q4_0            |

|  16 t/s |  32 k |   0 | 65/65  | 14.3 GB | 13.3/0.7  | --    |    766 |  47s | none             | --                             | 1024/256     | q4_0            |
|  16 t/s |  32 k |   0 | 65/65  | 14.8 GB | 13.3/0.7  | --    |    750 |  46s | none             | --                             | 1024/256     |                 |
|  16 t/s |  32 k |   0 | 65/65  | 14.9 GB | 13.3/0.7  | --    |    880 |  54s | DFlash (N-gram)  | s_M=8 s_N=8 min=1 (65%)        | 1024/256     |                 |
|  16 t/s |  32 k |   1 | 65/65  | 14.8 GB | 13.3/0.7  | --    |    750 |  47s | none             | --                             | 1024/256     |                 |
|  16 t/s |  32 k |   2 | 65/65  | 14.3 GB | 13.3/0.7  | --    |    766 |  47s | none             | --                             | 1024/256     | q4_0            |
|  16 t/s |  32 k |   0 | 65/65  | 14.3 GB | 13.3/0.7  | --    |    766 |  47s | none             | --                             | 1024/256     | q4_0            |


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

|  16 t/s |  64 k |   3 | 65/65 | 15.0 | 13.3/0.0  | q4_0  |    766 |  48s | none       --                |  1024/256 |            |
|  16 t/s |  64 k |   5 | 65/65 | 15.0 | 13.3/0.0  | q4_0  |    766 |  47s | none       --                |  1024/256 |            |
|  10 t/s |  64 k |   5 | 63/65 | 14.7 | 12.9/0.0  | q4_0  |    856 |  83s | none       --                |  1024/256 |            |
|  16 t/s |  64 k |   0 | 65/65 | 15.1 | 13.3/0.0  | q4_0  |    734 |  45s | N-gram   M=8 N=8 min=1 (67%) |  1024/256 |            |
|  15 t/s |  64 k |   0 | 65/65 | 15.1 | 13.3/0.0  | q4_0  |    745 |  49s | N-gram M=12 N=12 min=1 (34%) |  1024/256 |            |
|  15 t/s |  64 k |   0 | 65/65 | 15.1 | 13.3/0.0  | q4_0  |    725 |  48s | N-gram   M=8 N=6 min=1 (56%) |  1024/256 |            |
|  14 t/s |  64 k |   0 | 65/65 | 15.1 | 13.3/0.0  | q4_0  |    665 |  47s | N-gram   M=8 N=4 min=1 (50%) |  1024/256 |            |
|  14 t/s |  64 k |   0 | 65/65 | 15.1 | 13.3/0.0  | q4_0  |    704 |  52s | N-gram   M=4 N=4 min=1 (72%) |  1024/256 |            |
|  16 t/s |  64 k |   0 | 65/65 | 15.0 | 13.3/0.0  | q4_0  |    766 |  47s | N-gram       M=4 N=8 min=1   |  1024/256 |            |

_test_model() {
source server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $spec \
    $draft_model \
    $predict_token \
    $jinja \
    $batch \
    $ubatch
    
source test_models_common.sh && print_test_call
}
```


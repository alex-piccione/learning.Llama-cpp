# Wen 3.5 27B

3.5 models are smaller, allowing more context.  


## Qwen3.5-27B-IQ4_XS_unsloth.gguf
Qwen3.5-27B-IQ4_XS_unsloth.gguf             13.9 GB


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
ctx_k=64
gpu_layers=99
cpu_moe=0
spec=none
draft_model=none
predict_token=4/4
mtp=0
jinja=1
batch=2048
ubatch=1024
_start_server

_start_server() {
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
    $jinja \
    $batch \
    $ubatch
    
source test_models_common.sh && print_test_call
}
```


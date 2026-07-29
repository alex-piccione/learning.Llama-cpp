# Qwen 3.6 27B

| File                                                       | Result                                      |
| Qwen3.6-27B-Q4_K_M_unsloth.gguf                            | ❌ too slow                                 |
| Qwen3.6-27B-Q4_K_M_MTP_unsloth.gguf                        | ❌ too slow                                 |
| Qwen3.6-27B-MTP-IQ4_NL_unsloth.gguf                        | ❌ too slow                                 |
| Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf            | ❌ too slow                                 |
| Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf    | ❌ too slow                                 |

## Q4_K_X (Unsloth)



## ❌ Esper 3.1 (by mr radermacher)
Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf                    15.4 GB
https://huggingface.co/mradermacher/Qwen3.6-27B-Esper3.1-GGUF  
10 t/s

## ❌ Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf
Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf            15.6 GB
< 10 t/s

## ❌ Q4_K_M (by Unsloth)
Qwen3.6-27B-Q4_K_M_unsloth.gguf                                    15.6 GB
10 t/s

## ❌ Q4_K_M MTP (by Unsloth)
Qwen3.6-27B-Q4_K_M_MTP_unsloth.gguf                                15.9 GB
7 t/s

## ❌ MTP IQ4_NL (by Unsloth)
File: Qwen3.6-27B-MTP-IQ4_NL_unsloth.gguf                          15.2 GB
[Size: ](https://huggingface.co/unsloth/Qwen3.6-27B-MTP-GGUF)
1 t/s


## Qwen3.6-27B-DFlash-Q4_K_M_anbeeld.gguf
Qwen3.6-27B-DFlash-Q4_K_M_anbeeld.gguf   (file lost ?)

Draft models: (https://huggingface.co/Anbeeld/Qwen3.6-27B-DFlash-GGUF?show_file_info=Qwen3.6-27B-DFlash-Q4_K_M.gguf)
Qwen3.6-27B-DFlash-Q8_0_anbeeld.dflash.gguf


## Run tests

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf
|  24 t/s |  16 k |   6 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    759 |  32s | DFlash (N-gram)  | s_M=32 s_N=16 min=1 (99%)      | 1024/256     |                 |
|  24 t/s |  16 k |   6 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    738 |  31s | DFlash (N-gram)  | s_M=24 s_N=12 min=1 (83%)      | 1024/256     |                 |
|  23 t/s |  16 k |   4 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    738 |  32s | DFlash (N-gram)  | s_M=20 s_N=10 min=1 (76%)      | 1024/256     |                 |
|  23 t/s |  16 k |   5 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    738 |  33s | DFlash (N-gram)  | s_M=20 s_N=10 min=1 (76%)      | 1024/256     |                 |
|  20 t/s |  16 k |   5 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    733 |  36s | DFlash (N-gram)  | s_M=12 s_N=6 min=1 (71%)       | 1024/256     |                 |
|  20 t/s |  16 k |   6 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    733 |  37s | DFlash (N-gram)  | s_M=12 s_N=6 min=1 (71%)       | 1024/256     |                 |
|  14 t/s |  16 k |   5 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    762 |  52s | none             | --                             | 1024/256     |                 |
|  13 t/s |  32 k |   6 | 63/65  | 15.7 GB | 14.3/0.5  | --    |   2048 | 160s | DFlash (N-gram)  | s_M=16 s_N=16 min=1 (94%)      | 1024/256     |                 |



```bash
cd scripts

model=Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf
ctx_k=32
gpu_layers=60
cpu_moe=5
spec=1
draft_model=none
predict_token=12/12
mtp=0
jinja=0
batch=1024
ubatch=256
_start_server


model=Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf
ctx_k=32
gpu_layers=64
cpu_moe=3
spec=0
draft_model=none
predict_token=16/16
mtp=0
jinja=0
batch=1024
ubatch=256
_start_server



model=Qwen3.6-27B-MTP-IQ4_NL_unsloth.gguf
ctx_k=16
gpu_layers=-1
cpu_moe=5
spec=1
draft_model=Qwen3.6-27B-MTP-IQ4_NL_unsloth.gguf
predict_token=6/12
mtp=0
jinja=0
batch=1024
ubatch=256


model=Qwen3.6-27B-Q4_K_M_unsloth.gguf
ctx_k=64
gpu_layers=59
cpu_moe=3
spec=none
draft_model=none
predict_token=6/12
mtp=0
jinja=0
batch=1024
ubatch=256
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

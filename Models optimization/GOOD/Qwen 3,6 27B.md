# Qwen 3.6 27B


## Qwen 3.6 28B-REAP20-A3B (by barozp)

HuggingFace: https://huggingface.co/barozp/Qwen3.6-28B-REAP20-A3B-GGUF  
File: Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf  
MTP: No  
ax context: 256 k  
OpenAI tools compatibility : ✔️  

## Esper 3.1 (by mr radermacher)
HuggingFace: https://huggingface.co/mradermacher/Qwen3.6-27B-Esper3.1-GGUF  
File: Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf
MTP: No  
Max context: 256 k  
OpenAI tools compatibility : ✔️

## ❌ Q4_K_M (by Unsloth)
HuggingFace:  
Quantized by: Unsloth  
File: Qwen3.6-27B-Q4_K_M_unsloth.gguf  
Size: 15.6 GB
MTP: No  
MoE: Yes  
OpenAI tools compatibility: ✔️  
10 t/s

## ❌ Q4_K_M MTP (by Unsloth)
File: Qwen3.6-27B-Q4_K_M_MTP_unsloth.gguf
Size: 15.9 GB
7 t/s

## ❌ MTP IQ4_NL (by Unsloth)
HuggingFace: https://huggingface.co/unsloth/Qwen3.6-27B-MTP-GGUF
File: Qwen3.6-27B-MTP-IQ4_NL_unsloth.gguf
Size: 15.2 GB
1 t/s


## Draft model

Draft models for DFlash:
- (❌ failed to load draft model) unsloth_Qwen3.5-2B-Q4_K_M.gguf  
- (❌ not supported) anbeeld_Qwen3.6-27B-DFlash-Q4_K_M.gguf (https://huggingface.co/Anbeeld/Qwen3.6-27B-DFlash-GGUF?show_file_info=Qwen3.6-27B-DFlash-Q4_K_M.gguf)


## Run tests

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf
|  37 t/s | 128 k |   7 | 41/41  | 15.3 GB | 13.2/2.6  | --    |   1901 |  51s | DFlash (N-gram)  | s_M=24 s_N=12 min=1 (68%)      | 1024/256     |                 |
|  36 t/s | 128 k |   7 | 41/41  | 15.3 GB | 13.2/2.6  | --    |   1901 |  53s | none             | -- (68%)                       | 1024/256     |                 | !!! new llama.cpp
|  36 t/s | 128 k |   6 | 41/41  | 15.6 GB | 13.5/2.3  | --    |   1126 |  31s | DFlash (N-gram)  | s_M=24 s_N=12 min=1 (58%)      | 1024/256     |                 |
|  36 t/s |  96 k |   6 | 41/41  | 15.2 GB | 13.5/2.3  | --    |   1126 |  32s | DFlash (N-gram)  | s_M=30 s_N=12 min=1 (51%)      | 1024/256     |                 |
|  36 t/s |  96 k |   6 | 41/41  | 15.2 GB | 13.5/2.3  | --    |   1126 |  32s | DFlash (N-gram)  | s_M=24 s_N=12 min=1 (58%)      | 1024/256     |                 |
|  35 t/s |  64 k |   6 | 41/41  | 14.8 GB | 13.5/2.3  | --    |   1126 |  33s | DFlash (N-gram)  | s_M=24 s_N=12 min=1 (58%)      | 1024/256     |                 |
|  34 t/s |  64 k |   5 | 41/41  | 15.2 GB | 13.9/1.9  | --    |   1261 |  38s | DFlash (N-gram)  | s_M=24 s_N=12 min=1 (59%)      | 1024/256     |                 |
|  27 t/s |  64 k |   5 | 41/41  | 15.2 GB | 13.9/1.9  | --    |   2048 |  77s | DFlash (N-gram)  | s_M=12 s_N=6 min=1 (58%)       | 1024/256     |                 |
|  35 t/s |  32 k |   5 | 41/41  | 14.8 GB | 13.9/1.9  | --    |   1261 |  36s | DFlash (N-gram)  | s_M=24 s_N=12 min=1 (59%)      | 1024/256     |                 |
|  30 t/s |  32 k |   5 | 41/41  | 14.8 GB | 13.9/1.9  | --    |   2048 |  68s | DFlash (N-gram)  | s_M=32 s_N=16 min=1 (74%)      | 1024/256     |                 |
|  27 t/s |  32 k |   5 | 41/41  | 14.8 GB | 13.9/1.9  | --    |   2048 |  76s | DFlash (N-gram)  | s_M=12 s_N=6 min=1 (58%)       | 1024/256     |                 |

| Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf
|  24 t/s |  16 k |   6 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    759 |  32s | DFlash (N-gram)  | s_M=32 s_N=16 min=1 (99%)      | 1024/256     |                 |
|  24 t/s |  16 k |   6 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    738 |  31s | DFlash (N-gram)  | s_M=24 s_N=12 min=1 (83%)      | 1024/256     |                 |
|  23 t/s |  16 k |   4 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    738 |  32s | DFlash (N-gram)  | s_M=20 s_N=10 min=1 (76%)      | 1024/256     |                 |
|  23 t/s |  16 k |   5 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    738 |  33s | DFlash (N-gram)  | s_M=20 s_N=10 min=1 (76%)      | 1024/256     |                 |
|  20 t/s |  16 k |   5 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    733 |  36s | DFlash (N-gram)  | s_M=12 s_N=6 min=1 (71%)       | 1024/256     |                 |
|  20 t/s |  16 k |   6 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    733 |  37s | DFlash (N-gram)  | s_M=12 s_N=6 min=1 (71%)       | 1024/256     |                 |
|  14 t/s |  16 k |   5 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    762 |  52s | none             | --                             | 1024/256     |                 |
|         |  32 k   ❌                                                                                                                                              |



```bash
cd scripts

model=Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf
ctx_k=16
gpu_layers=-1
cpu_moe=6
spec=1
draft_model=none
predict_token=16/32
mtp=0
jinjia=0
batch=1024
ubatch=256


model=Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=7
spec=1
draft_model=none
predict_token=12/24
mtp=0
jinjia=0
batch=1024
ubatch=256



#model=Qwen3.6-27B-Q4_K_M_MTP_unsloth.gguf
model=Qwen3.6-27B-MTP-IQ4_NL_unsloth.gguf
ctx_k=16
gpu_layers=-1
cpu_moe=5
spec=1
draft_model=Qwen3.6-27B-MTP-IQ4_NL_unsloth.gguf
predict_token=6/12
mtp=0
jinjia=0
batch=1024
ubatch=256



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
    $jinjia \
    $batch \
    $ubatch
    
source test_models_common.sh && print_test_call

```

# Qwen 3.6 27B


## 1. Qwen 3.6 27B Q4_K_M

Hu6ggingFace:  
Quantized by: Unsloth  
File: unsloth_Qwen3.6-27B-Q4_K_M.gguf  
MTP: No  
MoE: Yes  
OpenAI tools compatibility: ✔️  


## 2. Qwen 3.6 27B Q3_K_M

File: unsloth_Qwen3.6-27B-Q3_K_M.gguf
Max context: 256 k
OpenAI tools compatibility : ✔️


## 3. Qwen 3.6 27B Esper 3.1 (by mr radermacher)

HuggingFace: https://huggingface.co/mradermacher/Qwen3.6-27B-Esper3.1-GGUF  
File: mr_radermacher_Qwen3.6-27B-Esper3.1.Q4_K_M.gguf  
MTP: No  
Max context: 256 k  
OpenAI tools compatibility : ✔️  


## 4. Qwen 3.6 28B-REAP20-A3B (by barozp)

HuggingFace: https://huggingface.co/barozp/Qwen3.6-28B-REAP20-A3B-GGUF  
File: barozp_Qwen3.6-28B-REAP20-A3B-Q4_K_M.gguf  
MTP: No  
ax context: 256 k  
OpenAI tools compatibility : ✔️  


## Draft model

Draft models for DFlash:
- (❌ failed to load draft model) unsloth_Qwen3.5-2B-Q4_K_M.gguf  
- (❌ not supported) anbeeld_Qwen3.6-27B-DFlash-Q4_K_M.gguf (https://huggingface.co/Anbeeld/Qwen3.6-27B-DFlash-GGUF?show_file_info=Qwen3.6-27B-DFlash-Q4_K_M.gguf)


## Run tests


| Speed   | Ctx   | GPU   | MoE | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | ----- | --- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
| mr_radermacher_Qwen3.6-27B-Esper3.1.Q4_K_M.gguf
|  27 t/s |  16 k | 65/65 |   5 | 15.7 GB | ---   |   2048 |  77s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 14.7/0.0  |                 |
|  25 t/s |  16 k | 65/65 |   3 | 15.7 GB | ---   |   2048 |  83s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 14.7/0.0  |                 |
|  23 t/s |  16 k | 65/65 |   1 | 15.7 GB | ---   |    841 |  37s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 14.7/0.0  |                 |
|  14 t/s |  16 k | 65/65 |   2 | 15.7 GB | ---   |   2048 | 144s | DFlash (N-gram)  | size_M=6 size_N=20 min_hits=1  | 1024/256     | 14.7/0.0  |                 |
| barozp_Qwen3.6-28B-REAP20-A3B-Q4_K_M.gguf 
|  43 t/s | 128 k | 41/41 |   5 | 15.7 GB | ---   |    946 |  22s | DFlash (N-gram)  | size_M=6 size_N=8 min_hits=1   | 2048/256     | 13.9/1.9  |                 |
|  41 t/s | 128 k | 41/41 |   5 | 15.7 GB | ---   |   1245 |  30s | DFlash (N-gram)  | size_M=6 size_N=8 min_hits=1   | 2048/256     | 13.9/1.9  |                 |
|  43 t/s |  96 k | 41/41 |   5 | 15.4 GB | ---   |   1307 |  30s | DFlash (N-gram)  | size_M=6 size_N=8 min_hits=1   | 2048/256     | 13.9/1.9  |                 |
|  43 t/s |  64 k | 41/41 |   5 | 15.1 GB | ---   |   1653 |  39s | DFlash (N-gram)  | size_M=6 size_N=8 min_hits=1   | 2048/256     | 13.9/1.9  |                 |
|  40 t/s |  64 k | 41/41 |   6 | 14.8 GB | ---   |    866 |  21s | DFlash (N-gram)  | size_M=6 size_N=8 min_hits=1   | 2048/256     | 13.5/2.3  |                 |
|  42 t/s |  32 k | 41/41 |   5 | 14.8 GB | ---   |   1275 |  30s | DFlash (N-gram)  | size_M=5 size_N=8 min_hits=1   | 2048/256     | 13.9/1.9  |                 |

|  43 t/s |  16 k | 41/41 |   5 | 14.6 GB | ---   |   1190 |  28s | DFlash (N-gram)  | size_M=5 size_N=8 min_hits=1   | 2048/256     | 13.9/1.9  |                 |
|  43 t/s |  16 k | 41/41 |   5 | 14.6 GB | ---   |   1211 |  28s | DFlash (N-gram)  | size_M=8 size_N=10 min_hits=1  | 1024/256     | 13.9/1.9  |                 |
|  43 t/s |  16 k | 41/41 |   5 | 14.6 GB | ---   |   1222 |  28s | DFlash (N-gram)  | size_M=10 size_N=12 min_hits=1 | 1024/256     | 13.9/1.9  |                 |
|  42 t/s |  16 k | 41/41 |   5 | 14.6 GB | ---   |   1179 |  28s | DFlash (N-gram)  | size_M=5 size_N=8 min_hits=1   | 512/256      | 13.9/1.9  |                 |
|  42 t/s |  16 k | 41/41 |   5 | 14.6 GB | ---   |   1067 |  25s | DFlash (N-gram)  | size_M=6 size_N=10 min_hits=1  | 1024/256     | 13.9/1.9  |                 |
|  42 t/s |  16 k | 41/41 |   5 | 14.6 GB | ---   |   1269 |  30s | DFlash (N-gram)  | size_M=8 size_N=12 min_hits=1  | 1024/256     | 13.9/1.9  |                 |
|  42 t/s |  16 k | 41/41 |   5 | 14.6 GB | ---   |   1281 |  30s | DFlash (N-gram)  | size_M=10 size_N=20 min_hits=1 | 1024/256     | 13.9/1.9  |                 |
|  41 t/s |  16 k | 41/41 |   5 | 14.7 GB | ---   |    624 |  16s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 13.9/1.9  |                 |
|  38 t/s |  16 k | 41/41 |   6 | 14.3 GB | ---   |    802 |  21s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 13.5/2.3  |                 |
|  37 t/s |  16 k | 41/41 |   7 | 14.0 GB | ---   |    801 |  22s | DFlash (N-gram)  | size_M=20 size_N=20 min_hits=1 | 1024/256     | 13.2/2.6  |                 |
|  35 t/s |  16 k | 41/41 |   5 | 14.7 GB | ---   |    929 |  26s | DFlash (N-gram)  | size_M=10 size_N=10 min_hits=1 | 1024/256     | 13.9/1.9  |                 |
| unsloth_Qwen3.6-27B-Q4_K_M.gguf
|   1 t/s 
| unsloth_Qwen3.6-27B-Q3_K_M.gguf
|  16 t/s with 32 k context



```bash
cd scripts

#model=unsloth_Qwen3.6-27B-Q4_K_M.gguf  # file 1
#model=unsloth_Qwen3.6-27B-Q3_K_M.gguf  # file 2
#model=mr_radermacher_Qwen3.6-27B-Esper3.1.Q4_K_M.gguf  # file 3
model=barozp_Qwen3.6-28B-REAP20-A3B-Q4_K_M.gguf     # file 4
ctx_k=128
gpu_layers=999
cpu_moe=5
dflash=1
draft_model=none
#draft_model=unsloth_Qwen3.5-2B-Q4_K_M.gguf
predict_token=6
mtp=0
jinjia=0
batch=2048
ubatch=256

source server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $dflash \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia \
    $batch \
    $ubatch

source test_models_common.sh && \
test_call_result_row $(flag_or $dflash $mtp)

```

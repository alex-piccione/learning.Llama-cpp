# Qwen 3.6 35B A3B


## MOE384-pruned-Q4_K_M (by tipe)
File: Qwen3.6-35B-A3B-MOE384-pruned-Q4_K_M_tipe.gguf
Size: 16.5 GB
MOE:

HuggingFace: ?
Quantized by: Unsloth
File: unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
MTP: ?
MoE: Yes
Max context: 256 k
OpenAI tools compatibility : ✔️

Note.  
- With less than CPU_MOE=13 the speed drops down.  (?!)
- Using 64k instead of 96k of context gives exactly the same speed. (?!)
- Switching 


## REAP pruned ratio 0.3 Q4_K_M (by amazeble)
qwen3.6-35b-reap-pruned-ratio-0.3-q4_k_m_amazeble.gguf
Max context                   : 256 k
OpenAI tools compatibility    : ❌

## REAP pruned ratio  0.5 Q4_K_M (by lemmyhans)
qwen3.6-35b-reap-pruned-ratio-0.5-q4_k_m_lemmyhans.gguf





## Run tests

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwen3.6-35B-A3B-MOE384-pruned-Q4_K_M_tipe.gguf                                                                                                                    |
|  45 t/s |  64 k |   5 | 41/41  | 15.6 GB | 14.2/2.1  | --    |   1079 |  25s | none             | --                             | 1024/256     |                 |
|  45 t/s |  32 k |   5 | 41/41  | 15.2 GB | 14.2/2.1  | --    |   1079 |  24s | none             | --                             | 1024/256     |                 |
|  46 t/s |  16 k |   5 | 41/41  | 15.0 GB | 14.2/2.1  | --    |   1079 |  24s | none             | --                             | 1024/256     |                 |

| qwen3.6-35b-reap-pruned-ratio-0.3-q4_k_m_amazeble.gguf
|  42 t/s |  64 k |   5 | 41/41  | 13.6 GB | 12.3/1.7  | --    |    702 |  17s | none             | --                             | 1024/256     |                 |


| qwen3.6-35b-reap-pruned-ratio-0.5-q4_k_m_lemmyhans.gguf
|  39 t/s |  64 k |   5 | 41/41  | 10.3 GB | 9.1/1.2   | --    |   2048 |  53s | none             | --                             | 1024/256     |                 |

| Qwen3.5-35B-A3B-UD-Q4_K_M_unsloth.gguf
|  16 t/s |  96 k |   0 | 41/42  | 14.0 GB | 12.4/8.6  | --    |    783 |  50s | none             | --                             | 2048/256     |                 |

| Speed   | Ctx   | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
|  24 t/s |  64 k | 41/41  | 14.0 GB | 12.7/7.9  | --    |    796 |  34s | none             | --                             | 2048/256     |                 |
|  23 t/s |  64 k | 41/41  | 14.0 GB | 12.7/7.9  | --    |   1058 |  45s | none             | --                             | 2048/256     |                 |
|  19 t/s |  64 k | 41/41  | 14.0 GB | 12.7/7.9  | --    |    691 |  37s | DFlash (N-gram)  | M=24 N=12 min=1 (17%)          | 2048/256     |                 |


```bash
cd scripts

model=unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
ctx_k=96
gpu_layers=-1
cpu_moe=0
spec=1
draft_model=none
predict_token=8/12
mtp=0
jinjia=0
batch=2048
ubatch=256


model=Qwen3.6-35B-A3B-MOE384-pruned-Q4_K_M_tipe.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=5
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinjia=0
batch=1024
ubatch=256

model=qwen3-coder-30b-a3b-instruct_pruned_reap-15b-a3b-safetensors-q4_k_m_lainlives.gguf
#model=qwen3.6-35b-reap-pruned-ratio-0.5-q4_k_m_lemmyhans.gguf
#model=qwen3.6-35b-reap-pruned-ratio-0.3-q4_k_m_amazeble.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=5
spec=0
draft_model=none
predict_token=0/0
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
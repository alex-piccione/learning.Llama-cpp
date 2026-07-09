# Qwen 3.6 35B A3B


## MOE384-pruned-Q4_K_M (by tipe)
File: Qwen3.6-35B-A3B-MOE384-pruned-Q4_K_M_tipe.gguf
Size: 16.5 GB
MOE: Yes (best value: 5)

## Q4_K_M (by Unsloth)
HuggingFace: ?
Quantized by: Unsloth
File: Qwen3.6-35B-A3B-UD-Q4_K_M_unsloth.gguf
MTP: ?
MoE: Yes
Max context: 256 k
OpenAI tools compatibility : ✔️

Note.  
- With less than CPU_MOE=13 the speed drops down.  (?!)
- Using 64k instead of 96k of context gives exactly the same speed. (?!)

## REAP pruned ratio 0.3 Q4_K_M (by amazeble)
qwen3.6-35b-reap-pruned-ratio-0.3-q4_k_m_amazeble.gguf
Max context                   : 256 k
OpenAI tools compatibility    : ❌

## REAP pruned ratio  0.5 Q4_K_M (by lemmyhans)
File: Qwen3.6-35b-reap-pruned-ratio-0.3-Q4_K_M_amazeble.gguf
Size: 14.2 GB


## ❌ REAP20 Q4_K_M (by barozp)
File: Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf
Size: 16.0 GB

With speculative draft activated it can fail the open AI tool compatibility and the prediction success rate is really low (10/20%) (I can't explain a higher speed with lower value)


## ❌ MTP MXFP4 MOE (by Unsloth)
Huggingface: https://huggingface.co/unsloth/Qwen3.6-35B-A3B-MTP-GGUF
(Other quantizations: https://huggingface.co/unsloth/Qwen3.6-35B-A3B-MTP-GGUF)
File: Qwen3.6-35B-A3B-MXFP4_MOE_unsloth.gguf
Size: 20.6 GB
MTP: yes

🛑 [ABORT] Generation speed dropped to 2.13 t/s (Threshold: 10.0 t/s).

--spec-type draft-mtp --spec-draft-n-max 2


## Run tests

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwen3.6-35B-A3B-MOE384-pruned-Q4_K_M_tipe.gguf                                                                                                                    |
|  45 t/s |  64 k |   5 | 41/41  | 15.6 GB | 14.2/2.1  | --    |   1079 |  25s | none             | --                             | 1024/256     |                 |
|  45 t/s |  32 k |   5 | 41/41  | 15.2 GB | 14.2/2.1  | --    |   1079 |  24s | none             | --                             | 1024/256     |                 |
|  46 t/s |  16 k |   5 | 41/41  | 15.0 GB | 14.2/2.1  | --    |   1079 |  24s | none             | --                             | 1024/256     |                 |

| Qwen3.6-35b-reap-pruned-ratio-0.3-Q4_K_M_amazeble.gguf
|  52 t/s | 128 k |   1 | 41/41  | 15.7 GB | 13.7/0.3  | --    |    821 |  16s | none             | --                             | 1024/256     |                 |
|  50 t/s | 128 k |   1 | 41/41  | 15.7 GB | 13.7/0.3  | --    |    542 |  11s | none             | --                             | 1024/512     |                 |
|  46 t/s | 128 k |   2 | 41/41  | 15.4 GB | 13.3/0.7  | --    |    834 |  18s | none             | --                             | 1024/256     |                 |
|  43 t/s | 128 k |   3 | 41/41  | 15.0 GB | 13.0/1.0  | --    |   2048 |  47s | none             | --                             | 1024/256     |                 |
|  44 t/s |  96 k |   3 | 41/41  | 14.6 GB | 13.0/1.0  | --    |   2048 |  46s | none             | --                             | 1024/256     |                 |
|  45 t/s |  64 k |   3 | 41/41  | 14.1 GB | 13.0/1.0  | --    |   2048 |  45s | none             | --                             | 1024/256     |                 |
|  42 t/s |  64 k |   5 | 41/41  | 13.6 GB | 12.3/1.7  | --    |    702 |  17s | none             | --                             | 1024/256     |                 |
|  32 t/s |  64 k |   3 | 41/41  | 14.1 GB | 13.0/1.0  | --    |    639 |  20s | none             | ngram N:12, M:24 (16%)         | 1024/256     |                 |

| Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf
|  45 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   2048 |  46s | none             | --                             | 1024/256     |                 |
|  42 t/s |  64 k |   5 | 41/41  | 15.1 GB | 13.9/1.9  | --    |   2048 |  49s | none             | --                             | 1024/256     |                 |
|  42 t/s |  64 k |   4 | 41/41  | 15.5 GB | 14.2/1.6  | --    |   1214 |  29s | none             | --                             | 1024/256     |                 |
|  34 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   2048 |  60s | none             | ngram-simple N:12 M:24 (10%)   | 1024/256     |                 |
|  25 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   2007 |  80s | none             | ngram-simple N:10 M:24 (18%)   | 1024/256     |                 |
|  21 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   1845 |  87s | none             | ngram-simple N:5 M:10 (60%)    | 1024/256     |                 |

| qwen3.6-35b-reap-pruned-ratio-0.5-q4_k_m_lemmyhans.gguf
|  39 t/s |  64 k |   5 | 41/41  | 10.3 GB | 9.1/1.2   | --    |   2048 |  53s | none             | --                             | 1024/256     |                 |

| Qwen3.5-35B-A3B-UD-Q4_K_M_unsloth.gguf
|  16 t/s |  96 k |   0 | 41/42  | 14.0 GB | 12.4/8.6  | --    |    783 |  50s | none             | --                             | 2048/256     |                 |

| Qwen3.6-35B-A3B-MXFP4_MOE_unsloth.gguf 
🛑 [ABORT] Generation speed dropped to 2.13 t/s (Threshold: 10.0 t/s).



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

model=Qwen3.6-35B-A3B-MXFP4_MOE_unsloth.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=6
spec=0
mtp=1
draft_model=none
predict_token=1/2
jinjia=0
batch=1024
ubatch=256


model=Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=3
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinjia=0
batch=1024
ubatch=256

model=Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=3
spec=1
draft_model=none
predict_token=12/24
mtp=0
jinjia=0
batch=1024
ubatch=256

# from the log (who set repeat_* ??)
#0.46.259.265 I slot launch_slot_: id  0 | task -1 | sampler chain: logits -> penalties -> ?dry -> ?top-n-sigma -> top-k -> ?typical -> top-p -> min-p -> ?xtc -> temp-ext -> dist 
#0.46.259.279 I slot launch_slot_: id  0 | task -1 | sampler params: 
#	repeat_last_n = 256, repeat_penalty = 1.050, frequency_penalty = 0.000, presence_penalty = 0.000
#	dry_multiplier = 0.000, dry_base = 1.750, dry_allowed_length = 2, dry_penalty_last_n = 65536
#	top_k = 20, top_p = 0.800, min_p = 0.050, xtc_probability = 0.000, xtc_threshold = 0.100, typical_p = 1.000, top_n_sigma = -1.000, temp = 0.100
#	mirostat = 0, mirostat_lr = 0.100, mirostat_ent = 5.000, adaptive_target = -1.000, adaptive_decay = 0.900
#

model=Qwen3.6-35b-reap-pruned-ratio-0.3-Q4_K_M_amazeble.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=1
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


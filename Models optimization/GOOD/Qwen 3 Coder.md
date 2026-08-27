# Qwen3-Coder

| File                                                                      | Result                                                     |
| Qwen_3-Coder-Next-REAP-40B-A3B.i1-IQ3_M_mradermacher.gguf                 | ✔️ Max 64k     22 t/s  Pi: GOOD                            |
| Qwen3-Coder-30B-A3B-Instruct-IQ4_XS_unsloth.gguf                          | ✔️ 96k  30 t/s                                             |
| Qwen3-Coder-30B-A3B-Instruct-UD-Q3_K_XL_unsloth.gguf                      | ❌ Q4 96k:70 t/s Q8 96k:30 t/s   Pi: indisciplinate        |
| Qwen3-Coder-REAP-25B-A3B-Q4_K_M_bartowski.gguf                            | ✔️ Max 64k                                                 |
| Qwen3-Coder-30B-A3B-Instruct-Q4_K_M_unsloth.gguf                          | ❌ Too slow                                                |
| Qwen3-Coder-30B-A3B-Instruct-UD-Q4_K_XL_unsloth.gguf                      | ❌ Chatty. Not able to complete a task. 64k:20 t/s         |
| Qwen3-Coder-30B-A3B-Instruct-RTPurbo.Q4_K_M_mradermacher.gguf             | ❌ No tools capability                                     |
| Qwen3-Coder-30B-A3B-instruct_REAP-15B-A3B-Q4_K_M_lainlives.gguf           | ❌ No tools capability                                     |
| qwen3-coder-30b-a3b-instruct_REA-15b-a3b-safetensors-q5_0_lainlives.gguf  | ❌ No tools capability                                     |
| Qwen3-Coder-30B-A3B-Instruct-128x1.8B-Q4_K_M_intel.gguf                   | ❌ Too slow                                                |


## 
Qwen3-Coder-30B-A3B-Instruct-IQ4_XS_unsloth.gguf                                15.2 GB


## 
https://huggingface.co/Intel/Qwen3-Coder-30B-A3B-Instruct-gguf-q4km-AutoRound


##
https://huggingface.co/mradermacher/Qwen3-30B-A3B-CoderThinking-YOYO-linear-GGUF        


## ✔️ Next REAP-40B-A3B (mradermacher)
Qwen3-Coder-Next-REAP-40B-A3B.i1-IQ3_M_mradermacher.gguf                        16.9 GB
https://huggingface.co/mradermacher/Qwen3-Coder-Next-REAP-40B-A3B-i1-GGUF
Moe: 7-6
Context: max 64k


## ✔️ REAP-25B-A3B-Q4_K_M (by bartowski)
Qwen3-Coder-REAP-25B-A3B-Q4_K_M_bartowski.gguf                                  14.1 GB
https://huggingface.co/bartowski/cerebras_Qwen3-Coder-REAP-25B-A3B-GGUF


## ❌
Qwen3-Coder-30B-A3B-Instruct-128x1.8B-Q4_K_M_intel.gguf                         16.1 GB
Too slow


## ❌ UD Q4_K_XL (Unsloth)
Qwen3-Coder-30B-A3B-Instruct-UD-Q4_K_XL_unsloth.gguf                   16.4 GB
❌ Chatty. Not able to complete a task.


## ❌ UD Q3_K_XL (Unsloth)
Qwen3-Coder-30B-A3B-Instruct-UD-Q3_K_XL_unsloth.gguf                   12.8 GB
- Started the job without permissions
- Pi speed is not so incredible (30-50 t/s)
- A lot of command calls errors
❌ Started to work on main branch


## ❌ Q4_K_M (Unsloth)
Qwen3-Coder-30B-A3B-Instruct-Q4_K_M_unsloth.gguf                                17.2 GB
https://huggingface.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF
GPU Offload: 40
MOE 1:no, 3:no
❌ Too slow


## ❌ 30B-A3B RTPurbo Q4_K_M (mradermacher)
Qwen3-Coder-30B-A3B-Instruct-RTPurbo.Q4_K_M_mradermacher.gguf                  17.2 GB
https://huggingface.co/mradermacher/Qwen3-Coder-30B-A3B-Instruct-RTPurbo-GGUF    
❌ No tool calling capability. Neither with Jinja.


## ❌ REAP 15B A3B Q4_K_M (by lainlives)  [DELETED]
Qwen3-Coder-30B-A3B-instruct_pruned_REAP-15B-A3B-Q4_K_M_lainlives.gguf
❌ No tool calling capability


## ❌ REAP 15B Q5_0 (by lainlives)   [DELETED]
qwen3-coder-30b-a3b-instruct_pruned_reap-15b-a3b-safetensors-q5_0_lainlives.gguf     10.3 GB
❌ No tool calling capability



| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwen3-Coder-REAP-25B-A3B-Q4_K_M_bartowski.gguf
|  46 t/s |  32 k |   3 | 49/49  | 15.1 GB | 13.1/0.9  | --    |    974 |  21s | none             | --                             | 2048/512     |                 |
|  34 t/s |  64 k |   7 | 49/49  | 15.5 GB | 12.0/2.0  | --    |    974 |  28s | none             | --                             | 1024/256     |                 |
|  25 t/s |  64 k |   9 | 49/49  | 15.0 GB | 11.4/2.6  | --    |    971 |  39s | none             | --                             | 1024/256     |                 |
| Qwen3-Coder-30B-A3B-Instruct-Q4_K_M_unsloth.gguf
|  16 t/s |  32 k |   7 | 40/49  | 15.6 GB | 13.8/3.3  | --    |    548 |  34s | none             | --                             | 2048/512     |                 |
|  15 t/s |  32 k |   9 | 40/49  | 15.6 GB | 13.8/3.3  | --    |    548 |  36s | none             | --                             | 2048/512     |                 |
|  13 t/s |  32 k |   9 | 49/49  | 15.7 GB | 13.9/3.2  | --    |    553 |  43s | none             | --                             | 2048/512     |                 |
|  11 t/s |  32 k |   7 | 41/49  | 15.7 GB | 14.2/2.9  | --    |    553 |  52s | none             | --                             | 2048/512     |                 |
| Qwen3-Coder-30B-A3B-instruct_pruned_REAP-15B-A3B-Q4_K_M_lainlives.gguf
|  65 t/s |  64 k |   1 | 49/49  | 12.3 GB | 8.7/0.2   | --    |    440 |   6s | none             | --                             | 1024/256     |                 |
|  53 t/s |  64 k |   3 | 49/49  | 11.9 GB | 8.4/0.5   | --    |    440 |   8s | none             | --                             | 1024/256     |                 |
| qwen3-coder-30b-a3b-instruct_pruned_reap-15b-a3b-safetensors-q5_0_lainlives.gguf
|  13 t/s | 128 k |   3 | 47/49  | 15.7 GB | 9.5/0.8   | --    |    433 |  34s | none             | --                             | 1024/256     |                 |
|  11 t/s | 128 k |   3 | 49/49  | 15.7 GB | 9.5/0.8   | --    |    446 |  39s | none             | --                             | 1024/256     |                 |
|  41 t/s |  64 k |   3 | 49/49  | 13.1 GB | 9.5/0.8   | --    |    446 |  11s | none             | --                             | 1024/256     |                 |

```bash


model=Qwen3-Coder-30B-A3B-Instruct-128x1.8B-Q4_K_M_intel.gguf
ctx_k=80
gpu_layers=99
cpu_moe=8
spec=draft-simple
draft_model=none
predict_token=4/6
jinja=0
batch=512
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |----------- |
|  13 t/s |  80 k |   8 | 49/49 | 15.7 | 13.4/0.0  | q4_0 (none) |    969 |  76s | none                                 -- |   512/256 |            |
|  12 t/s |  96 k |   9 | 49/49 | 15.7 | 13.1/0.1  | q4_0 (none) |    531 |  44s | none                                    |   512/256 |            |
|   6 t/s |  96 k |   8 | 49/49 | 15.7 | 13.4/0.1  | q4_0 (none) |    969 | 150s | none                                 -- |   512/256 |            |


model=Qwen3-Coder-30B-A3B-Instruct-128x1.8B-Q4_K_M_intel.gguf
ctx_k=96
gpu_layers=99
cpu_moe=9
spec=0
draft_model=none
predict_token=0/0
jinja=0
batch=512
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  30 t/s |  64 k |   8 | 49/49 | 15.5 | 13.4/0.0  | q4_0  |    586 |  19s | none                          -- |  1024/256 |            |
|  10 t/s |  96 k |   9 | 49/49 | 15.7 | 13.1/0.1  | q4_0  |    570 |  56s | none                          -- |   512/256 |            |
|   6 t/s |  96 k |   8 | 49/49 | 15.7 | 13.4/0.1  | q4_0  |    586 |  92s | none                          -- |   512/256 |            |


model=Qwen3-Coder-30B-A3B-Instruct-IQ4_XS_unsloth.gguf
ctx_k=96
gpu_layers=99
cpu_moe=8
spec=0
draft_model=none
predict_token=0/0
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  30 t/s |  96 k |   8 | 49/49 | 15.7 | 12.7/0.1  | q4_0  |    553 |  19s | none                          -- |  1024/256 |            |
|  10 t/s |  96 k |   6 | 49/49 | 15.7 | 13.3/0.1  | q4_0  |    993 | 104s | none                          -- |  1024/256 |            |
|  13 t/s |  96 k |   7 | 49/49 | 15.7 | 13.0/0.1  | q4_0  |    540 |  40s | none                          -- |  1024/256 |            |

|  39 t/s |  64 k |   6 | 49/49 | 15.3 | 13.3/0.0  | q4_0  |    993 |  25s | none                          -- |  1024/256 |            |


model=Qwen3-Coder-30B-A3B-Instruct-UD-Q4_K_XL_unsloth.gguf
ctx_k=96
gpu_layers=99
cpu_moe=8
spec=0
draft_model=none
predict_token=0/0
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  33 t/s |  64 k |   8 | 49/49 | 15.7 | 13.7/0.0  | q4_0  |    559 |  17s | none                          -- |  1024/256 |            |
|  30 t/s |  64 k |   9 | 49/49 | 15.4 | 13.4/0.0  | q4_0  |    562 |  19s | none                          -- |  1024/256 |            |
|   9 t/s |  64 k |   7 | 49/49 | 15.7 | 14.0/0.0  | q4_0  |    562 |  59s | none                          -- |  1024/256 |            |
|  36 t/s |  32 k |   7 | 49/49 | 15.2 | 14.0/0.0  | q4_0  |    562 |  15s | none                          -- |  1024/256 |            |


model=Qwen3-Coder-30B-A3B-Instruct-UD-Q3_K_XL_unsloth.gguf
ctx_k=96
gpu_layers=99
cpu_moe=0
spec=0
draft_model=none
predict_token=0/0
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  75 t/s |  96 k |   0 | 49/49 | 15.7 | 12.7/0.1  | q4_0  |   1003 |  14s | none                          -- |  1024/256 |            |
|  73 t/s |  96 k |   0 | 49/49 | 15.7 | 12.7/0.2  | q4_0  |    966 |  13s | none                          -- | 1024/1024 |            |
|  72 t/s |  96 k |   0 | 49/49 | 15.7 | 12.7/0.1  | q4_0  |   1003 |  14s | none                          -- |   512/256 |            |
|  71 t/s |  96 k |   0 | 49/49 | 15.7 | 12.7/0.1  | q4_0  |    463 |   7s | none                          -- |  1024/512 |            |

|  29 t/s |  96 k |   8 | 49/49 | 15.7 | 10.7/0.1  | q8_0  |    534 |  19s | none                          -- |  1024/512 |            |
|  29 t/s |  96 k |   8 | 49/49 | 15.7 | 10.7/0.1  | q8_0  |    534 |  19s | none                          -- |  1024/512 |            |
|  23 t/s |  96 k |   9 | 49/49 | 15.7 | 10.4/0.1  | q8_0  |    534 |  23s | none                          -- |  1024/512 |            |
|  10 t/s |  96 k |   7 | 49/49 | 15.7 | 10.9/0.1  | q8_0  |    558 |  56s | none                          -- |  1024/512 |            |


model=Qwen3-Coder-30B-A3B-Instruct-RTPurbo.Q4_K_M_mradermacher.gguf
ctx_k=64
gpu_layers=99
cpu_moe=11
spec=none
draft_model=none
predict_token=16/16
jinja=1
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  23 t/s |  64 k |  10 | 49/49 | 15.7 | 13.6/0.0  | q4_0  |    636 |  28s | none                          -- |  1024/256 |            |
|  21 t/s |  64 k |  11 | 49/49 | 15.4 | 13.3/0.0  | q4_0  |    591 |  29s | none                          -- |  1024/256 |            |
|   9 t/s |  64 k |   9 | 49/49 | 15.7 | 13.9/0.0  | q4_0  |    669 |  72s | none                          -- |  1024/256 |            |
|  28 t/s |  32 k |   9 | 49/49 | 15.2 | 13.9/0.0  | q4_0  |    669 |  24s | none                          -- |  1024/256 |            |


model=Qwen3-Coder-REAP-25B-A3B-Q4_K_M_bartowski.gguf
ctx_k=64
gpu_layers=99
cpu_moe=7
spec=none
draft_model=none
predict_token=16/16
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  46 t/s |  64 k |   7 | 49/49 | 15.6 | 12.0/0.0  | q8_0  |    552 |  12s | N-gram     N=16 M=16 min=1 (92%) |  1024/256 |            |
|  43 t/s |  64 k |   7 | 49/49 | 15.6 | 12.0/0.0  | q8_0  |    552 |  13s | N-gram     N=12 M=12 min=1 (94%) |  1024/256 |            |
|  40 t/s |  64 k |   7 | 49/49 | 15.6 | 12.0/0.0  | q8_0  |    552 |  14s | N-gram       N=8 M=8 min=1 (88%) |  1024/256 |            |
|  37 t/s |  64 k |   6 | 49/49 | 15.7 | 12.2/0.0  | q8_0  |    552 |  15s | N-gram       N=6 M=8 min=1 (82%) |  1024/256 |            |
|  34 t/s |  64 k |   6 | 49/49 | 15.7 | 12.2/0.0  | q8_0  |    552 |  16s | none                          -- |  1024/256 |            |
|  22 t/s |  64 k |   6 | 44/49 | 15.5 | 12.2/0.0  | q8_0  |    964 |  45s | N-gram       N=6 M=8 min=1 (72%) |  1024/256 |            |
|  21 t/s |  64 k |   6 | 44/49 | 15.5 | 12.2/0.0  | q8_0  |    964 |  45s | none                          -- |  1024/256 |            |
|   9 t/s |  80 k |   7 | 49/49 | 15.7 | 12.0/0.0  | q8_0  |    563 |  60s | N-gram       N=6 M=8 min=1 (84%) |  1024/256 |            |


model=Qwen3-Coder-30B-A3B-Instruct-Q4_K_M_unsloth.gguf
ctx_k=32
#gpu_layers=40 is ok
gpu_layers=41
cpu_moe=3
spec=0
draft_model=none
predict_token=8/8
jinja=0
batch=2048
ubatch=512
_start_server


model=qwen3-coder-30b-a3b-instruct_REAP-15b-a3b-safetensors-q5_0_lainlives.gguf
ctx_k=128
gpu_layers=47
cpu_moe=5
spec=0
draft_model=none
predict_token=8/8
jinja=0
batch=1024
ubatch=256
_start_server


model=Qwen3-Coder-30B-A3B-instruct_REAP-15B-A3B-Q4_K_M_lainlives.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=1
spec=0
draft_model=none
predict_token=8/8
jinja=0
batch=1024
ubatch=256


model=Qwen3-Coder-Next-REAP-40B-A3B.i1-IQ3_M_mradermacher.gguf
ctx_k=64
gpu_layers=99
cpu_moe=7
spec=none
draft_model=none
predict_token=3/4
jinja=0
batch=512
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  25 t/s |  64 k |   7 | 49/49 | 15.7 | 14.3/0.0  | q8_0  |    548 |  22s | none                          -- |   512/256 |            |
|  25 t/s |  64 k |   7 | 49/49 | 15.7 | 14.3/0.0  | q8_0  |    548 |  22s | none                          -- |   512/256 |            |
|  24 t/s |  64 k |   7 | 49/49 | 15.7 | 14.3/0.0  | q8_0  |    485 |  21s | none                          -- |   512/128 |            |
|  24 t/s |  64 k |   7 | 49/49 | 15.7 | 14.3/0.0  | q8_0  |    548 |  23s | none                          -- |  1024/256 |            |
|  23 t/s |  64 k |   8 | 49/49 | 15.4 | 14.0/0.0  | q8_0  |    485 |  21s | none                          -- |  1024/256 |            |
|  20 t/s |  64 k |   9 | 49/49 | 15.1 | 13.7/0.0  | q8_0  |    522 |  26s | none                          -- |   512/128 |            |
|  19 t/s |  64 k |   6 | 49/49 | 15.7 | 14.6/0.0  | q8_0  |    485 |  26s | none                          -- |  1024/256 |            |
|  18 t/s |  64 k |   6 | 49/49 | 15.7 | 14.6/0.0  | q8_0  |    485 |  27s | none                          -- |   512/256 |            |

|  16 t/s |  64 k |   7 | 49/49 | 15.7 | 14.3/0.0  | q8_0  |    552 |  33s | N-gram      N=8 M=12 min=1 (48%) |  1024/256 |            |
|  15 t/s |  64 k |   7 | 49/49 | 15.7 | 14.3/0.0  | q8_0  |    547 |  36s | N-gram       N=6 M=8 min=1 (53%) |  1024/256 |            |
|  14 t/s |  64 k |   6 | 49/49 | 15.7 | 14.6/0.0  | q8_0  |    485 |  34s | N-gram     N=12 M=12 min=1 (37%) |  1024/256 |            |
|  13 t/s |  64 k |   6 | 49/49 | 15.7 | 14.6/0.0  | q8_0  |    485 |  37s | N-gram       N=6 M=6 min=1 (68%) |  1024/256 |            |
|  13 t/s |  64 k |   6 | 49/49 | 15.7 | 14.6/0.0  | q8_0  |    485 |  39s | N-gram      N=6 M=12 min=1 (50%) |  1024/256 |            |
|  11 t/s |  64 k |   6 | 49/49 | 15.7 | 14.6/0.0  | q8_0  |    485 |  44s | N-gram       N=3 M=4 min=1 (75%) |  1024/256 |            |

|  15 t/s |  64 k |   7 | 45/49 | 15.5 | 14.2/0.0  | q8_0  |    531 |  35s | none                          -- |   512/256 |            |
|  14 t/s |  64 k |   6 | 45/49 | 15.7 | 14.6/0.0  | q8_0  |    549 |  39s | none                          -- |   512/256 |            |
|  13 t/s |  48 k |   8 | 43/49 | 14.9 | 13.9/0.0  | q8_0  |    567 |  45s | none                          -- |   512/256 |            |


|  28 t/s |  32 k |   6 | 49/49 | 15.6 | 14.6/0.0  | q8_0  |    485 |  17s | none                          -- |  1024/256 |            |
|  15 t/s |  32 k |   7 | 44/49 | 15.1 | 14.2/0.0  | q8_0  |    485 |  33s | none                          -- |  1024/256 |            |
|  15 t/s |  32 k |   6 | 44/49 | 15.4 | 14.5/0.0  | q8_0  |    542 |  37s | none                          -- |  1024/256 |            |
|  14 t/s |  32 k |   0 | 44/49 | 15.7 | 14.9/0.0  | q8_0  |    539 |  38s | none                          -- |  1024/256 |            |
|  14 t/s |  32 k |   0 | 43/49 | 15.4 | 14.5/0.0  | q8_0  |    537 |  37s | none                          -- |  1024/256 |            |
|  13 t/s |  32 k |   0 | 42/49 | 15.0 | 14.2/0.0  | q8_0  |    510 |  39s | none                          -- |  1024/256 |            |
|  11 t/s |  32 k |   0 | 41/49 | 14.7 | 13.8/0.0  | q8_0  |    485 |  43s | none                          -- |  1024/256 |            |
|   9 t/s |  32 k |   0 | 40/49 | 14.3 | 13.5/0.0  | q8_0  |    549 |  61s | none                          -- |  1024/256 |            |
|  12 t/s |  32 k |   3 | 43/49 | 15.4 | 14.5/0.0  | q8_0  |    538 |  44s | N-gram       N=8 M=8 min=1 (67%) |  1024/256 |            |
|  11 t/s |  32 k |   0 | 44/49 | 15.7 | 14.9/0.0  | q8_0  |    536 |  47s | N-gram      N=8 M=12 min=1 (48%) |  1024/256 |            |
|  10 t/s |  32 k |   0 | 43/49 | 15.4 | 14.5/0.0  | q8_0  |    538 |  52s | N-gram      N=8 M=16 min=1 (38%) |  1024/256 |            |


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


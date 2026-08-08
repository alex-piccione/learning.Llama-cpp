# Qwen3-Coder

| File                                                                             | Result                                                      |
| Qwen3-Coder-30B-A3B-Instruct-UD-Q3_K_XL_unsloth.gguf                             | 
| Qwen3-Coder-REAP-25B-A3B-Q4_K_M_bartowski.gguf                                   | ❌ Max 64k and slow                                        |
| Qwen3-Coder-30B-A3B-Instruct-Q4_K_M_unsloth.gguf                                 | ❌ too slow                                                |
| Qwen3-Coder-30B-A3B-instruct_pruned_REAP-15B-A3B-Q4_K_M_lainlives.gguf           | ❌ No tools capability                                      |
| qwen3-coder-30b-a3b-instruct_pruned_reap-15b-a3b-safetensors-q5_0_lainlives.gguf | ❌ No tools capability                                      |
| Qwen3-Coder-Next-REAP-40B-A3B.i1-IQ3_M_mrradermacher.gguf                        | ❌ too slow                                                |

## UD Q3_K_XL (Unsloth)
Qwen3-Coder-30B-A3B-Instruct-UD-Q3_K_XL_unsloth.gguf                   12.8 GB


## ❌ REAP-25B-A3B-Q4_K_M (by bartowski)
Qwen3-Coder-REAP-25B-A3B-Q4_K_M_bartowski.gguf                                  14.1 GB
https://huggingface.co/bartowski/cerebras_Qwen3-Coder-REAP-25B-A3B-GGUF
128K... No
96k.... No
64k.... 34 t/s   

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  34 t/s |  64 k |   6 | 49/49 | 15.7 | 12.2/0.0  | q8_0  |    552 |  16s | none                          -- |  1024/256 |            |

## ❌ Q4_K_M (Unsloth)
Qwen3-Coder-30B-A3B-Instruct-Q4_K_M_unsloth.gguf                                17.2 GB
https://huggingface.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF
GPU Offload: 40
MOE 1:no, 3:no
❌ Too slow

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

model=Qwen3-Coder-30B-A3B-Instruct-UD-Q3_K_XL_unsloth.gguf
ctx_k=96
gpu_layers=-1
cpu_moe=0
spec=0
draft_model=none
predict_token=0/0
jinja=0
batch=1024
ubatch=512
_start_server

|  46 t/s |  64 k |   0 | 49/49  | 14.0 GB | 11.9/1.0  | --    |    993 |  21s | none             | --                             | 1024/512     |                 |
|  33 t/s |  96 k |   0 | 49/49  | 14.0 GB | 11.0/1.9  | --    |    961 |  29s | none             | --                             | 1024/512     |                 |


model=Qwen3-Coder-REAP-25B-A3B-Q4_K_M_bartowski.gguf
ctx_k=80
gpu_layers=99
cpu_moe=6
spec=simple
draft_model=none
predict_token=6/8
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  37 t/s |  64 k |   6 | 49/49 | 15.7 | 12.2/0.0  | q8_0  |    552 |  15s | N-gram       N=6 M=8 min=1 (82%) |  1024/256 |            |
|  34 t/s |  64 k |   6 | 49/49 | 15.7 | 12.2/0.0  | q8_0  |    552 |  16s | none                          -- |  1024/256 |            |
|  22 t/s |  64 k |   6 | 44/49 | 15.5 | 12.2/0.0  | q8_0  |    964 |  45s | N-gram       N=6 M=8 min=1 (72%) |  1024/256 |            |
|  21 t/s |  64 k |   6 | 44/49 | 15.5 | 12.2/0.0  | q8_0  |    964 |  45s | none                          -- |  1024/256 |            |


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


model=qwen3-coder-30b-a3b-instruct_pruned_reap-15b-a3b-safetensors-q5_0_lainlives.gguf
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


model=Qwen3-Coder-30B-A3B-instruct_pruned_REAP-15B-A3B-Q4_K_M_lainlives.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=1
spec=0
draft_model=none
predict_token=8/8
jinja=0
batch=1024
ubatch=256


model=Qwen3-Coder-Next-REAP-40B-A3B.i1-IQ3_M_mrradermacher.gguf
ctx_k=64
gpu_layers=99
cpu_moe=7
spec=simple
draft_model=none
predict_token=8/12
jinja=1
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  24 t/s |  64 k |   7 | 49/49 | 15.7 | 14.3/0.0  | q8_0  |    548 |  23s | none                          -- |  1024/256 |            |
|  23 t/s |  64 k |   8 | 49/49 | 15.4 | 14.0/0.0  | q8_0  |    485 |  21s | none                          -- |  1024/256 |            |
|  19 t/s |  64 k |   6 | 49/49 | 15.7 | 14.6/0.0  | q8_0  |    485 |  26s | none                          -- |  1024/256 |            |

|  16 t/s |  64 k |   7 | 49/49 | 15.7 | 14.3/0.0  | q8_0  |    552 |  33s | N-gram      N=8 M=12 min=1 (48%) |  1024/256 |            |
|  15 t/s |  64 k |   7 | 49/49 | 15.7 | 14.3/0.0  | q8_0  |    547 |  36s | N-gram       N=6 M=8 min=1 (53%) |  1024/256 |            |


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


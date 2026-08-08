# Ministral 14B


## 
File: mistralai_Ministral-3-14B-Reasoning-2512-Q4_K_M.gguf
Quantized by: Ministral AI
Max context          : 256 k
OpenAI tools compatibility : ✔️


## Ministral-3-14B-Instruct-2512-UD-Q6_K_XL
File: Ministral-3-14B-Instruct-2512-UD-Q6_K_XL_unsloth.gguf
Quantized by: Ministral-3-14B-Instruct-2512-UD-Q6_K_XL_unsloth.gguf


## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
| model=mistralai_Ministral-3-14B-Reasoning-2512-Q4_K_M.gguf
|  29 t/s | 41/41 |   0 |  64 k | 13.0 GB | ---   |   1342 |  47s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 1024/512     | 7.3/0.1   |                 |
|  28 t/s | 41/41 |   0 |  32 k | 10.4 GB | ---   |   2048 |  73s | none             | --                             | 1024/512     | 7.3/0.1   |                 |


| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| model=Ministral-3-14B-Instruct-2512-UD-Q6_K_XL_unsloth.gguf
|   9 t/s |  64 k |   5 | 41/41  | 15.7 GB | 10.6/0.7  | --    |    635 |  68s | none             | --                             | 1024/512     |                 |
|   9 t/s |  64 k |   0 | 41/41  | 15.7 GB | 10.6/0.7  | --    |    635 |  69s | none             | --                             | 1024/512     |                 |
|   7 t/s |  64 k |   0 | 41/41  | 15.7 GB | 10.6/0.7  | --    |    659 |  93s | DFlash (N-gram)  | s_M=12 s_N=5 min=1 (32%)       | 1024/512     |                 |
|   5 t/s |  64 k |   0 | 34/41  | 13.8 GB | 8.7/2.6   | --    |    635 | 138s | DFlash (N-gram)  | s_M=12 s_N=7 min=1 (37%)       | 1024/512     |                 |
 


```bash
cd scripts

#model=mistralai_Ministral-3-14B-Reasoning-2512-Q4_K_M.gguf
model=Ministral-3-14B-Instruct-2512-UD-Q6_K_XL_unsloth.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=5
spec=0
draft_model=none
predict_token=5/12
jinja=0
batch=1024
ubatch=512

```

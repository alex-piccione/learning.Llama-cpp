# Qwen 3.5 35B A3B

OpenAI tools compatibility    : ❌
| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
|  45 t/s | 128 k |   3 | 41/41  | 15.0 GB | 13.0/1.0  | --    |    978 |  22s | none             | --                             | 1024/256     |                 |
|  53 t/s | 128 k |   1 | 41/41  | 15.7 GB | 13.7/0.3  | --    |   2048 |  38s | none             | --                             | 1024/256     |                 |


https://huggingface.co/JThomas-CoE/coe-qwen3.5-coding-18b-a3b

https://huggingface.co/sandeshrajx/Qwen3.5-24B-A3B-REAP-0.32-GGUF

https://huggingface.co/noctrex/Qwen3.5-35B-A3B-MXFP4_MOE-GGUF


## ❌ 25B REAP A3B Coding Q4_K_M
https://huggingface.co/lainlives/Qwen3.5-25B-REAP-A3B-Coding?show_file_info=Qwen3.5-25B-REAP-A3B-Coding-Q4_K_M.gguf
Qwen3.5-25B-REAP-A3B-Coding-Q4_K_M_lainlives.gguf                    14.2 GB

No tool capability


```bash

model=Qwen3.5-25B-REAP-A3B-Coding-Q4_K_M_lainlives.gguf
ctx_k=128
cpu_moe=3
gpu_layers=-1
spec=0
draft_model=none
predict_token=0/0   # (N/M)
jinja=0
batch=1024
ubatch=256

```

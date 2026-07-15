# Qwen3-Coder


https://huggingface.co/danielus/Qwen3-Coder-REAP-25B-A3B-Q4_K_M-GGUF

## (downloading) Q4_NL (Unsloth)

https://huggingface.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF


## ❌ REAP 15B A3B Q4_K_M (by lainlives)
Qwen3-Coder-30B-A3B-instruct_pruned_REAP-15B-A3B-Q4_K_M_lainlives.gguf
❌ No tool calling capability

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
|  65 t/s |  64 k |   1 | 49/49  | 12.3 GB | 8.7/0.2   | --    |    440 |   6s | none             | --                             | 1024/256     |                 |
|  53 t/s |  64 k |   3 | 49/49  | 11.9 GB | 8.4/0.5   | --    |    440 |   8s | none             | --                             | 1024/256     |                 |



```bash
cd scripts

model=Qwen3-Coder-30B-A3B-instruct_pruned_REAP-15B-A3B-Q4_K_M_lainlives.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=1
spec=0
draft_model=none
predict_token=8/8
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


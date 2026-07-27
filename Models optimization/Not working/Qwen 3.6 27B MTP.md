# Qwen 3.6 27B MTP


## ❌ Claude Mythos Distilled MTP (by chatqaq)
https://huggingface.co/chatqaq/Qwen3.6-27B-Claude-Mythos-Distilled-MTP-GGUF
Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf                15.6 GB

With MTP can't reach 10 t/s

## ❌ MTP-UD-Q4_K_XL (by Unsloth)  [DELETED]
Qwen3.6-27B-MTP-UD-Q4_K_XL_unsloth.gguf                                16.8 GB

With MTP can't reach 10 t/s


## ❌ Q4_K_M MTP (by Unsloth)
Qwen3.6-27B-Q4_K_M_MTP_unsloth.gguf                                    15.9 GB

With MTP can't reach 10 t/s

## Run tests

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf
|  19 t/s |   8 k |   1 | 66/66  | 15.7 GB | 15.0/0.0  | --    |   1227 |  65s | DFlash (N-gram)  | s_M=12 s_N=8 min=1 (70%)       | 1024/256     | NO MTP !        |



```bash
cd scripts

model=Qwen3.6-27B-MTP-UD-Q4_K_XL_unsloth.gguf
ctx_k=32
gpu_layers=63
cpu_moe=1
spec=0
draft_model=none
predict_token=2/2
mtp=1
jinja=0
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
    $jinja \
    $batch \
    $ubatch
    
source test_models_common.sh && print_test_call


model=Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf
ctx_k=16
gpu_layers=-1
cpu_moe=1
spec=0
draft_model=none
predict_token=2/2
mtp=1
jinja=0
batch=1024
ubatch=256


model=Qwen3.6-27B-Q4_K_M_MTP_unsloth.gguf
ctx_k=8
gpu_layers=-1
cpu_moe=0
spec=0
draft_model=none
predict_token=0/2
mtp=1
jinja=0
batch=1024
ubatch=256


```
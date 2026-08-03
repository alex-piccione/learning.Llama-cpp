# Qwen 3.6 27B MTP

| File                                                       | Result                                      |
| Qwen3.6-27B-Cerebellum-v5-Q2_K_Mixed_deucebucket.gguf      | ✔️ Slow but fixed the TEST 01 very quickly  |
| Qwen3.6-27B-MTP-Q4_K_M_unsloth.gguf                        | ❌ too slow                                 |
| Qwen3.6-27B-MTP-IQ4_NL_unsloth.gguf                        | ❌ too slow                                 |




## ❌ MTP UD Q4_K_XL (by Unsloth)  [DELETED]
Qwen3.6-27B-MTP-UD-Q4_K_XL_unsloth.gguf                                16.8 GB
With MTP can't reach 10 t/s


## ❌ MTP Q4_K_M (by Unsloth)
Qwen3.6-27B-MTP-Q4_K_M_unsloth.gguf                                    15.9 GB
Can't reach 10 t/s


## ❌ MTP IQ4_NL (by Unsloth)
Qwen3.6-27B-MTP-IQ4_NL_unsloth.gguf                             15.2 GB
https://huggingface.co/unsloth/Qwen3.6-27B-MTP-GGUF   (many sizes)
1 t/s

## ❌ Claude Mythos Distilled MTP (by chatqaq)
https://huggingface.co/chatqaq/Qwen3.6-27B-Claude-Mythos-Distilled-MTP-GGUF
Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf                15.6 GB
With MTP can't reach 10 t/s

## Coder Compact MTP Q_3_K_M (by Jackrong)
Qwopus3.6-27B-Coder-Compat-MTP-Q3_K_M_jackrong.gguf           12.5 GB
https://huggingface.co/Jackrong/Qwopus3.6-27B-Coder-Compat-MTP-GGUF



## Run tests

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf
|  19 t/s |   8 k |   1 | 66/66  | 15.7 GB | 15.0/0.0  | --    |   1227 |  65s | DFlash (N-gram)  | s_M=12 s_N=8 min=1 (70%)       | 1024/256     | NO MTP !        |
| Qwopus3.6-27B-Coder-Compat-MTP-Q3_K_M_jackrong.gguf 
|  17 t/s |  64 k |   3 | 66/66  | 14.8 GB | 12.1/0.0  | --    |    591 |  35s | none             | --                             | 1024/256     |                 |



```bash
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
    $ubatch \
    $cache_kv
    
source test_models_common.sh && print_test_call
}


model=Qwopus3.6-27B-Coder-Compat-MTP-Q3_K_M_jackrong.gguf
ctx_k=128
cpu_moe=0
gpu_layers=-1
spec=1
draft_model=none
predict_token=12/12
mtp=0
jinja=0
batch=1024
ubatch=256


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
_test_model




model=Qwen3.6-27B-MTP-UD-Q4_K_XL_unsloth.gguf
ctx_k=8
gpu_layers=99
cpu_moe=5
spec=mtp
draft_model=none
predict_token=2/4
jinja=0
batch=1024
ubatch=256
_test_model

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


model=Qwen3.6-27B-MTP-IQ4_NL_unsloth.gguf
ctx_k=32
gpu_layers=-1
cpu_moe=5
spec=0
draft_model=none
predict_token=6/12
jinja=0
batch=1024
ubatch=256
_test_model

```
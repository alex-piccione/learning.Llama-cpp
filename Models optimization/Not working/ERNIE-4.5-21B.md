# Ernie 4.5 21B A3B Thinking

MTP: No

❌ ``--skip-chat-parsing`` parameter is required to get a OpenAI compatible response, but that kill the possibility of tools call compatibility  

❌ PiAgent:  Error: The model produced output that does not match the expected peg-native format


## Q4_K_M (by Unsloth)
File: ERNIE-4.5-21B-A3B-Thinking-Q4_K_M_unsloth.gguf
MoE: 
Max context: 128 k
OpenAI tools compatibility: ❌

## MXFP4_MOE (by noctrex)
File: ERNIE-4.5-21B-A3B-Thinking-MXFP4_MOE_noctrex.gguf
Max context: 1024 k  !!!
OpenAI tools compatibility : ❌


## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |
|  83 t/s | 29/29 |   0 |  16 k | 13.3 GB | ---   |   2048 |  25s | DFlash (N-gram)  | size_n=14 size_m=7 min_hits=1  | 1024/512     | 12.4/0.0 | File 1          |
|  46 t/s | 29/29 |   0 |  64 k | 13.9 GB | ---   |   2048 |  45s | DFlash (N-gram)  | size_n=14 size_m=7 min_hits=1  | 1024/512     | 11.5/0.9 | File 1          |
|  13 t/s | 53/53 |   0 |  64 k | 13.8 GB | ---   |   1132 |  87s | DFlash (N-gram)  | size_n=14 size_m=7 min_hits=1  | 1024/512     |  12/10.6 | File 2          |
|  13 t/s | 53/53 |   0 |  64 k | 13.8 GB | ---   |   1097 |  85s | DFlash (N-gram)  | size_n=14 size_m=11 min_hits=1 | 2048/512     |  12/10.6 | File 2          |
 

```bash
cd scripts

#model=unsloth_ERNIE-4.5-21B-A3B-Thinking-Q4_K_M.gguf
model=ERNIE-4.5-21B-A3B-Thinking-Q4_K_M_unsloth.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=3
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinja=0
batch=1024
ubatch=256

model=ERNIE-4.5-21B-A3B-Thinking-MXFP4_MOE_noctrex.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=3
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinja=0
batch=1024
ubatch=256


model=ERNIE-4.5-21B-A3B-Thinking.i1-Q4_K_M_mr_redermacher.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=3
spec=0
draft_model=none
predict_token=0/0
mtp=0
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

```

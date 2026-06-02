#


File: Jackrong_Qwen3.5-9B-DeepSeek-V4-Flash-MTP-Q8_0.gguf
HuggingFace: https://huggingface.co/Jackrong/Qwen3.5-9B-DeepSeek-V4-Flash-MTP-GGUF
Max context: 256 k
OpenAI tools compatibility : ✔️/❌



## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | -------- | --------------- |
|  39 t/s | 34/34 |   0 | 128 k | 12.7 GB | ---   |    859 |  22s | none             | --                             | 2515/512     | 8.1/1.0  |                 |
|  36 t/s | 34/34 |   2 | 192 k | 14.2 GB | ---   |   2048 |  56s | none             | --                             | 2048/512     | 8.1/1.0  | ❌ tools fail  |
|   7 t/s | 26/34 |   0 | 256 k | 13.4 GB | ---   |   2048 | 300s | none             | --                             | 2048/512     | 6.4/2.7  |                 |



```bash
cd scripts

# for 80k Context : -ngl 999 --n-cpu-moe 17 -c 80000 --no-mmap --mlock --cache-type-k q8_0 --cache-type-v q8_0 -fa on -ub 1024

model=Jackrong_Qwen3.5-9B-DeepSeek-V4-Flash-MTP-Q8_0.gguf
ctx_k=192
gpu_layers=-1
cpu_moe=2
dflash=0
draft_model=none
predict_token=6
mtp=1
jinjia=0
batch=2048
ubatch=512

source server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $dflash \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia \
    $batch \
    $ubatch

source test_models_common.sh && \
test_call_result_row $(flag_or $dflash $mtp)

```
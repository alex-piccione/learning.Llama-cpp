# MAmmoTH coder 13b

OpenAI tools compatibility: ❌

HuggingFace: https://huggingface.co/TIGER-Lab/MAmmoTH-Coder-13B
Model: tiger-lab_mammoth-coder-13b
Quantized by: https://huggingface.co/TIGER-Lab/MAmmoTH-Coder-13B
file: mammoth-coder-13b.Q4_K_M.gguf



## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | tokens | Time  | pred | pred acc | Batch/Ubatch | VRAM/RAM | Note                           |
|   4 t/s | 41/41 |   0 |  32 k | 15.7 GB | q8_0  |        |   0s |    0 |      0 % |            |          |                                |

```bash
cd scripts

model=mammoth-coder-13b.Q4_K_M.gguf
ctx_k=32
gpu_layers=999
cpu_moe=0
dflash=0
draft_model=none
predict_token=0
mtp=0
jinjia=0

source start_server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $dflash \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia

source test_models_common.sh && \
test_call_result_row $(flag_or $dflash $mtp)

```
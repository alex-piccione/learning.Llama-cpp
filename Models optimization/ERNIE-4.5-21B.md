# Erniw 4.5 21B A3B Thinking

- Hu6ggingFace link: (https://huggingface.co/Qwen/Qwen2.5-Coder-14B-Instruct-GGUF?show_file_info=qwen2.5-coder-14b-instruct-q4_k_m.gguf ?)
- Provider: unsloth
- ID: ERNIE-4.5-21B-A3B-Thinking-Q4_K_M.gguf
- MTP: No
- MoE: 
- OpenAI Tools capability:


## Run tests

Best result: 75 tk/s with 16K

| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            | 
 
old results
| GPU layer | CPU-MoE | Ctx  | Cache Type | Predict Token | VRAM    | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---           | ---     | --- | -- | ---                     |  
| 999       |       0 | 16 k | q8_0       |             0 |         |  75 |    |                         |

```bash
cd scripts

model=unsloth_ERNIE-4.5-21B-A3B-Thinking-Q4_K_M.gguf
ctx_k=16
gpu_layers=999
cpu_moe=0
dflash=0
draft_model="not-empty"
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

# Qwen 3 14B

## Qwen

- Hu6ggingFace link: https://huggingface.co/Qwen/Qwen3-14B-GGUF?show_file_info=Qwen3-14B-Q4_K_M.gguf
- Provider: Qwen
- ID: qwen_Qwen3-14B-Q4_K_M.gguf
- MTP: ?
- MoE: ?
- OpenAI Tools capability: ?



## Unsloth


- Hu6ggingFace link: https://huggingface.co/unsloth/Qwen3-14B-GGUF?show_file_info=Qwen3-14B-Q4_K_M.gguf
- Provider: Unsloth
- ID: unsloth_Qwen3-14B-Q4_K_M.gguf
- MTP: ?
- MoE: ?
- OpenAI Tools capability: ?


## Run tests

Unsloth
| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM   | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---    | --- | -- | ---                     |  
| 999       | 0       | 40 k | q8_0       | 11.4   |  27 | Ok |                         |
| 999       | 5       | 32 k | q8_0       | 11.4   |  27 | Ok |                         |
| 999       | 3       | 64 k | q8_0       | 14.1   |  27 | Ok |                         |

```bash
cd scripts

model=unsloth_Qwen3-14B-Q4_K_M.gguf
ctx_k=40
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
test_call $dflash

```
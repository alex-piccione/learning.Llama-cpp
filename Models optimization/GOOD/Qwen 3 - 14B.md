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
- Training context: 40k 
- OpenAI tools compatibility: ✔️


## Run tests

Best Result: **27 toksns/s on 40k context**.

| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            | 
| 41/41 |   0 |  64 k | 14.1 GB | q8_0  |  27 |    853 |  32s |    0 |      0 % |                                |
| 41/41 |   0 |  40 k | 12.1 GB | q8_0  |  27 |    832 |  31s |    0 |      0 % |                                |


Unsloth
| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM   | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---    | --- | -- | ---                     |  
| 999       | 0       | 40 k | q8_0       | 11.4   |  27 | Ok |                         |
| 999       | 5       | 32 k | q8_0       | 11.4   |  27 | Ok |                         |
| 999       | 3       | 64 k | q8_0       | 14.1   |  27 | Ok |                         |

```bash
cd scripts

model=unsloth_Qwen3-14B-Q4_K_M.gguf
ctx_k=64
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
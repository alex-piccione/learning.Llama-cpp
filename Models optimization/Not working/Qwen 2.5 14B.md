# ❌ Qwen 2.5 Coder 14B

- Hu6ggingFace link: (https://huggingface.co/Qwen/Qwen2.5-Coder-14B-Instruct-GGUF?show_file_info=qwen2.5-coder-14b-instruct-q4_k_m.gguf ?)
- Provider: (unsloth ?)
- ID: qwen2.5-coder-14b-instruct-q4_k_m.gguf
- MTP: No
- MoE: Yes
- OpenAI Tools capability: ❌
- Total Layers: 49


## Best Setup

Best Result: 26 tk/s with 64K

| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM      | Pred.Tk | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---       | ---     | --- | -- | ---                     |  
| 999       |       2 | 64 k | q8_0       |   14.8 GB |       0 |  26 |    |                         |
| 999       |       0 | 64 k | q8_0       |   15.6 GB |       0 |  26 |    |                         |
| 999       |       2 | 32 k | q8_0       |   11.6 GB |       0 |  26 |    |                         |
| 999       |       4 | 16 k | q8_0       |     10 GB |       0 |  26 |    |                         |
| 999       |       2 | 80 k | q8_0       |           |       0 |   7 |    |                         |
| 999       |       0 | 96 k | q8_0       |   15.6 GB |       0 |   3 |    |                         |
| 999       |       2 | 96 k | q8_0       |   15.6 GB |       0 |   3 |    |                         |
| 999       |       4 | 96 k | q8_0       |   15.6 GB |       0 |   3 |    |                         |

| 999       |       0 | 64 k | q8_0       |   15.6 GB |       0 |   3 |    |                         |

## Run tests

```bash
cd scripts

model="qwen2.5-coder-14b-instruct-q4_k_m.gguf"
ctx_k=64
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
test_call $dflash

```
# ❌ Qwen 2.5 14B

- Hu6ggingFace link: (https://huggingface.co/Qwen/Qwen2.5-Coder-14B-Instruct-GGUF?show_file_info=qwen2.5-coder-14b-instruct-q4_k_m.gguf ?)
- Provider: (unsloth ?)
- ID: qwen2.5-coder-14b-instruct-q4_k_m.gguf
- MTP: No
- MoE: Yes
- OpenAI Tools capability: ❌


## Best Setup

Result: 26 tk/s with 64K

| GPU layer | CPU-MoE | Ctx  | Cache Type | Predict Token | VRAM    | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---           | ---     | --- | -- | ---                     |  
| 999       |       4 | 16 k | q8_0       |             0 |   10 GB |  26 |    |                         |
| 999       |       2 | 32 k | q8_0       |             0 | 11.6 GB |  26 |    |                         |
| 999       |       2 | 64 k | q8_0       |             0 | 14.8 GB |  26 |    |                         |
| 999       |       0 | 64 k | q8_0       |             0 | 15.6 GB |  26 |    |                         | ?
| 999       |       0 | 96 k | q8_0       |             0 | 15.6 GB |   3 |    |                         | ?
| 999       |       2 | 96 k | q8_0       |             0 | 15.6 GB |   3 |    |                         |
| 999       |       4 | 96 k | q8_0       |             0 | 15.6 GB |   3 |    |                         |
| 999       |       2 | 80 k | q8_0       |             0 |         |   7 |    |                         |


## Run tests

```bash
cd scripts

source start_server_common.sh

model="qwen2.5-coder-14b-instruct-q4_k_m.gguf"
ctx_k=64
gpu_layers=999
cpu_moe=0
dflash=0
draft_model="not-empty"
predict_token=0
mtp=0
jinjia=0

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

```
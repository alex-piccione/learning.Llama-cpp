# Qwen 3.6 27B

- Hu6ggingFace link: 
- Provider: unsloth
- ID: Qwen3.6-27B-Q4_K_M.gguf
- MTP: No
- MoE: Yes
- OpenAI Tools capability: ?


## Run tests

Result: 1 tk/s

| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            | 

| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM    | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---     | --- | -- | ---                     |  
| 999       |       6 | 16 k | q8_0       |  16 GB  |   1 |    |                         |
| 999       |      12 | 16 k | q8_0       |  16 GB  |   1 |    |                         |
| 999       |      10 | 16 k | q8_0       |  16 GB  |   1 |    |                         |

```bash
cd scripts

model=unsloth_Qwen3.6-27B-Q4_K_M.gguf
ctx_k=16
gpu_layers=999
cpu_moe=10
dflash=0
draft_model="not-empty"
predict_token=2
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
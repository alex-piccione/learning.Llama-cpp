# Qwen 3.6 27B

- Hu6ggingFace link: 
- Provider: unsloth
- ID: Qwen3.6-27B-Q4_K_M.gguf
- MTP: No
- MoE: Yes
OpenAI tools compatibility: ✔️


Draft models for DFlash:
- Qwen3.5-2B-Q4_K_M.gguf 
- (❌ not supported) anbeeld_Qwen3.6-27B-DFlash-Q4_K_M.gguf (https://huggingface.co/Anbeeld/Qwen3.6-27B-DFlash-GGUF?show_file_info=Qwen3.6-27B-DFlash-Q4_K_M.gguf)


## Run tests

Result: 1 tk/s


|   2 t/s | 65/65 |   5 |  16 k | 15.7 GB | q8_0  |   1072 | 552s |    0 |      40 % | 1024/512     | 15.0/0.1 | predict=6                                |

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
cpu_moe=0
dflash=1
draft_model=none
draft_model=Qwen3.5-2B-Q4_K_M.gguf 
predict_token=4
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
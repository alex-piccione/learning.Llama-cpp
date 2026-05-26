# Nemotron 3 Nano 30B

HuggingFace link: https://huggingface.co/unsloth/Nemotron-3-Nano-30B-A3B-GGUF?show_file_info=Nemotron-3-Nano-30B-A3B-Q4_K_M.gguf
Povider: Unsloth
Id: Nemotron-3-Nano-30B-A3B-Q4_K_M.gguf
Total layers: 53


## Run tests

Best result: **16 tokens/s with 16K context**.  
  
| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| 49/53 |  18 |  16 k | 15.7 GB | q8_0  |  13 |    556 |  42s |    0 |      0 % |                                |
| 53/53 |  18 |  16 k | 15.7 GB | q8_0  |  16 |    880 |  56s |    0 |      0 % |                                |
| 53/53 |  18 |  16 k | 15.7 GB | q8_0  |  13 |   1014 |  80s |    0 |      0 % |                                |

old tests  
| GPU layer | GPU | CPU-MoE | Ctx  | Cache Type | VRAM      | T/s | Pi | Note                    |  
| ---       | --- | ------- | ---- | ---        | ----------| --- | -- | ---                     |  
| 999       | 999 |      18 | 16 k | q8_0       |           |  16 |    |                         |
| 999       | 999 |      20 | 16 k | q8_0       | 15.7/16.0 |  16 |    |                         |
| 999       |  51 |      20 | 16 k | q8_0       | 15.7/16.0 |  14 |    |                         |
| 999       |  49 |      16 | 20 k | q8_0       | 15.7/16.0 |  13 |    |                         |
| 999       |  33 |       0 | 16 k | q8_0       | 15.7/16.0 |   8 |    |                         |
| 999       | 999 |      17 | 32 k | q8_0       |           |   2 |    |                         |
| 999       | 999 |       5 | 32 k | q8_0       |           |   1 |    |                         |
| 999       | 999 |      10 | 32 k | q8_0       |           |   1 |    |                         |
| 999       | 999 |      16 | 16 k | q8_0       |           |   2 |    |                         |
| 999       | 999 |      16 | 20 k | q8_0       |           |   2 |    |                         |


```bash
cd scripts

model=unsloth_Nemotron-3-Nano-30B-A3B-Q4_K_M.gguf
ctx_k=16
gpu_layers=999
cpu_moe=18
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
# Gemma4 E26B

- Hu6ggingFace link: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF
- Provider: Unsloth
- ID: gemma-4-26B-A4B-it-UD-Q4_K_M.gguf
- MTP: NO
- MOE: Yes
- OpenAI tools compatibility: ✔️

Best Result: **27 tk/s with 64K context** 

| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            |
| 31/31 |   5 |  64 k | 15.7 GB | q8_0  |  29 |   1463 |  51s |    0 |      0 % |                                |
| 31/31 |   5 |  64 k | 15.7 GB | q8_0  |  28 |    802 |  29s |    0 |      0 % | Batch=2048                     |
| 31/31 |   5 |  64 k | 14.8 GB | q8_0  |  28 |   1576 |  55s |    0 |      0 % | Batch=512                      |
| 31/31 |   6 |  96 k | 15.0 GB | q8_0  |  27 |   1246 |  47s |    0 |      0 % |                                |
| 31/31 |   6 |  80 k | 14.8 GB | q8_0  |  27 |   1761 |  66s |    0 |      0 % |                                |
| 31/31 |   6 | 128 k | 15.3 GB | q8_0  |  26 |    745 |  28s |    0 |      0 % |                                |
| 31/31 |   6 |  64 k | 15.2 GB | q8_0  |  26 |   1683 |  64s |    0 |      0 % |                                |
| 31/31 |   5 |  80 k | 15.7 GB | q8_0  |  23 |   1172 |  50s |    0 |      0 % |                                |
| 29/31 |   5 |  64 k | 15.0 GB | q8_0  |  22 |    708 |  32s |    0 |      0 % |                                |
| 29/31 |   6 | 128 k | 15.2 GB | q8_0  |  21 |   1741 |  82s |    0 |      0 % |                                |
| 29/31 |   7 |  64 k | 14.1 GB | q8_0  |  20 |    822 |  40s |    0 |      0 % |                                |
| 31/31 |   4 |  64 k | 15.7 GB | q8_0  |  16 |    883 |  56s |    0 |      0 % |                                |



| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM   | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---    | --- | -- | ---                     |  
| 999       | 5       | 64 k | q8_0       | 15.7   |  27 | Ok |                         |
| 999       | 5       | 96 k | q8_0       | 15.7   |  24 | Ok |                         |
| 999       | 6       | 96 k | q8_0       | 15.6   |  23 |    |                         |
| 999       | 5       | 48 k | q8_0       | 15.5   |  27 | Ok |                         |
| 999       | 5       | 32 k | q8_0       | 15.4   |  27 | Ok |                         |
| 999       | 5       | 16 k | q8_0       | 14.9   |  27 | Ok |                         |
| 999       | 3       | 16 k | q8_0       | 15.9   |  30 |    |                         |
| 999       | 5       | 32 k | q8_0       | 15.1   |  25 |    |                         |
| 999       | 8       | 32 k | q8_0       | 13.5   |  20 |    |                         |
| 999       | 6       | 32 k | q8_0       | 14.9   |  25 |    |                         |
| 999       | 4       | 32 k | q8_0       | 15.7   |  26 |    |                         |


## Run tests

```bash
cd scripts

model=unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=5
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
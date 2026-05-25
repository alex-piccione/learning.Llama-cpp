# Gemma4 E26B

- Hu6ggingFace link: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF
- Provider: unsloth
- ID: gemma-4-26B-A4B-it-UD-Q4_K_M.gguf
- MTP: NO
- MoE: Yes
- OpenAI Tools capability: yes


Result: **30 tk/s** on llema-server UI  (using 15.9/16 GB VRAM)


| GPU layer | CPU-MoE | Ctx  | Cache Type | VRAM   | T/s | Pi | Note                    |  
| ---       | ---     | ---- | ---        | ---    | --- | -- | ---                     |  
| 999       | 5       | 32 k | q8_0       | 14.9   |  27 | Ok |                         |
| 999       | 5       | 16 k | q8_0       | 14.9   |  27 | Ok |                         |
| 999       | 3       | 16 k | q8_0       | 15.9   |  30 |    |                         |
| 999       | 5       | 32 k | q8_0       | 15.1   |  25 |    |                         |
| 999       | 8       | 32 k | q8_0       | 13.5   |  20 |    |                         |
| AAA                                                          |✔️| ?    GB |   ? k |   ? % |   27 |  30 s |✔️|〰️|                                          |


## Run tests

```bash

```sh
cd scripts

model="unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf"
ctx_k=32
gpu_layers=999
cpu_moe=5
dflash=0
draft_model=none
predict_token=8
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

printf "| %-40s      |✔️| ?    GB |   ? k |   ? % |   27 |  30 s |✔️|〰️|                                          |"

```
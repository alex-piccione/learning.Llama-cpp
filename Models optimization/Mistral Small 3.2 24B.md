# Mistral Small 3.2 24B Instruct

- Hu6ggingFace link: 
- Provider: unsloth
- ID: Mistral-Small-3.2-24B-Instruct-2506-Q4_K_M.gguf
- MTP: ?
- MoE: ?
- OpenAI tools compatibility: ✔️


## Run tests

Best Result: 

| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            | 
| 41/41 |  10 |  16 k | 15.1 GB | q8_0  |  18 |   1006 |  57s |    0 |      0 % |                                |
| 41/41 |   8 |  16 k | 15.1 GB | q8_0  |  18 |   1053 |  60s |    0 |      0 % |                                |



```bash
cd scripts

model=unsloth_Mistral-Small-3.2-24B-Instruct-2506-Q4_K_M.gguf
ctx_k=16
gpu_layers=999
cpu_moe=8
dflash=0
draft_model=none
predict_token=6
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
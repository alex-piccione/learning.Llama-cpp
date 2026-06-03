# Qwen 3.6 27B MTP


## 1
Hu6ggingFace link: 
Quantized by: Unsloth
File 1: unsloth_Qwen3.6-27B-MTP-UD-Q4_K_XL.gguf
MTP: Yes
MoE: ?
OpenAI Tools capability: ?


## 2

File 2: unsloth_Qwen3.6-27B-Q4_K_M_MTP.gguf  (16.705KB)


## Run tests

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
| mr_radermacher_Qwen3.6-27B-Esper3.1.Q4_K_M.gguf


| GPU   | MoE | Ctx   | VRAM    | Cache | t/s | tokens | Time | pred | pred acc | Note                           |
| ---   | --- | ---   | ---     | ---   | --- | ---    | ---  | ---  | ---      | ---                            | 
| 999   |  10 |   16  |                 | 0.4 |   
| 999   |  12 |   16  |                 | ?   |   
| 999   |   8 |    8  |                 | 0.6 |   
| 999   |  15 |    8  |                 | 0.6 |   


```bash
cd scripts

#model=unsloth_Qwen3.6-27B-MTP-UD-Q4_K_XL.gguf
#model=unsloth_Qwen3.6-27B-Q4_K_M_MTP.gguf


ctx_k=8
gpu_layers=-1
# nothing worked... from 2 to 14 !!!
cpu_moe=10
dflash=0
draft_model=none
predict_token=20
mtp=1
jinjia=0
batch=1024
ubatch=256

source server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $dflash \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia \
    $batch \
    $ubatch

source test_models_common.sh && \
test_call_result_row $(flag_or $dflash $mtp)

```
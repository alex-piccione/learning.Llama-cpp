# Nemotron 3 Nano 30B

HuggingFace: https://huggingface.co/unsloth/Nemotron-3-Nano-30B-A3B-GGUF?show_file_info=Nemotron-3-Nano-30B-A3B-Q4_K_M.gguf
Quantized by: Unsloth
File: Nemotron-3-Nano-30B-A3B-Q4_K_M.gguf
MTP: No
MoE:
Max context: 1024 k
OpenAI tools compatibility: ✔️


## Run tests

Best result: **16 tokens/s with 16K context**.  

| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
|  18 t/s | 53/53 |  20 |  16 k | 15.7 GB | ---   |   1201 |  68s | DFlash (N-gram)  | size_n=14 size_m=9 min_hits=1  | 1024/384     | 15.2/7.7  | ❌ tool fail   |
|  17 t/s | 53/53 |  20 |  16 k | 15.7 GB | ---   |    850 |  50s | DFlash (N-gram)  | size_n=14 size_m=10 min_hits=1 | 1024/384     | 15.2/7.7  |                 |
|  17 t/s | 53/53 |  20 |  16 k | 15.7 GB | ---   |    889 |  52s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 1024/512     | 15.2/7.7  |                 |
|  17 t/s | 53/53 |  19 |  16 k | 15.7 GB | ---   |    716 |  42s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 1024/512     | 15.2/7.7  |                 |
|  16 t/s | 53/53 |  20 |  16 k | 15.7 GB | ---   |    683 |  43s | DFlash (N-gram)  | size_n=14 size_m=8 min_hits=1  | 1024/256     | 15.2/7.7  |                 |
|  15 t/s | 53/53 |  21 |  16 k | 15.6 GB | ---   |    965 |  65s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 1024/512     | 14.2/8.7  |                 |
|  13 t/s | 53/53 |   0 |  64 k | 13.8 GB | ---   |    989 |  77s | DFlash (N-gram)  | size_n=14 size_m=7 min_hits=1  | 1024/512     |  12/10.6  |                 |
|  13 t/s | 53/53 |   0 |  32 k | 13.7 GB | ---   |   1352 | 105s | none             | --                             | 1024/512     |  12/10.6  | MoE ignored ?   |
|  12 t/s | 53/53 |   0 |  16 k | 13.7 GB | ---   |    598 |  48s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 1024/512     |  12/10.6  |                 |
|   4 t/s | 53/53 |  17 |  16 k | 15.7 GB | ---   |   1707 | 461s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 1024/512     | 16.3/6.6  |                 |
|   4 t/s | 53/53 |  16 |  16 k | 15.7 GB | ---   |    927 | 222s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 1024/512     | 16.3/6.6  |                 |
|   2 t/s | 53/53 |   5 |  16 k | 15.7 GB | ---   |    696 | 341s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 1024/512     | 20.6/2.3  |                 |
|   2 t/s | 53/53 |   1 |  16 k | 15.7 GB | ---   |    692 | 453s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 1024/512     | 22.7/0.2  |                 |
|   3 t/s | 53/53 |  10 |  16 k | 15.7 GB | ---   |    700 | 257s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 1024/512     | 18.7/4.2  |                 |



```bash
cd scripts

model=unsloth_Nemotron-3-Nano-30B-A3B-Q4_K_M.gguf
ctx_k=16
gpu_layers=-1
cpu_moe=20
dflash=1
draft_model=none
predict_token=6
mtp=0
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
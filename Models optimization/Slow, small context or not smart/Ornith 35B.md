# Ornith
https://huggingface.co/liodon-ai/Ornith-1.0-35B-GGUF-imatrix-GGUF


| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
|  55 t/s | 128 k |   1 | 41/41  | 15.7 GB | 13.8/0.4  | --    |   1040 |  19s | none             | --                             | 512/256      |                 |
|  56 t/s |  64 k |   1 | 41/41  | 15.0 GB | 13.8/0.4  | --    |   1040 |  19s | none             | --                             | 1024/256     |                 |
|  49 t/s |  64 k |   2 | 41/41  | 14.6 GB | 13.5/0.7  | --    |    639 |  13s | none             | --                             | 1024/256     |                 |
|  42 t/s |  64 k |   3 | 41/41  | 14.3 GB | 13.1/1.1  | --    |    635 |  16s | none             | --                             | 1024/256     |                 |


## IQ3_M
https://huggingface.co/liodon-ai/Ornith-1.0-35B-GGUF-imatrix-GGUF?show_file_info=Ornith-1.0-35B-GGUF-IQ3_M.gguf
Ornith-1.0-35B-GGUF-IQ3_M_liodonai.gguf                 14.3 G

```bash

model=Ornith-1.0-35B-GGUF-IQ3_M_liodonai.gguf
ctx_k=128
cpu_moe=1
gpu_layers=-1
spec=0
draft_model=none
predict_token=0/0
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
    $spec \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia \
    $batch \
    $ubatch

source test_models_common.sh && print_test_call

```

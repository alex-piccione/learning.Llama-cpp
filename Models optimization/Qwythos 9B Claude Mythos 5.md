# Qwythos 9B Claude Mythos 5

Max context                   : 1024 k
OpenAI tools compatibility    : ✔️

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Q4_K_M (bt empero-ai)
|  39 t/s | 256 k |   1 | 33/33  | 10.3 GB | 4.7/0.1   | --    |   1100 |  28s | none             | --                             | 768/256      |                 |
|  39 t/s | 256 k |   0 | 33/33  | 10.5 GB | 4.7/0.3   | --    |    674 |  17s | DFlash (N-gram)  | s_M=6 s_N=12 min=1             | 1024/512     |                 |
|  39 t/s | 128 k |   0 | 33/33  |  7.6 GB | 4.7/0.1   | --    |   1100 |  28s | none             | --                             | 1024/256     |                 |
|  40 t/s |  64 k |   0 | 33/33  |  6.3 GB | 4.7/0.0   | --    |   1100 |  28s | none             | --                             | 1024/256     |                 |
| Q4_K_M MTP (bt empero-ai) 
|  57 t/s | 256 k |   0 | 34/34  | 12.1 GB | 4.9/0.1   | --    |    710 |  12s | none             | 2/8 (86%)                      | 1024/256     |                 |
|  57 t/s | 256 k |   0 | 34/34  | 12.1 GB | 4.9/0.1   | --    |    710 |  13s | none             | 2/8 (86%)                      | 1024/256     |                 |
|  56 t/s | 256 k |   0 | 34/34  | 12.2 GB | 4.9/0.1   | --    |    710 |  13s | none             | 2/10 (85%)                     | 1024/256     |                 |
|  52 t/s | 256 k |   1 | 34/34  | 11.9 GB | 4.9/0.1   | --    |    854 |  16s | none             | 1/4 (93%)                      | 768/256      |                 |
|  52 t/s | 256 k |   0 | 34/34  | 12.0 GB | 4.9/0.1   | --    |    754 |  15s | none             | 2/5 (92%)                      | 768/256      |                 |
|  51 t/s | 256 k |   0 | 34/34  | 12.2 GB | 4.9/0.1   | --    |    686 |  13s | none             | 5/10 (88%)                     | 1024/256     |                 |

|  50 t/s | 256 k |   0 | 34/34  | 12.3 GB | 4.9/0.1   | --    |    713 |  14s | none             | 4/12 (82%)                     | 1024/256     |                 |
|  60 t/s | 256 k |   0 | 34/34  | 12.3 GB | 4.9/0.1   | --    |   1190 |  19s | none             | 4/12 (87%)                     | 1024/256     |                 |
|  47 t/s | 256 k |   0 | 34/34  | 12.5 GB | 4.9/0.1   | --    |    714 |  15s | none             | 5/15 (79%)                     | 1024/256     |                 |
|  50 t/s | 256 k |   0 | 34/34  | 12.5 GB | 4.9/0.1   | --    |    686 |  14s | none             | 5/15 (78%)                     | 1024/256     |                 |



## Q4_K_M (bt empero-ai)
https://huggingface.co/empero-ai/Qwythos-9B-Claude-Mythos-5-1M-GGUF


```bash
model=Qwythos-9B-Claude-Mythos-5-1M-Q4_K_M_emperoai.gguf
ctx_k=256
gpu_layers=-1
cpu_moe=1
spec=0
draft_model=none
predict_token=0/0  # N lookup /M predict
mtp=0
jinjia=0
batch=768
ubatch=256
```

## Q4_K_M MTP (bt empero-ai) 

```bash

model=Qwythos-9B-Claude-Mythos-5-1M-MTP-Q4_K_M_emperoai.gguf
ctx_k=256
gpu_layers=-1
cpu_moe=0
spec=0
draft_model=none
predict_token=2/8  # MTP, draft-mtp (min: 1, max: 4)
mtp=1
jinjia=0
batch=1024
ubatch=256

```


```bash
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
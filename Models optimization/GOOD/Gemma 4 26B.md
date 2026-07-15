# Gemma 4 26B A4B

Model: Gemma 4 26B
MTP: NO
MOE: Yes
Max contenxt: 256 k
OpenAI tools compatibility: ✔️


## UD IQ4_NL (by Unsloth)
Huggingface: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF
Quantizer: Unsloth
File: Gemma-4-26B-A4B-it-UD-IQ4_NL_unsloth.gguf
Size: 12.6 GB

## Q4_0 (by Google)
File: Gemma-4-26B_Q4_0-it_google.gguf
Quantized by: Google
Size: 13.4 GB

## ✔️ MXFP4 MOE (by Noctrex)
HuggingFace: https://huggingface.co/noctrex/gemma-4-26B-A4B-it-MXFP4_MOE-GGUF
Provider: Noctrex
File: Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf
Size: 14.3 GB


## ✔️ Q4_K_M (by Unsloth) 
HuggingFace: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF
Quantizer: Unsloth
File: Gemma-4-26B-A4B-it-UD-Q4_K_M_unsloth.gguf


## PRISM-PRO-DQ-GGUF (by Ex0bit)
https://huggingface.co/Ex0bit/Gemma4-26B-A4B-PRISM-PRO-DQ-GGUF
https://huggingface.co/Ex0bit/Gemma4-26B-A4B-PRISM-PRO-DQ-GGUF    (downloading)



## QAT (by Unsloth)
Huggingface: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-qat-GGUF
Quantizer: Unsloth
File: Gemma-4-26B-A4B-it-qat-UD-Q4_K_XL_unsloth.gguf
Draft_file_1:



## Run tests

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Gemma-4-26B_Q4_0-it_google.gguf
|  48 t/s | 160 k |   1 | 31/31  | 15.7 GB | 13.0/0.4  | --    |   1320 |  28s | none             | --                             | 1024/256     |                 |
|  46 t/s | 160 k |   1 | 31/31  | 15.7 GB | 13.0/0.4  | --    |   1320 |  28s | none             | --                             | 1024/256     |                 |
|  48 t/s | 128 k |   1 | 31/31  | 15.4 GB | 13.0/0.4  | --    |   1320 |  27s | none             | --                             | 1024/256     |                 |
|  49 t/s |  96 k |   1 | 31/31  | 14.9 GB | 13.0/0.4  | --    |   1320 |  27s | none             | --                             | 1024/256     |                 |
| Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf
|  37 t/s | 128 k |   1 | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1525 |  41s | none             | --                             | 1024/256     |                 |
|  37 t/s | 128 k |   1 | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1190 |  32s | DFlash (N-gram)  | s_M=8 s_N=8 min=1 (46%)        | 1024/256     |                 |
|  38 t/s | 128 k |   1 | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1498 |  40s | DFlash (N-gram)  | s_M=12 s_N=8 min=1 (33%)       | 1024/256     |                 |
|  36 t/s | 128 k |   1 | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1502 |  42s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (19%)      | 1024/256     |                 |
|  36 t/s | 128 k |   1 | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1525 |  43s | DFlash (N-gram)  | s_M=4 s_N=6 min=1              | 1024/256     |                 |
|  33 t/s | 128 k |   1 | 31/31  | 15.7 GB | 14.0/1.8  | --    |   2012 |  61s | DFlash (N-gram)  | s_M=6 s_N=4 min=1 (38%)        | 1024/256     |                 |
|  33 t/s | 128 k |   2 | 31/31  | 15.7 GB | 13.6/2.1  | --    |   1344 |  41s | none             | --                             | 1024/256     |                 |
|  23 t/s | 128 k |   0 | 31/31  | 13.9 GB | 11.7/4.0  | --    |   1031 |  45s | none             | --                             | 1024/256     |                 |
| Gemma-4-26B-A4B-it-UD-IQ4_NL_unsloth.gguf
|  39 t/s | 160 k |   1 | 31/31  | 15.2 GB | 12.3/1.1  | --    |   1228 |  32s | none             | --                             | 1024/256     |                 |
|  36 t/s | 160 k |   1 | 31/31  | 15.2 GB | 12.3/1.1  | --    |   1228 |  34s | none             | --                             | 1024/256     |                 |
|  28 t/s | 160 k |   0 | 31/31  | 14.0 GB | 11.3/2.1  | --    |   1312 |  46s | none             | --                             | 1024/256     |                 |
|  48 t/s |  64 k |   0 | 31/31  | 14.0 GB | 12.7/0.7  | --    |   2048 |  42s | none             | --                             | 1024/256     |                 |
|  46 t/s |  64 k |   0 | 31/31  | 13.9 GB | 12.7/0.7  | --    |   3042 |  67s | none             | --                             | 1024/256     |                 |
|  42 t/s |  80 k |   0 | 31/31  | 13.9 GB | 12.4/1.0  | --    |   3042 |  71s | none             | --                             | 1024/256     |                 |
|  40 t/s |  96 k |   1 | 31/31  | 14.2 GB | 12.3/1.1  | --    |   1228 |  31s | none             | --                             | 1024/256     |                 |
|  39 t/s |  96 k |   0 | 31/31  | 13.9 GB | 12.1/1.3  | --    |   3056 |  79s | none             | --                             | 1024/256     |                 |
|  39 t/s |  80 k |   1 | 31/31  | 14.0 GB | 12.3/1.1  | --    |   1228 |  31s | none             | --                             | 1024/256     |                 |
|  38 t/s | 128 k |   1 | 31/31  | 14.7 GB | 12.3/1.1  | --    |   1228 |  33s | none             | --                             | 1024/256     |                 |
|  35 t/s | 128 k |   1 | 31/31  | 14.7 GB | 12.3/1.1  | --    |   1228 |  34s | none             | --                             | 1024/256     |                 |
|  33 t/s | 128 k |   0 | 31/31  | 14.0 GB | 11.8/1.6  | --    |   1615 |  49s | none             | --                             | 1024/256     |                 |
|  32 t/s | 128 k |   2 | 31/31  | 14.3 GB | 12.0/1.4  | --    |   1683 |  53s | none             | --                             | 1024/256     |                 |
|  31 t/s |  64 k |   2 | 31/31  | 13.4 GB | 12.0/1.4  | --    |   1683 |  53s | none             | --                             | 1024/256     |                 |
|  35 t/s |  64 k |   1 | 31/31  | 13.7 GB | 12.3/1.1  | --    |   1228 |  34s | none             | --                             | 1024/256     |                 |



```bash
cd scripts

model=Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf
ctx_k=128
cpu_moe=1
gpu_layers=-1
spec=0
draft_model=none
predict_token=0/0   # (N/M)
mtp=0
jinjia=0
batch=1024
ubatch=256



model=Gemma-4-26B_Q4_0-it_google.gguf
ctx_k=160
cpu_moe=1
gpu_layers=-1
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinjia=0
batch=1024
ubatch=256

model=Gemma-4-26B-A4B-it-UD-IQ4_NL_unsloth.gguf
ctx_k=64
cpu_moe=0
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

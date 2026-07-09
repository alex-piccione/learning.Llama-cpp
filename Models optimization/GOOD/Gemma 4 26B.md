# Gemma 4 26B

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

## MXFP4 MOE Noctrex
HuggingFace: https://huggingface.co/noctrex/gemma-4-26B-A4B-it-MXFP4_MOE-GGUF
Provider: noctrex
File: Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf
Size: 14.3 GB


## it (by Unsloth) 
HuggingFace: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF              
Quantizer: Unsloth
File: Gemma-4-26B-A4B-it-UD-Q4_K_M_unsloth.gguf



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
|  38 t/s | 128 k |   1 | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1525 |  40s | none             | --                             | 1024/256     |                 |
|  33 t/s | 128 k |   2 | 31/31  | 15.7 GB | 13.6/2.1  | --    |   1344 |  41s | none             | --                             | 1024/256     |                 |
| Gemma-4-26B-A4B-it-UD-IQ4_NL_unsloth.gguf
|  39 t/s | 160 k |   1 | 31/31  | 15.2 GB | 12.3/1.1  | --    |   1228 |  32s | none             | --                             | 1024/256     |                 |
|  46 t/s |  64 k |   0 | 31/31  | 13.9 GB | 12.7/0.7  | --    |   3042 |  67s | none             | --                             | 1024/256     |                 |
|  42 t/s |  80 k |   0 | 31/31  | 13.9 GB | 12.4/1.0  | --    |   3042 |  71s | none             | --                             | 1024/256     |                 |
|  40 t/s |  96 k |   1 | 31/31  | 14.2 GB | 12.3/1.1  | --    |   1228 |  31s | none             | --                             | 1024/256     |                 |
|  39 t/s |  96 k |   0 | 31/31  | 13.9 GB | 12.1/1.3  | --    |   3056 |  79s | none             | --                             | 1024/256     |                 |
|  39 t/s |  80 k |   1 | 31/31  | 14.0 GB | 12.3/1.1  | --    |   1228 |  31s | none             | --                             | 1024/256     |                 |
|  35 t/s | 128 k |   1 | 31/31  | 14.7 GB | 12.3/1.1  | --    |   1228 |  34s | none             | --                             | 1024/256     |                 |
|  28 t/s | 128 k |   0 | 31/31  | 14.0 GB | 11.8/1.6  | --    |   1615 |  58s | none             | --                             | 1024/256     |                 |
|  32 t/s | 128 k |   2 | 31/31  | 14.3 GB | 12.0/1.4  | --    |   1683 |  53s | none             | --                             | 1024/256     |                 |
|  31 t/s |  64 k |   2 | 31/31  | 13.4 GB | 12.0/1.4  | --    |   1683 |  53s | none             | --                             | 1024/256     |                 |
|  35 t/s |  64 k |   1 | 31/31  | 13.7 GB | 12.3/1.1  | --    |   1228 |  34s | none             | --                             | 1024/256     |                 |


| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | tokens | Time | pred | pred acc | Batch/Ubatch | VRAM/RAM | Note                           |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---- | -------- | ------------ | -------- | ------------------------------ |
| Gemma-4-26B-A4B-it-UD-Q4_K_M_unsloth.gguf                                                                                                    |
|  33 t/s | 31/31 |   3 |  64 k | 15.7 GB | q8_0  |    997 |  30s |    0 |      0 % | 512/256      | 14.4/2.1 |                                |
|  28 t/s | 31/31 |   5 |  64 k | 15.1 GB | q8_0  |   1600 |  56s |    0 |      0 % | 1024/512     | 13.6/2.9 |                                |
|   4 t/s | 31/31 |   1 | 128 k |         | q8_0  |   1600 |  56s |    0 |      0 % | 1024/512     |          |                                |
|   3 t/s | 31/31 |   2 |  64 k | 15.7 GB | q8_0  |   1419 | 416s |    0 |      0 % | 512/256      | 14.9/1.6 |                                |


| Speed   | Ctx   | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf    
|  40 t/s | 128 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1630 |  40s | none             | --                             | 1024/512     | GPU not underclocked |
|  38 t/s | 128 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1349 |  35s | none             | --                             | 1024/512     |                 |
|  23 t/s | 128 k | 31/31  | 13.9 GB | 11.6/4.1  | --    |   1621 |  72s | none             | --                             | 1024/512     |                 |
|  15 t/s | 112 k | 30/31  | 15.7 GB | 13.9/1.8  | --    |   1480 |  97s | none             | --                             | 512/256      |                 |
|  30 t/s | 128 k | 30/31  | 15.7 GB | 13.9/1.8  | --    |   1480 |  49s | none             | --                             | 512/256      |                 |
|  36 t/s |  64 k | 31/31  | 15.4 GB | 14.0/1.8  | --    |   1525 |  41s | none             | --                             | 512/256      |                 |
|  27 t/s |  64 k | 30/31  | 15.2 GB | 13.9/1.8  | --    |   1480 |  54s | none             | --                             | 512/256      |                 |


```bash
cd scripts

#model=unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf
model=Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf
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


### Real agent coding performance


Prompt

```text
gh auth status gives me this output:

github.com
  ✓ Logged in to github.com account alex-cyber-75 (GITHUB_TOKEN)
  - Active account: true
  - Git operations protocol: https
  - Token: ghp_************************************
  - Token scopes: 'repo'
  ! Missing required token scopes: 'read:org'
  - To request missing scopes, run: gh auth refresh -h github.com

What does it mean?
```
  



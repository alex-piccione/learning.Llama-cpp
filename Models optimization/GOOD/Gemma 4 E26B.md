# Gemma 4 E26B

Model: Gemma 4 E26B
MTP: NO
MOE: Yes
Max contenxt: 256 k
OpenAI tools compatibility: ✔️


## Unsloth 
HuggingFace: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF              
Quantizer: Unsloth
File: Gemma-4-26B-A4B-it-UD-Q4_K_M_unsloth.gguf

## Unsloth UD IQ4_NL
Huggingface: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF
Quantizer: Unsloth
File: Gemma-4-26B-A4B-it-UD-IQ4_NL_unsloth.gguf

## Unsloth QAT
Huggingface: https://huggingface.co/unsloth/gemma-4-26B-A4B-it-qat-GGUF
Quantizer: Unsloth
File: Gemma-4-26B-A4B-it-qat-UD-Q4_K_XL_unsloth.gguf
Draft_file_1:




## Noctrex
HuggingFace: https://huggingface.co/noctrex/gemma-4-26B-A4B-it-MXFP4_MOE-GGUF
Provider: noctrex
File: Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf


## Run tests

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf
|  38 t/s | 128 k |   1 | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1525 |  40s | none             | --                             | 1024/256     |                 |
|  33 t/s | 128 k |   2 | 31/31  | 15.7 GB | 13.6/2.1  | --    |   1344 |  41s | none             | --                             | 1024/256     |                 |
| Gemma-4-26B-A4B-it-UD-IQ4_NL_unsloth.gguf
|  46 t/s |  64 k |   0 | 31/31  | 13.9 GB | 12.7/0.7  | --    |   3042 |  67s | none             | --                             | 1024/256     |                 |
|  42 t/s |  80 k |   0 | 31/31  | 13.9 GB | 12.4/1.0  | --    |   3042 |  71s | none             | --                             | 1024/256     |                 |
|  39 t/s |  96 k |   0 | 31/31  | 13.9 GB | 12.1/1.3  | --    |   3056 |  79s | none             | --                             | 1024/256     |                 |
|  39 t/s |  80 k |   1 | 31/31  | 14.0 GB | 12.3/1.1  | --    |   1228 |  31s | none             | --                             | 1024/256     |                 |
|  35 t/s | 128 k |   1 | 31/31  | 14.7 GB | 12.3/1.1  | --    |   1228 |  34s | none             | --                             | 1024/256     |                 |
|  28 t/s | 128 k |   0 | 31/31  | 14.0 GB | 11.8/1.6  | --    |   1615 |  58s | none             | --                             | 1024/256     |                 |
|  32 t/s | 128 k |   2 | 31/31  | 14.3 GB | 12.0/1.4  | --    |   1683 |  53s | none             | --                             | 1024/256     |                 |
|  31 t/s |  64 k |   2 | 31/31  | 13.4 GB | 12.0/1.4  | --    |   1683 |  53s | none             | --                             | 1024/256     |                 |
|  35 t/s |  64 k |   1 | 31/31  | 13.7 GB | 12.3/1.1  | --    |   1228 |  34s | none             | --                             | 1024/256     |                 |




| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | tokens | Time | pred | pred acc | Batch/Ubatch | VRAM/RAM | Note                           |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---- | -------- | ------------ | -------- | ------------------------------ |
| unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf                                                                                                    |
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



| Speed   | Ctx   | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
|  17 t/s |  96 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1404 |  85s | none             | --                             | 512/256      |                 |
|  17 t/s |  96 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1412 |  85s | none             | --                             | 512/256      |                 |
|  17 t/s |  96 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1608 |  97s | none             | --                             | 512/256      |                 |
|  16 t/s |  96 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1623 |  99s | none             | --                             | 512/256      |                 |
|  17 t/s |  96 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1712 | 104s | none             | --                             | 512/256      |                 |
|  17 t/s |  96 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1758 | 107s | none             | --                             | 512/256      |                 |

|  38 t/s | 128 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |    703 |  19s | none             | --                             | 512/256      |                 |
|  37 t/s | 128 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |    861 |  23s | none             | --                             | 512/256      |                 |
|  37 t/s | 128 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1209 |  32s | none             | --                             | 512/256      |                 |
|  38 t/s | 128 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1104 |  29s | none             | --                             | 512/256      |                 |
|  38 t/s | 128 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1349 |  35s | none             | --                             | 1024/512     |                 |

|  38 t/s | 112 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1525 |  40s | none             | --                             | 512/256      |                 |
|   3 t/s | 156 k | 31/31  | 15.7 GB | 14.0/1.8  | --    |   1525 | 530s | none             | --                             | 512/256      |                 |

|  37 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1580 |  42s |    0 |      0 % | 1024/512     | 14.0/1.8 |                                |
|  36 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |    810 |  22s |    0 |      0 % | 1024/512     | 14.0/1.8 |                                |
|  37 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   2010 |  55s |    0 |      0 % | 1024/256     | 14.0/1.8 |                                |
|  37 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1330 |  36s |    0 |      0 % | 384/256      | 14.0/1.8 |                                |
|  37 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1145 |  31s |    0 |      0 % | 384/192      | 14.0/1.8 |                                |
|  37 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1655 |  44s |    0 |      0 % | 256/128      | 14.0/1.8 |                                |
|  33 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1444 |  43s |    0 |      0 % | 512/256      | 14.0/1.8 |                                |
|  33 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1525 |  46s |    0 |      0 % | 1024/512     | 14.0/1.8 |                                |
|  25 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1580 |  63s |    0 |      0 % | 512/256      | 14.0/1.8 | ↓ batch 1024 > 512             |
|  13 t/s | 31/31 |   1 | 128 k | 15.7 GB | q8_0  |   1599 | 123s |    0 |      0 % | 2048/1024    | 14.0/1.8 | ↓ batch 1024 > 2048            |

|  34 t/s | 31/31 |   2 |  96 k | 15.4 GB | q8_0  |   2048 |  60s |    0 |      0 % | 1024/512     | 13.6/2.1 |                                |
|  32 t/s | 31/31 |   3 |  96 k | 15.1 GB | q8_0  |    970 |  30s |    0 |      0 % | 1024/512     | 13.2/2.5 |                                |
|  29 t/s | 31/31 |   4 |  96 k | 14.7 GB | q8_0  |   1133 |  38s |    0 |      0 % | 1024/512     | 12.8/2.9 |                                |
|  25 t/s | 31/31 |   0 |  96 k | 14.0 GB | q8_0  |   1428 |  57s |    0 |      0 % | 1024/512     | 12.1/3.6 |                                |

|  28 t/s | 31/31 |   5 |  64 k | 14.0 GB | q8_0  |    716 |  26s |    0 |      0 % | 1024/512     | 12.5/3.3 |                                |
|  28 t/s | 31/31 |   5 |  96 k | 14.3 GB | q8_0  |   1333 |  48s |    0 |      0 % | 1024/512     | 12.5/3.3 |                                |
|  38 t/s | 31/31 |   1 |  64 k | 15.5 GB | q8_0  |    804 |  21s |    0 |      0 % | 1024/512     | 14.0/1.8 |                                |
|  27 t/s | 31/31 |   0 |  64 k | 14.0 GB | q8_0  |   2048 |  76s |    0 |      0 % | 1024/512     | 12.4/3.3 |                                |

|   4 t/s | 31/31 |   1 | 192 k | 15.7 GB | q8_0  |   1711 | 479s |    0 |      0 % | 1024/512     | 14.0/1.8 |                                |


```bash
cd scripts

#model=unsloth_gemma-4-26B-A4B-it-UD-Q4_K_M.gguf
model=Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf
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
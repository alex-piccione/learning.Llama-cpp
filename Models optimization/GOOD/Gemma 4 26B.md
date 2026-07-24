# Gemma 4 26B A4B

| File                                                              | Result                                        |
| Gemma-4-26B_Q4_0-it_google.gguf                                   | ✔️ Smart and fast - 160k 45 t/s | 256k 35 t/s |  
| Gemma-4-26B-A4B-it-UD-IQ4_NL_unsloth.gguf                         | ✔️ Smart and fast - 160k 35 t/s               |
| Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf                         |
| Gemma4-26B-A4B-QAT-Unc-Balanced-Q4_K_M_hauhaucs.gguf              | ⚠️ WITHOUT MTP: too slow  (MTP not tested)    |
| Gemma-4-26B-REAP126-pruned-UD-IQ4_NL_techhermit.gguf              | ❌ Looping on Pi and lie                      |

Gemopus-4-31B-it-Q3_K_M_jackrong.gguf


## ✔️ Q4_0 (by Google)
Gemma-4-26B_Q4_0-it_google.gguf                                     13.4 GB

## ✔️ UD IQ4_NL (by Unsloth)
https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF
Gemma-4-26B-A4B-it-UD-IQ4_NL_unsloth.gguf                           12.6 GB

## ✔️ MXFP4 MOE (by Noctrex)
Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf                           14.3 GB
https://huggingface.co/noctrex/gemma-4-26B-A4B-it-MXFP4_MOE-GGUF

## ✔️ Q4_K_M (by Unsloth) 
Gemma-4-26B-A4B-it-UD-Q4_K_M_unsloth.gguf                            
https://huggingface.co/unsloth/gemma-4-26B-A4B-it-GGUF


## ❌ REAP126 UD-IQ4_NL (techhermit)
Gemma-4-26B-REAP126-pruned-UD-IQ4_NL_techhermit.gguf                12.3 GB
https://huggingface.co/techhermit/gemma-4-26B-A4B-it-reap126
❌ Looping on Pi and lie



## supergemma fast v2 (by Jiunsong)
supergemma4-26b-uncensored-fast-v2-Q4_K_M_Jiunsong.gguf             15.6 GB


## ⚠️ QAT Uncensored Balanced Q4_K_M (by HauhauCS)
Gemma4-26B-A4B-QAT-Unc-Balanced-Q4_K_M_hauhaucs.gguf                15.6 GB
Gemma4-26B-A4B-QAT-Unc-Balanced-Q4_K_M_hauhaucs.mtp.gguf
https://huggingface.co/HauhauCS/Gemma4-26B-A4B-QAT-Uncensored-HauhauCS-Balanced-MTP
❌  tested WITHOUT MTP: too slow

## ❌ PRISM-PRO-DQ-GGUF (by Ex0bit)
huggingface.co/Ex0bit/Gemma4-26B-A4B-PRISM-PRO-DQ-GGUF
mythos-26b-a4b-prism-pro-dq_ex0bit.gguf                 16.8 GB
❌ Too slow, not reached 5 t/s


## QAT (by Unsloth)
https://huggingface.co/unsloth/gemma-4-26B-A4B-it-qat-GGUF
Gemma-4-26B-A4B-it-qat-UD-Q4_K_XL_unsloth.gguf
Draft_file_1:



## Run tests

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Gemma-4-26B_Q4_0-it_google.gguf
|  43 t/s | 256 k |   2 | 31/31  | 15.7 GB | 12.6/0.8  | --    |   1034 |  24s | none             | --                             | 768/256      |                 |
|  43 t/s | 256 k |   2 | 31/31  | 15.7 GB | 12.6/0.8  | --    |   2048 |  48s | none             | --                             | 768/128      |                 |
|  39 t/s | 256 k |   3 | 31/31  | 15.7 GB | 12.2/1.2  | --    |    892 |  23s | none             | --                             | 768/256      |                 |
|  48 t/s | 160 k |   1 | 31/31  | 15.7 GB | 13.0/0.4  | --    |    708 |  15s | none             | --                             | 768/128      |                 |
|  48 t/s | 160 k |   1 | 31/31  | 15.7 GB | 13.0/0.4  | --    |   1320 |  27s | none             | --                             | 1024/256     |                 |
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
|  31 t/s | 128 k |   3 | 31/31  | 15.6 GB | 13.2/2.5  | --    |   2048 |  66s | none             | --                             | 1024/256     |                 |
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

| supergemma4-26b-uncensored-fast-v2-Q4_K_M_Jiunsong.gguf
|  30 t/s | 128 k |   5 | 31/31  | 15.6 GB | 13.2/2.4  | --    |   1436 |  48s | none             | --                             | 1024/256     |                 |
|  39 t/s |  64 k |   3 | 31/31  | 15.6 GB | 14.1/1.6  | --    |   1470 |  38s | none             | --                             | 1024/256     |                 |

| gemma-4-26b-reap126-pruned-UD-IQ4_NL_techhermit.gguf
|  32 t/s | 256 k |   1 | 31/31  | 15.7 GB | 12.0/1.1  | --    |   1589 |  49s | none             | --                             | 1024/256     |                 |
|  27 t/s | 256 k |   3 | 31/31  | 15.6 GB | 11.3/1.7  | --    |   1891 |  70s | none             | --                             | 1024/256     |                 |
|  24 t/s | 256 k |   4 | 31/31  | 15.3 GB | 11.0/2.1  | --    |   1543 |  64s | none             | --                             | 1024/256     |                 |
|  22 t/s | 256 k |   5 | 31/31  | 14.9 GB | 10.7/2.4  | --    |   1714 |  77s | none             | --                             | 1024/256     |                 |
|  15 t/s | 256 k |   2 | 31/31  | 15.7 GB | 11.7/1.4  | --    |    788 |  52s | none             | --                             | 1024/256     |                 |
|  17 t/s | 256 k |   0 | 31/31  | 14.0 GB | 9.9/3.2   | --    |   1950 | 117s | none             | --                             | 1024/256     |                 |

|  36 t/s | 160 k |   1 | 31/31  | 15.0 GB | 12.0/1.1  | --    |   1112 |  31s | none             | --                             | 1024/512     |                 |
|  36 t/s | 160 k |   1 | 31/31  | 14.8 GB | 12.0/1.1  | --    |   1589 |  45s | none             | --                             | 1024/256     |                 |
|  27 t/s | 160 k |   3 | 31/31  | 14.2 GB | 11.3/1.7  | --    |   1891 |  70s | none             | --                             | 1024/256     |                 |
|  26 t/s | 160 k |   0 | 31/31  | 14.0 GB | 11.3/1.7  | --    |   2048 |  79s | none             | --                             | 1024/256     |                 |
|  22 t/s | 160 k |   5 | 31/31  | 13.5 GB | 10.7/2.4  | --    |   1714 |  79s | none             | --                             | 1024/256     |                 |

|  39 t/s | 128 k |   1 | 31/31  | 14.4 GB | 12.0/1.1  | --    |   1589 |  42s | none             | --                             | 1024/256     |                 |
|  37 t/s | 128 k |   1 | 31/31  | 14.4 GB | 12.0/1.1  | --    |   1589 |  43s | none             | --                             | 1024/256     |                 |
|  32 t/s | 128 k |   2 | 31/31  | 14.0 GB | 11.7/1.4  | --    |    788 |  24s | none             | --                             | 1024/256     |                 |

| Gemma4-26B-A4B-QAT-Unc-Balanced-Q4_K_M_hauhaucs.gguf - NO MTP 
|  34 t/s |  64 k |   3 | 31/31  | 15.6 GB | 14.1/2.1  | --    |    892 |  27s | none             | --                             | 1024/256     |                 |
| Gemma4-26B-A4B-QAT-Unc-Balanced-Q4_K_M_hauhaucs.gguf + mtp: 


```bash
cd scripts

_start_server() {
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
}


## There is currently a bug for Gemma4 MTP
model=Gemma4-26B-A4B-QAT-Unc-Balanced-Q4_K_M_hauhaucs.gguf 
ctx_k=64
cpu_moe=1
gpu_layers=-1
spec=mtp
draft_model=Gemma4-26B-A4B-QAT-Unc-Balanced-Q4_K_M_hauhaucs.mtp.gguf
predict_token=1/2   # (N/M)
mtp=0
jinjia=0
batch=1024
ubatch=256
_start_server


model=Gemma4-26B-A4B-QAT-Unc-Balanced-Q4_K_M_hauhaucs.gguf 
ctx_k=64
cpu_moe=3
gpu_layers=-1
spec=none
draft_model=none
predict_token=1/2   # (N/M)
mtp=0
jinjia=0
batch=1024
ubatch=256
_start_server



model=Gemma-4-26B-A4B-it-MXFP4_MOE_noctrex.gguf
ctx_k=128
cpu_moe=3
gpu_layers=-1
spec=0
draft_model=none
predict_token=0/0   # (N/M)
mtp=0
jinjia=0
batch=1024
ubatch=256


model=Gemma-4-26B_Q4_0-it_google.gguf
ctx_k=256
cpu_moe=3
gpu_layers=-1
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinjia=0
batch=768
ubatch=256
_start_server


model=Gemma-4-26B_Q4_0-it_google.gguf
ctx_k=160
cpu_moe=1
gpu_layers=-1
spec=0
draft_model=none #Gemma-4-26B-A4B-it-Q8_0-MTP_unsloth.gguf
predict_token=1/2
mtp=1
jinjia=0
batch=1024
ubatch=256


model=Gemma-4-26B-REAP126-pruned-UD-IQ4_NL_techhermit.gguf
ctx_k=128
cpu_moe=2
gpu_layers=-1
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinjia=0
batch=768
ubatch=128
_start_server 




model=Gemma-4-26B-A4B-it-UD-IQ4_NL_unsloth.gguf
ctx_k=256
cpu_moe=1
gpu_layers=-1
spec=none
draft_model=none
predict_token=8/8
mtp=0
jinjia=0
batch=1024
ubatch=256
_start_server
|  38 t/s | 256 k |   1 | 31/31  | 15.7 GB | 12.3/1.1  | --    |   1228 |  32s | none             | --                             | 1024/256     |                 |

|  33 t/s | 256 k |   1 | 31/31  | 15.7 GB | 12.3/1.1  | --    |   1494 |  45s | DFlash (N-gram)  | s_M=4 s_N=4 min=1 (45%)        | 1024/256     |                 |
|  38 t/s | 160 k |   1 | 31/31  | 15.2 GB | 12.3/1.1  | --    |   1228 |  32s | none             | --                             | 1024/256     |                 |
|  35 t/s | 160 k |   1 | 31/31  | 15.2 GB | 12.3/1.1  | --    |   1268 |  37s | DFlash (N-gram)  | s_M=6 s_N=6 min=1 (43%)        | 1024/256     |                 |
|  32 t/s | 160 k |   1 | 31/31  | 15.2 GB | 12.3/1.1  | --    |   1494 |  46s | DFlash (N-gram)  | s_M=4 s_N=4 min=1 (45%)        | 1024/256     |                 |
|  30 t/s | 160 k |   1 | 31/31  | 15.2 GB | 12.3/1.1  | --    |   2048 |  68s | DFlash (N-gram)  | s_M=2 s_N=2 min=1 (48%)        | 1024/256     |                 |



model=mythos-26b-a4b-prism-pro-dq_ex0bit.gguf
ctx_k=64
cpu_moe=3
gpu_layers=-1
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinjia=0
batch=1024
ubatch=256


model=supergemma4-26b-uncensored-fast-v2-Q4_K_M_Jiunsong.gguf
ctx_k=256
cpu_moe=3
gpu_layers=-1
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinjia=0
batch=1024
ubatch=256
_start_server

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

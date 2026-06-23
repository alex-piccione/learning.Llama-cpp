# Gemma 4 12B

MTP: No  
Max context: 256 k  
OpenAI tools compatibility: ✔️  

## IQ4_NL  
Huggingface: 
Quantizer: Unsloth
File: Gemma-4-12b-it-IQ4_NL_unsloth.gguf
Draft file: Gemma-4-12B-it-MTP_unsloth.gguf


** unsloth_gemma-4-12b-it-UD-Q5_K_XL.gguf **


** unsloth_gemma-4-12B-it-qat-UD-Q4_K_XL.gguf **
- File: unsloth_gemma-4-12B-it-qat-UD-Q4_K_XL.gguf 
- Quantized by: Unsloth
- MTP: Yes ??

## ❌ Gemma4-12B-v2-Q4_K_M_yuxinlu1.gguf
Huggingface: https://huggingface.co/yuxinlu1/gemma-4-12B-agentic-fable5-composer2.5-v2-3.5x-tau2-GGUF
Quantizer: yuxinlu1
File: Gemma-4-12B-v2-Q4_K_M_yuxinlu1.gguf

❌ Hallucinate
❌ Act without plan
❌ Loop very often despite any kind of parameter to prevent it
❌ Falsy think it get user appoval despite there wasn't
❌ Fail to edit files (simple basic skill of Pi)
❌ Not fast


## 26.6.22
| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Gemma-4-12b-it-IQ4_NL_unsloth.gguf
|  41 t/s | 256 k |   0 | 49/49  |  9.4 GB | 6.2/0.1   | --    |    995 |  25s | DFlash (N-gram)  | s_M=10 s_N=4 min=1 (45%)       | 1024/256     |                 |
|  41 t/s | 256 k |   0 | 49/49  |  9.4 GB | 6.2/0.1   | --    |   1181 |  29s | DFlash (N-gram)  | s_M=14 s_N=6 min=1 (46%)       | 1024/256     |                 |
|  40 t/s | 256 k |   0 | 49/49  |  9.4 GB | 6.2/0.1   | --    |    771 |  19s | DFlash (N-gram)  | s_M=15 s_N=5 min=1 (38%)       | 512/256      |                 |
|  39 t/s | 256 k |   0 | 49/49  |  9.4 GB | 6.2/0.1   | --    |    771 |  19s | DFlash (N-gram)  | s_M=15 s_N=5 min=1 (38%)       | 1024/256     |                 |
|  38 t/s | 256 k |   0 | 49/49  |  9.4 GB | 6.2/0.1   | --    |    752 |  20s | DFlash (N-gram)  | s_M=10 s_N=3 min=1 (30%)       | 1024/256     |                 |
|  29 t/s | 256 k |   0 | 49/49  |  9.4 GB | 6.2/0.1   | --    |   1731 |  59s | DFlash (N-gram)  | s_M=5 s_N=10 min=1             | 1024/256     |                 |
|  38 t/s | 128 k |   0 | 49/49  |  8.0 GB | 6.2/0.1   | --    |    771 |  20s | DFlash (N-gram)  | s_M=10 s_N=5 min=1 (48%)       | 512/256      |                 |

| Gemma-4-12b-it-UD-Q5_K_XL_unsloth.gguf
|  36 t/s | 256 k |   0 | 49/49  | 11.1 GB | 8.0/0.1   | --    |    873 |  24s | DFlash (N-gram)  | s_M=10 s_N=4 min=1 (45%)       | 1024/256     |                 |
|  33 t/s | 256 k |   0 | 49/49  | 11.1 GB | 8.0/0.1   | --    |    779 |  24s | DFlash (N-gram)  | s_M=8 s_N=3 min=1 (34%)        | 1024/256     |                 |
|  31 t/s | 256 k |   0 | 49/49  | 11.1 GB | 8.0/0.1   | --    |    790 |  26s | DFlash (N-gram)  | s_M=12 s_N=5 min=1 (36%)       | 1024/256     |                 |

| Gemma-4-12B-v2-Q4_K_M_yuxinlu1.gguf
|  39 t/s | 256 k |   0 | 49/49  | 10.0 GB | 6.9/0.1   | --    |    598 |  15s | DFlash (N-gram)  | s_M=12 s_N=3 min=1 (29%)       | 1024/256     |                 |
|  38 t/s | 256 k |   0 | 49/49  | 10.0 GB | 6.9/0.1   | --    |    606 |  16s | DFlash (N-gram)  | s_M=10 s_N=4 min=1 (40%)       | 1024/256     |                 |
|  37 t/s | 256 k |   0 | 49/49  | 10.0 GB | 6.9/0.1   | --    |    532 |  14s | DFlash (N-gram)  | s_M=12 s_N=4 min=1 (34%)       | 1024/256     |                 |
|  37 t/s | 256 k |   0 | 49/49  | 10.2 GB | 6.9/0.3   | --    |    495 |  13s | DFlash (N-gram)  | s_M=24 s_N=4 min=1 (20%)       | 2048/512     |                 |
|  35 t/s | 256 k |   0 | 49/49  | 10.0 GB | 6.9/0.1   | --    |    530 |  15s | DFlash (N-gram)  | s_M=12 s_N=5 min=1 (35%)       | 1024/256     |                 |
|  33 t/s | 256 k |   0 | 49/49  | 10.0 GB | 6.9/0.1   | --    |    529 |  16s | DFlash (N-gram)  | s_M=24 s_N=6 min=1 (19%)       | 1024/256     |                 |
|  33 t/s | 256 k |   0 | 49/49  | 10.2 GB | 6.9/0.3   | --    |    500 |  15s | DFlash (N-gram)  | s_M=24 s_N=6 min=1 (20%)       | 2048/512     |                 |


## 26.6.1
| Speed   | Ctx   | GPU   | MoE | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | ----- | --- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
| unsloth_gemma-4-12b-it-IQ4_NL.gguf
|  52 t/s | 256 k | 49/49 |  -- |  9.1 GB | --    |   1244 |  24s | DFlash (N-gram)  | size_M=10 size_N=4 min_hits=1  | 1024/256     | 6.2/0.3   |                 |
|  52 t/s | 128 k | 49/49 |  -- |  7.9 GB | --    |   1239 |  24s | DFlash (N-gram)  | size_M=10 size_N=4 min_hits=1  | 1024/256     | 6.2/0.1   |                 |

|  51 t/s |  32 k | 49/49 |  -- |  7.4 GB | --    |   1675 |  33s | DFlash (N-gram)  | size_M=10 size_N=4 min_hits=1  | 1024/512     | 6.2/0.1   |                 |
|  50 t/s |  32 k | 49/49 |  -- |  7.4 GB | --    |   1244 |  25s | DFlash (N-gram)  | size_M=9 size_N=4 min_hits=1   | 1024/512     | 6.2/0.1   |                 |
|  49 t/s |  32 k | 49/49 |  -- |  7.4 GB | --    |   1281 |  26s | DFlash (N-gram)  | size_M=10 size_N=5 min_hits=1  | 1024/512     | 6.2/0.1   |                 |
|  47 t/s |  32 k | 49/49 |  -- |  7.4 GB | --    |   1265 |  27s | DFlash (N-gram)  | size_M=8 size_N=4 min_hits=1   | 1024/512     | 6.2/0.1   |                 |
|  47 t/s |  32 k | 49/49 |  -- |  7.4 GB | --    |   1260 |  27s | DFlash (N-gram)  | size_M=10 size_N=5 min_hits=1  | 1024/512     | 6.2/0.1   |                 |
|  40 t/s |  32 k | 49/49 |  -- |  7.4 GB | --    |    938 |  24s | DFlash (N-gram)  | size_M=12 size_N=5 min_hits=1  | 1024/512     | 6.2/0.1   |                 |
|  30 t/s |  32 k | 49/49 |  -- |  7.4 GB | --    |    881 |  29s | none             | --                             | 1024/512     | 6.2/0.1   |                 |

| unsloth_gemma-4-12b-it-UD-Q5_K_XL.gguf
|  34 t/s | 256 k | 49/49 |  -- | 10.9 GB | --    |    754 |  22s | DFlash (N-gram)  | size_M=10 size_N=4 min_hits=1  | 1536/256     | 8.0/0.3   |                 |
|  31 t/s | 256 k | 49/49 |  -- | 10.9 GB | --    |    894 |  29s | DFlash (N-gram)  | size_M=10 size_N=5 min_hits=1  | 1536/256     | 8.0/0.3   |                 |
|  24 t/s |  32 k | 49/49 |  -- |  9.2 GB | --    |    638 |  26s | none             | --                             | 1024/512     | 8.0/0.1   |                 |



## Run tests

```bash
cd scripts


#model=Gemma4-12B-v2-Q4_K_M_yuxinlu1.gguf
#ctx_k=16
#gpu_layers=-1
#cpu_moe=0
#spec=1
#draft_model=unsloth_mtp-gemma-4-12B-it.gguf
#predict_token=5/10
#mtp=0
#jinjia=0
#batch=512
#ubatch=512

#model=Gemma-4-12b-it-IQ4_NL_unsloth.gguf
#model=Gemma-4-12b-it-UD-Q5_K_XL_unsloth.gguf
model=Gemma-4-12B-v2-Q4_K_M_yuxinlu1.gguf
#model=unsloth_gemma-4-12B-it-qat-UD-Q4_K_XL.gguf
ctx_k=256
gpu_layers=-1
cpu_moe=0
spec=1
draft_model=none
#draft_model=Gemma-4-12B-it-MTP_unsloth.gguf
predict_token=4/10
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
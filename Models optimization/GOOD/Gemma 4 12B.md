# Gemma 4 12B

** IQ$_NL **  
- File: unsloth_gemma-4-12b-it-IQ4_NL.gguf
- Quantized by: Unsloth
- MTP: No
Max context                   : 256 k
OpenAI tools compatibility    : ✔️


** unsloth_gemma-4-12b-it-UD-Q5_K_XL.gguf **


** unsloth_gemma-4-12B-it-qat-UD-Q4_K_XL.gguf **
- File: unsloth_gemma-4-12B-it-qat-UD-Q4_K_XL.gguf 
- Quantized by: Unsloth
- MTP: Yes


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


| unsloth_gemma-4-12B-it-qat-UD-Q4_K_XL.gguf 


## Run tests

```bash
cd scripts

model=unsloth_gemma-4-12b-it-IQ4_NL.gguf
#model=unsloth_gemma-4-12b-it-UD-Q5_K_XL.gguf
#model=unsloth_gemma-4-12B-it-qat-UD-Q4_K_XL.gguf
ctx_k=16
gpu_layers=-1
cpu_moe=0
spec=1
draft_model=unsloth_mtp-gemma-4-12B-it.gguf
predict_token=1/2
mtp=0
jinjia=0
batch=512
ubatch=512

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

source test_models_common.sh && test_call_result_row

```
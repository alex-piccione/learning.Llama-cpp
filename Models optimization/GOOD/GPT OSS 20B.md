# GPT OSS 20B

Model: GPT OSS 20B
Quantized by: Unsloth
File 1: unsloth_gpt-oss-20b-Q4_K_M.gguf
File 2: unsloth_gpt-oss-20b-UD-Q6_K_XL.gguf
File 3: unsloth_gpt-oss-20b-Q8_0.gguf
File 4: unsloth_gpt-oss-20b-UD-Q8_K_XL.gguf
File 5: davidau_OpenAI-20B-NEO-CODE2-Plus-Uncensored-IQ4_NL.gguf
Moe: ?
MTP: No
Max context: 128 k
OpenAI tools compatibility: ✔️

| File                                                    | Result                                                  |
|---------------------------------------------------------|---------------------------------------------------------|
| GPT-OSS-20b-UD-Q8_K_XL_unsloth.gguf                     | ❌ Super fast but not adapt for coding                  |


# (1) UD-Q6_K_XL (by Unsloth)
file: GPT-OSS-20b-UD-Q6_K_XL_unsloth.gguf


# ❌ UD-Q8_K_XL (by Unsloth)
GPT-OSS-20b-UD-Q8_K_XL_unsloth.gguf 

❌ Does not follow the rule and check PR comments, neither when specifically asked to fo it.


| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| GPT-OSS-20b-UD-Q8_K_XL_unsloth.gguf
|  60 t/s | 128 k |   0 | 25/25  | 13.5 GB | 11.2/1.1  | --    |    656 |  11s | none             | --                             | 2048/1024    |                 |
|  60 t/s | 128 k |   0 | 25/25  | 13.4 GB | 11.2/1.1  | --    |   1300 |  22s | none             | --                             | 2048/512     |                 |
|  60 t/s | 128 k |   0 | 25/25  | 13.3 GB | 11.2/1.1  | --    |    850 |  14s | none             | --                             | 2048/384     |                 |

| GPT-OSS-20b-UD-Q6_K_XL_unsloth.gguf
|  71 t/s | 128 k |   0 | 25/25  | 12.8 GB | 10.6/0.6  | --    |    895 |  12s | none             | --                             | 2048/384     |                 |
|  70 t/s | 128 k |   0 | 25/25  | 12.7 GB | 10.6/0.6  | --    |    601 |   9s | none             | --                             | 2048/256     |                 |
|  69 t/s | 128 k |   0 | 25/25  | 12.7 GB | 10.6/0.6  | --    |    601 |   8s | none             | --                             | 1024/256     |                 |
|  51 t/s | 128 k |   1 | 25/25  | 12.3 GB | 10.2/1.0  | --    |   1568 |  31s | none             | --                             | 1024/256     |                 |


| Speed   | GPU   | MoE | Ctx   | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | --- | ----- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
|  73 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |   1345 |  18s | DFlash (N-gram)  | size_n=12 size_m=16 min_hits=1 | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  72 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |    738 |  10s | DFlash (N-gram)  | size_n=20 size_m=16 min_hits=1 | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  72 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |    734 |  10s | DFlash (N-gram)  | size_n=16 size_m=14 min_hits=1 | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  72 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |    691 |   9s | DFlash (N-gram)  | size_n=10 size_m=7 min_hits=1  | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  72 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |    950 |  14s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  71 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |   1042 |  14s | DFlash (N-gram)  | size_n=12 size_m=12 min_hits=1 | 512/256      | 10.6/0.6  | UD-Q6_K_XL      |
|  71 t/s | 25/25 |   0 | 128 k | 12.8 GB | ---   |    708 |  10s | DFlash (N-gram)  | size_n=10 size_m=5 min_hits=1  | 2048/384     | 10.7/0.6  | Q8_0            |
|  70 t/s | 25/25 |   0 | 128 k | 12.6 GB | ---   |    685 |   9s | DFlash (N-gram)  | size_n=16 size_m=12 min_hits=1 | 2048/256     | 10.6/0.6  | UD-Q6_K_XL      |
|  70 t/s | 25/25 |   0 | 128 k | 12.7 GB | ---   |    811 |  11s | DFlash (N-gram)  | size_n=10 size_m=8 min_hits=1  | 2048/256     | 10.7/0.6  | Q8_0            |
|  70 t/s | 25/25 |   0 | 128 k | 12.7 GB | ---   |    714 |  11s | DFlash (N-gram)  | size_n=10 size_m=6 min_hits=1  | 2048/256     | 10.7/0.6  | Q8_0            |
|  70 t/s | 25/25 |   0 | 128 k | 12.9 GB | ---   |    727 |  10s | DFlash (N-gram)  | size_n=10 size_m=4 min_hits=1  | 1024/512     | 10.7/0.6  | Q8_0            |
|  70 t/s | 25/25 |   0 | 128 k | 12.8 GB | ---   |    678 |  10s | DFlash (N-gram)  | size_n=10 size_m=4 min_hits=1  | 1024/384     | 10.7/0.6  | Q8_0            |
|  68 t/s | 25/25 |   0 | 128 k | 12.9 GB | ---   |    714 |  10s | DFlash (N-gram)  | size_n=10 size_m=4 min_hits=1  | 2048/512     | 10.7/0.6  | Q8_0            |


| Speed   | Ctx   | GPU   | MoE | VRAM    | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | VRAM/RAM  | Note            |
| ------- | ----- | ----- | --- | ------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ | --------- | --------------- |
| unsloth_gpt-oss-20b-UD-Q8_K_XL.gguf
|  67 t/s | 128 k | 25/25 |  -- | 13.2 GB | --    |    782 |  12s | DFlash (N-gram)  | size_M=8 size_N=5 min_hits=1   | 1024/256     | 11.2/1.1  |                 |
|  64 t/s | 128 k | 25/25 |  -- | 13.2 GB | --    |    647 |  10s | DFlash (N-gram)  | size_M=15 size_N=10 min_hits=1 | 1024/256     | 11.2/1.1  |                 |
|  64 t/s | 128 k | 25/25 |  -- | 13.2 GB | --    |   1202 |  19s | DFlash (N-gram)  | size_M=15 size_N=10 min_hits=1 | 1024/256     | 11.2/1.1  |                 |
|  62 t/s | 128 k | 25/25 |  -- | 13.2 GB | --    |   1162 |  18s | none             | --                             | 1024/256     | 11.2/1.1  |                 |
|  62 t/s | 128 k | 25/25 |  -- | 13.2 GB | --    |   1184 |  19s | DFlash (N-gram)  | size_M=6 size_N=4 min_hits=1   | 1024/256     | 11.2/1.1  |                 |


## Run tests

```bash
cd scripts

model=GPT-OSS-20b-UD-Q6_K_XL_unsloth.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=0
spec=0
draft_model=none
predict_token=3/6
jinja=0
batch=2048
ubatch=384


model=GPT-OSS-20b-UD-Q8_K_XL_unsloth.gguf
ctx_k=256
gpu_layers=99
cpu_moe=2
spec=0
draft_model=none
predict_token=0/0
jinja=0
batch=2048
ubatch=1024
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  59 t/s | 256 k |   0 | 25/25 | 15.6 | 11.2/0.5  | q8_0  |   1282 |  21s | none                          -- | 2048/1024 |            |
|  61 t/s | 128 k |   0 | 25/25 | 13.5 | 11.2/0.3  | q8_0  |   1282 |  21s | none                          -- | 2048/1024 |            |
|  33 t/s | 128 k |   3 | 25/25 | 12.6 | 10.0/0.3  | q8_0  |    914 |  27s | none                          -- | 2048/1024 |            |


_test_model() {
source server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $spec \
    $draft_model \
    $predict_token \
    $jinja \
    $batch \
    $ubatch
    
source test_models_common.sh && print_test_call
}

```
# Qwen 3.8 27B

| File                                                       | Result                                      |
|------------------------------------------------------------|---------------------------------------------|
| Qwen3.8-27B-Uncensored-Aggressive-IQ3_M_HauhauCS.gguf      | ✔️ 128k: 25-40 t/s. Good                    |
| Qwen3.8-27B-UD-Q3_K_XL_unsloth.gguf                        | ✔️ 80k: 20-45 t/s Super smart.              |
| Qwen3.8-27B-Abliterated-IQ4-MIX-MTP_finex666.gguf          | ✔️ 64k: 25-45 t/s                           |
| Qwen3.8-27B-UD-IQ4_XS_unsloth.gguf                         | ✔️ 64k: 20-40 t/s  80k: 20-30 t/s           |
| Qwen3.8-27B-Cold-Fusion-GAIN-V1.1-MTP-IQ3_M_davidau.gguf   | ✔️ 64k: 15-30 t/s Short reasoning           |
| Qwen3.8-27B-abliterated-UD-IQ4_XS_huihui.gguf              | Not tested in Pi                            |
| Qwen3.8-27B-UD-IQ4_XS_peculiar.gguf                        | Not tested in Pi                            |
| RVN-Q3_K_M-mtp_observerx.gguf                              | ❌ Slow. It seems to manage only 64k ?!     |
| RVN-IQ3_M-mtp_Observerx.gguf                               | ❌ Tool call failed on first attempt        |
| RVN-Q3_K_L_observerx.gguf                                  | ❌ Slow. No MTP.                            |
| Qwen3.8-27B-heretic-ara.i1-IQ4_XS_mradermacher.gguf        | ❌ Slow. Max 32K.                           |
| Qwen3.8-27B-IQ4_XS_unsloth.gguf                            | ❌ Too slow. Unusable                       | 
| Qwen3.8-27B-YMQ-M_zerodigest.gguf                          | ❌ Rubbish                                  |
| Qwen3.8-27B.i1-IQ4_KT-attn_qkv-IQ4_KS-MTP_chunter789.gguf  | ❌ attn_qkv- does not work                  |
| Qwen3.8-27B-UD-Q5_K_S_unsloth.gguf                         |


To test:
https://huggingface.co/JonathanColetti/Qwen3.8-27B-Uncensored-GGUF

## ? UD-IQ4_XS (huihui)
Qwen3.8-27B-abliterated-UD-IQ4_XS_huihui.gguf                       13.4 GB
https://huggingface.co/huihui-ai/Huihui-Qwen3.8-27B-abliterated-GGUF      
Not tested in Pi

## ? UD-IQ4_XS (peculiar-ragdoll)
Qwen3.8-27B-UD-IQ4_XS_peculiar.gguf                 13.2 GB
https://huggingface.co/peculiar-ragdoll/Dirk-Qwen3.8-27B-GGUF
Not tested in Pi

## Q3_K_S (Unsloth)
Qwen3.8-27B-Q3_K_S_unsloth.gguf                          11.7 GB

## ✔️ IQ3_M (DavidAU)
Qwen3.8-27B-Cold-Fusion-GAIN-V1.1-MTP-IQ3_M_davidau.gguf              13.5 GB
https://huggingface.co/DavidAU/Qwen3.8-27B-Cold-Fusion-GAIN-V1.1-NM-DAU-NEO-MAX-MTP-GGUF

## ✔️ UD IQ4_XS (Unsloth)
Qwen3.8-27B-UD-IQ4_XS_unsloth.gguf                                  13.2 GB (14.3 GB)
3/4 give better speed in real coding tests in Pi, compared to 5/6.  
With 80K, and 2/4, after 20k context the speed drops at 7-8 t/s, it seems to remain stable at 30 t/s with 2/3 . 
1024/256 Batch settings makes profiling load almost instantaneous.

## ✔️ IQ4-MIX-MTP (finx666)
Qwen3.8-27B-Abliterated-IQ4-MIX-MTP_finex666.gguf                   13.2 GB


## ✔️ UD Q3_K_XL (Unsloth)
Qwen3.8-27B-UD-Q3_K_XL_unsloth.gguf                                  12.2 GB


## ✔️ Q3_K_M (Observerx)
RVN-Q3_K_M-mtp_observerx.gguf                                      12.8 GB


## ❌ UD Q5_K_S (Unsloth)
Qwen3.8-27B-UD-Q5_K_S_unsloth.gguf
0.1 t/s

## ❌ IQ3_M (Observerx)
RVN-IQ3_M-mtp_Observerx.gguf
OpenAI tools compatibility    : ❌

## ❌ IQ3_M  (HauhauCS)
Qwen3.8-27B-Uncensored-Aggressive-IQ3_M_HauhauCS.gguf                11.9 GB 
https://huggingface.co/HauhauCS/Qwen3.8-27B-Uncensored-HauhauCS-Aggressive-MTP-GGUF
❌ Got stuck in its own reasoning


## ❌ IQ4_KS (mradermacher)
Qwen3.8-27B-heretic-ara.i1-IQ4_XS_mradermacher.gguf                   14.2 GB
https://huggingface.co/mradermacher/Qwen3.8-27B-heretic-ara-i1-GGUF
Max 32 K

## ❌ Heretic Obliterated no-MTP (Observerx)
RVN-Q3_K_L_observerx.gguf                                   13.3 GB
https://huggingface.co/0bserverx/Qwen3.8-27B-Heretic-Abliterated-Uncensored-GGUF
MTP: NO   Max 64k, max 16 t/s

## ❌ YMQ-M (zerodigest)
Qwen3.8-27B-YMQ-M_zerodigest.gguf
https://huggingface.co/zerodigest/Qwen3.8-27B-YMQ-MTP-GGUF
20 t/s. Not pass simple test (more than 2000 tokens)

## ❌ IQ4_XS (Unsloth)
Qwen3.8-27B-IQ4_XS_unsloth.gguf                         14.60 GB
16 t/s


```bash

model=Qwen3.8-27B-UD-IQ4_XS_peculiar.gguf
ctx_k=64
gpu_layers=99
cpu_moe=0
quant=q5_0/q4_0
spec=draft-mtp
draft_model=none
predict_token=3/4
jinja=0
batch=1024
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  44 t/s |  64 k |   0 | 66/66 | 15.5 | 12.8/0.0  | q4_0 (q4_0) |    510 |  11s | MTP        min=3 max=4 p_min=0.20 (94%) |  1024/256 | R: medium         |
|  43 t/s |  64 k |   0 | 66/66 | 15.7 | 12.8/0.1  | q4_0 (q4_0) |    485 |  11s | MTP        min=5 max=5 p_min=0.20 (92%) |  1024/512 | R: medium         |
|  43 t/s |  64 k |   0 | 66/66 | 15.7 | 12.8/0.1  | q4_0 (q4_0) |    485 |  11s | MTP        min=4 max=5 p_min=0.20 (92%) |  1024/512 | R: medium         |
|  43 t/s |  64 k |   0 | 66/66 | 15.7 | 12.8/0.1  | q4_0 (q4_0) |    485 |  11s | MTP        min=4 max=4 p_min=0.20 (94%) |  1024/512 | R: medium         |
|  38 t/s |  64 k |   0 | 66/66 | 15.7 | 12.8/0.1  | q4_0 (q4_0) |    498 |  13s | MTP        min=4 max=6 p_min=0.20 (87%) |  1024/512 | R: medium         |
|  38 t/s |  64 k |   0 | 66/66 | 15.7 | 12.8/0.1  | q4_0 (q4_0) |    485 |  13s | MTP        min=3 max=5 p_min=0.20 (92%) |  1024/512 | R: medium         |
|  38 t/s |  64 k |   0 | 66/66 | 15.5 | 12.8/0.1  | q4_0 (q4_0) |    558 |  14s | MTP        min=2 max=3 p_min=0.20 (88%) |  1024/512 | R: medium         |
|  15 t/s |  64 k |   0 | 66/66 | 15.7 | 12.8/0.0  | q8_0 (q4_0) |    503 |  35s | MTP        min=1 max=2 p_min=0.20 (96%) |  1024/256 |                   |
|   8 t/s |  64 k |   0 | 66/66 | 15.7 | 12.8/0.0  | q8_0 (q4_0) |    486 |  58s | MTP        min=2 max=3 p_min=0.20 (94%) |  1024/256 |                   |


model=Qwen3.8-27B-abliterated-UD-IQ4_XS_huihui.gguf
ctx_k=64
gpu_layers=99
cpu_moe=0
spec=draft-mtp
draft_model=none
predict_token=1/2
jinja=0
batch=1024
ubatch=512
#extra=""
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  38 t/s |  64 k |   0 | 66/66 | 15.7 | 12.9/0.1  | q4_0 (q4_0) |    585 |  15s | MTP        min=2 max=3 p_min=0.20 (94%) |  1024/512 | R: medium         |
|  34 t/s |  64 k |   0 | 66/66 | 15.7 | 12.9/0.1  | q4_0 (q4_0) |    604 |  17s | MTP        min=3 max=4 p_min=0.20 (88%) |  1024/512 | R: medium         |
|  33 t/s |  64 k |   0 | 66/66 | 15.5 | 12.9/0.1  | q4_0 (q4_0) |    587 |  18s | MTP        min=1 max=2 p_min=0.20 (96%) |  1024/512 | R: medium         |


model=Qwen3.8-27B-Q3_K_S_unsloth.gguf
ctx_k=128
gpu_layers=99
cpu_moe=0
spec=draft-mtp
draft_model=none
predict_token=41/2
jinja=0
batch=1024
ubatch=256
#extra=""
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  38 t/s | 128 k |   0 | 66/66 | 15.7 | 11.2/0.1  | q4_0 (q4_0) |    579 |  15s | MTP        min=3 max=4 p_min=0.20 (89%) |  1024/256 | R: medium         |
|  39 t/s |  96 k |   0 | 66/66 | 14.9 | 11.2/0.1  | q4_0 (q4_0) |    579 |  15s | MTP        min=3 max=4 p_min=0.20 (89%) |  1024/256 | R: medium         |
|  39 t/s |  32 k |   0 | 66/66 | 13.1 | 11.2/0.0  | q4_0 (q4_0) |    579 |  15s | MTP        min=3 max=4 p_min=0.20 (89%) |  1024/256 | R: medium         |
|  34 t/s | 128 k |   0 | 66/66 | 15.6 | 11.2/0.1  | q4_0 (q4_0) |    579 |  17s | MTP        min=2 max=3 p_min=0.20 (93%) |  1024/256 | R: medium         |
|  19 t/s | 128 k |   0 | 66/66 | 15.7 | 11.2/0.1  | q4_0 (q4_0) |    579 |  30s | MTP        min=4 max=5 p_min=0.20 (84%) |  1024/256 | R: medium         |


model=Qwen3.8-27B-Abliterated-IQ4-MIX-MTP_finex666.gguf
ctx_k=64
gpu_layers=99
cpu_moe=0
spec=draft-mtp
draft_model=none
predict_token=3/4
jinja=0
batch=1024
ubatch=512
#extra=""
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  44 t/s |  64 k |   0 | 66/66 | 15.7 | 12.9/0.1  | q4_0 (q4_0) |    559 |  13s | MTP        min=3 max=4 p_min=0.20 (92%) |  1024/512 | R: medium         |
|  38 t/s |  64 k |   0 | 66/66 | 15.7 | 12.9/0.1  | q4_0 (q4_0) |    559 |  15s | MTP        min=3 max=5 p_min=0.20 (86%) |  1024/512 | R: medium         |
|  21 t/s |  80 k |   0 | 66/66 | 15.7 | 12.9/0.1  | q4_0 (q4_0) |    559 |  27s | MTP        min=3 max=4 p_min=0.20 (92%) |  1024/512 | R: medium         |
|  19 t/s |  80 k |   0 | 66/66 | 15.7 | 12.9/0.1  | q4_0 (q4_0) |    559 |  29s | MTP        min=4 max=5 p_min=0.20 (86%) |  1024/512 | R: medium         |


model=Qwen3.8-27B-Cold-Fusion-GAIN-V1.1-NM-DAU-NEO-MAX-NEO-MTP-IQ3_M_davidau.gguf
ctx_k=64
gpu_layers=99
cpu_moe=0
spec=draft-mtp
draft_model=none
predict_token=3/4
jinja=0
batch=1024
ubatch=512
#extra=""
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |----------- |
|  26 t/s |  64 k |   0 | 66/66 | 15.7 | 13.0/0.1  | q4_0 (q4_0) |    575 |  22s | MTP        min=3 max=4 p_min=0.20 (86%) |  1024/512 | R: medium  |
|  20 t/s |  64 k |   0 | 66/66 | 15.7 | 13.0/0.1  | q4_0 (q4_0) |    575 |  28s | MTP        min=4 max=5 p_min=0.20 (80%) |  1024/512 | R: medium  |


model=Qwen3.8-27B-heretic-ara.i1-IQ4_XS_mradermacher.gguf
ctx_k=48
gpu_layers=99
cpu_moe=0
spec=draft-mtp
draft_model=none
predict_token=4/5
jinja=0
batch=1024
ubatch=512
#extra=""
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |----------- |
|  45 t/s |  32 k |   0 | 66/66 | 15.7 | 13.6/0.1  | q4_0 (q4_0) |    541 |  12s | MTP        min=4 max=5 p_min=0.20 (88%) |  1024/512 | R: medium  |
|  16 t/s |  64 k |   0 | 66/66 | 15.3 | 13.4/0.1  | q4_0 (none) |    533 |  33s | none                                 -- |  1024/512 |            |


model=Qwen3.8-27B-Uncensored-Aggressive-IQ3_M_HauhauCS.gguf
ctx_k=128
gpu_layers=99
cpu_moe=0
spec=draft-mtp
draft_model=none
predict_token=3/4
jinja=0
batch=1024
ubatch=256
#extra=""
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |----------- |
|  41 t/s | 128 k |   0 | 66/66 | 15.7 | 11.4/0.1  | q4_0 (q4_0) |    544 |  14s | MTP        min=3 max=4 p_min=0.20 (90%) |  1024/256 | R: medium  |
|  41 t/s | 128 k |   0 | 66/66 | 15.7 | 11.4/0.1  | q4_0 (q4_0) |    544 |  13s | MTP        min=5 max=6 p_min=0.20 (82%) |  1024/256 | R: medium  |
|  24 t/s | 128 k |   0 | 66/66 | 15.7 | 11.4/0.1  | q4_0 (q4_0) |    540 |  23s | MTP        min=5 max=6 p_min=0.20 (82%) |  1024/512 | R: medium  |
|  21 t/s | 128 k |   0 | 66/66 | 15.7 | 11.4/0.1  | q4_0 (q4_0) |    542 |  26s | MTP        min=6 max=7 p_min=0.20 (78%) |  1024/256 | R: medium  |
|
|  43 t/s |  96 k |   0 | 66/66 | 15.5 | 11.4/0.1  | q4_0 (q4_0) |    540 |  12s | MTP        min=5 max=6 p_min=0.20 (82%) |  1024/512 | R:medium   |
|  43 t/s |  96 k |   0 | 66/66 | 15.2 | 11.4/0.1  | q4_0 (q4_0) |    563 |  14s | MTP        min=3 max=4 p_min=0.20 (88%) |  1024/512 | R:medium   |
|  42 t/s |  96 k |   0 | 66/66 | 15.4 | 11.4/0.1  | q4_0 (q4_0) |    563 |  13s | MTP        min=4 max=5 p_min=0.20 (82%) |  1024/512 |            |
|  35 t/s |  96 k |   0 | 66/66 | 15.7 | 11.4/0.1  | q4_0 (q4_0) |    567 |  16s | MTP        min=6 max=8 p_min=0.20 (70%) |  1024/512 | R:medium   |


model=Qwen3.8-27B-UD-Q3_K_XL_unsloth.gguf
ctx_k=80
gpu_layers=99
cpu_moe=0
quant=q4_0/q4_0
spec=draft-mtp
draft_model=none
predict_token=4/5
jinja=0
batch=1024
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  47 t/s |  80 k |   0 | 66/66 | 15.4 | 11.7/0.1  | q4_0 (q4_0) |    559 |  12s | MTP        min=5 max=6 p_min=0.20 (86%) |  1024/512 | R: medium         |
|  46 t/s |  80 k |   0 | 66/66 | 15.4 | 11.7/0.1  | q4_0 (q4_0) |    559 |  12s | MTP        min=6 max=6 p_min=0.20 (86%) |  1024/512 | R: medium         |
|  46 t/s |  80 k |   0 | 66/66 | 15.7 | 11.7/0.1  | q4_0 (q4_0) |    586 |  12s | MTP        min=6 max=8 p_min=0.20 (78%) |  1024/512 | R: medium         |
|  43 t/s |  80 k |   0 | 66/66 | 15.2 | 11.7/0.1  | q4_0 (q4_0) |    567 |  14s | MTP        min=4 max=5 p_min=0.20 (82%) |  1024/512 | R: medium         |
|  43 t/s |  80 k |   0 | 66/66 | 15.1 | 11.7/0.1  | q4_0 (q4_0) |    567 |  13s | MTP        min=3 max=4 p_min=0.20 (89%) |  1024/512 | R: medium         |
|  40 t/s |  80 k |   0 | 66/66 | 14.9 | 11.7/0.1  | q4_0 (q4_0) |    530 |  13s | MTP        min=2 max=3 p_min=0.20 (95%) |  1024/512 | R: medium         |
|  18 t/s |  80 k |   0 | 66/66 | 15.7 | 11.7/0.1  | q8_0 (q4_0) |    535 |  29s | MTP        min=3 max=4 p_min=0.20 (90%) |  1024/512 | R: medium         |

|  46 t/s |  64 k |   0 | 66/66 | 14.9 | 11.7/0.1  | q4_0 (q4_0) |    559 |  12s | MTP        min=6 max=6 p_min=0.20 (86%) |  1024/512 | R: medium         |
|  46 t/s |  64 k |   0 | 66/66 | 14.9 | 11.7/0.1  | q4_0 (q4_0) |    559 |  12s | MTP        min=4 max=6 p_min=0.20 (86%) |  1024/512 | R: medium         |
|  43 t/s |  64 k |   0 | 66/66 | 14.8 | 11.7/0.1  | q4_0 (q4_0) |    567 |  13s | MTP        min=3 max=5 p_min=0.20 (82%) |  1024/512 | R: medium         |
|  21 t/s |  64 k |   0 | 66/66 | 15.7 | 11.7/0.1  | q8_0 (q4_0) |    535 |  26s | MTP        min=6 max=8 p_min=0.20 (82%) |  1024/512 | R: medium         |



model=RVN-Q3_K_M-mtp_observerx.gguf
ctx_k=96
gpu_layers=99
cpu_moe=0
spec=draft-mtp
draft_model=none
predict_token=3/4
jinja=0
batch=1024
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |----------- |
|  20 t/s |  96 k |   0 | 66/66 | 15.7 | 12.3/0.1  | q4_0 (q4_0) |    837 |  41s | MTP        min=3 max=4 p_min=0.20 (82%) |  1024/512 |            |
|  19 t/s |  96 k |   0 | 66/66 | 15.7 | 12.3/0.1  | q4_0 (q4_0) |    831 |  43s | MTP        min=4 max=5 p_min=0.20 (76%) |  1024/512 |            |
|  35 t/s |  64 k |   0 | 66/66 | 15.1 | 12.3/0.0  | q4_0 (q4_0) |    881 |  25s | MTP        min=3 max=4 p_min=0.20 (80%) |  1024/256 |            |
|  18 t/s |  64 k |   0 | 66/66 | 15.7 | 12.3/0.0  | q8_0 (q4_0) |    784 |  44s | MTP        min=3 max=4 p_min=0.20 (85%) |  1024/256 |            |
|  17 t/s |  64 k |   0 | 66/66 | 15.7 | 12.3/0.0  | q8_0 (q4_0) |    784 |  45s | MTP        min=3 max=4 p_min=0.20 (85%) |  2048/256 |            |
|  24 t/s |  64 k |   0 | 66/66 | 15.7 | 12.3/0.0  | q8_0 (q8_0) |    784 |  33s | MTP        min=3 max=4 p_min=0.20 (84%) |  2048/256 | K: q8_0    |
|  36 t/s |  32 k |   0 | 66/66 | 14.7 | 12.3/0.0  | q8_0 (q4_0) |    784 |  21s | MTP        min=3 max=4 p_min=0.20 (85%) |  2048/256 |            |
|  29 t/s |  32 k |   0 | 66/66 | 14.6 | 12.3/0.0  | q8_0 (q8_0) |    784 |  27s | MTP        min=3 max=4 p_min=0.20 (84%) |  2048/256 | K: q8_0    |


model=RVN-IQ3_M-mtp_Observerx.gguf
ctx_k=96
gpu_layers=99
cpu_moe=0
spec=draft-mtp
draft_model=none
predict_token=3/4
jinja=0
batch=1024
ubatch=512
_test_model

OpenAI tools compatibility    : ❌

model=Qwen3.8-27B-YMQ-M_zerodigest.gguf
ctx_k=64
gpu_layers=99
cpu_moe=0
spec=draft-mtp
draft_model=none
predict_token=3/4
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  23 t/s |  64 k |   0 | 66/66 | 15.7 | 13.1/0.0  | q4_0  |   2048 |  90s | MTP     2/4             -- (87%) |   512/256 |            |
|  17 t/s |  64 k |   0 | 66/66 | 15.7 | 13.1/0.0  | q4_0  |   2048 | 122s | MTP     3/4             -- (75%) |  1024/256 |            |
|  16 t/s |  64 k |   0 | 66/66 | 14.9 | 13.1/0.0  | q4_0  |   1468 |  89s | none                          -- |   512/256 |            |


model=Qwen3.8-27B-UD-IQ4_XS_unsloth.gguf 
ctx_k=72
gpu_layers=99
cpu_moe=0
quant=q4_0/q4_0
spec=draft-mtp
draft_model=none
predict_token=3/3
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  44 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.0  | q4_0 (q4_0) |    568 |  13s | MTP        min=4 max=4 p_min=0.20 (91%) |  1024/256 | R: medium         |
|  43 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.0  | q4_0 (q4_0) |    568 |  13s | MTP        min=3 max=4 p_min=0.20 (91%) |  1024/256 | R: medium         |
|  43 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.0  | q4_0 (q4_0) |    568 |  13s | MTP        min=2 max=4 p_min=0.20 (91%) |  1024/256 | R: medium         |
|  33 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.0  | q4_0 (q4_0) |    584 |  18s | MTP        min=2 max=3 p_min=0.20 (95%) |  1024/256 | R: medium         |
|  33 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.0  | q4_0 (q4_0) |    584 |  17s | MTP        min=3 max=3 p_min=0.20 (93%) |   512/128 | R: medium         |
|  23 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.1  | q4_0 (q4_0) |    566 |  25s | MTP        min=1 max=4 p_min=0.20 (87%) |  1024/512 | R: medium         |
|  21 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.1  | q4_0 (q4_0) |    570 |  28s | MTP        min=2 max=5 p_min=0.20 (88%) |  1024/512 | R: medium         |
|  20 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.0  | q4_0 (q4_0) |    584 |  30s | MTP        min=5 max=6 p_min=0.20 (84%) |  1024/256 | R: medium         |
|  20 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.2  | q4_0 (q4_0) |    560 |  28s | MTP        min=3 max=4 p_min=0.20 (90%) | 2048/1024 | R: medium         |
|  20 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.2  | q4_0 (q4_0) |    560 |  28s | MTP        min=1 max=4 p_min=0.20 (90%) | 2048/1024 | R: medium         |
|  19 t/s |  80 k |   0 | 65/66 | 15.5 | 12.6/0.0  | q4_0 (q4_0) |    586 |  31s | MTP        min=2 max=2 p_min=0.20 (94%) |   512/128 | R: medium         |

|  42 t/s |  64 k |   0 | 66/66 | 15.7 | 12.8/0.1  | q4_0 (q4_0) |    566 |  14s | MTP        min=3 max=4 p_min=0.20 (87%) |  1024/512 | R: medium         |
|  44 t/s |  64 k |   0 | 66/66 | 15.5 | 12.8/0.0  | q4_0 (q4_0) |    568 |  13s | MTP        min=3 max=4 p_min=0.20 (91%) |  1024/256 | R: medium         |
|  33 t/s |  64 k |   0 | 66/66 | 15.4 | 12.8/0.1  | q4_0 (q4_0) |    544 |  16s | MTP        min=1 max=2 p_min=0.20 (96%) |  1024/512 | R: medium         |
|  33 t/s |  64 k |   0 | 66/66 | 15.2 | 12.8/0.0  | q4_0 (q4_0) |    584 |  18s | MTP        min=1 max=2 p_min=0.20 (96%) |  1024/256 | R: medium         |
|  38 t/s |  48 k |   0 | 66/66 | 15.1 | 12.8/0.1  | q4_0 (q4_0) |    544 |  15s | MTP        min=2 max=3 p_min=0.20 (95%) |  1024/512 | R: medium         |

# Q8
model=Qwen3.8-27B-UD-IQ4_XS_unsloth.gguf 
ctx_k=40
gpu_layers=99
cpu_moe=0
quant=q8_0/q4_0
spec=draft-mtp
draft_model=none
predict_token=4/4
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  42 t/s |  32 k |   0 | 66/66 | 15.2 | 12.8/0.1  | q8_0 (q4_0) |    585 |  14s | MTP        min=4 max=4 p_min=0.20 (90%) |  1024/512 | R: medium         |
|  25 t/s |  48 k |   0 | 66/66 | 15.7 | 12.7/0.1  | q8_0 (q4_0) |    602 |  24s | MTP        min=4 max=4 p_min=0.20 (91%) |  1024/512 | R: medium         |


model=Qwen3.8-27B-IQ4_XS_unsloth.gguf 
ctx_k=48
gpu_layers=99
cpu_moe=0
spec=draft-mtp
draft_model=none
predict_token=2/3
jinja=0
batch=1024
ubatch=512
_test_model


| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |----------=======- |
|  25 t/s |  80 k |   0 | 66/66 | 15.7 | 12.8/0.1  | q4_0 (q4_0) |    570 |  24s | MTP        min=4 max=4 p_min=0.20 (88%) |  1024/512 | R: medium         |
|  16 t/s |  48 k |   0 | 66/66 | 15.7 | 14.0/0.1  | q4_0 (q4_0) |    610 |  39s | MTP        min=2 max=3 p_min=0.20 (90%) |  1024/512 |                   |
|  15 t/s |  48 k |   0 | 66/66 | 15.7 | 14.0/0.1  | q4_0 (q4_0) |    602 |  39s | MTP        min=1 max=2 p_min=0.20 (95%) |  1024/512 | R: medium         |
|  32 t/s |  32 k |   0 | 66/66 | 15.7 | 14.0/0.1  | q4_0 (q4_0) |    602 |  19s | MTP        min=1 max=2 p_min=0.20 (95%) |  1024/512 | R: medium         |


```
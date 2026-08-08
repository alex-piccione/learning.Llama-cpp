# Qwen 3.6 27B

| File                                                       | Result                                      |
|------------------------------------------------------------|---------------------------------------------|
| Qwen3.6-27B-Cerebellum-v5-Q2_K_deucebucket.gguf            | ✔️ Slow but fixed the TEST 01 very quickly  |
| Qwen3.6-27B-IQ4_XS_unsloth.gguf                            | ❌ 16 t/s                                   |
| Qwen3.6-27B-Q4_K_M_unsloth.gguf                            | ❌ too slow                                 |
| Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf            | ❌ too slow                                 |
| Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf    | ❌ too slow                                 |


##
https://huggingface.co/DavidAU/Qwen3.6-27B-Fable-Fusion-711-Uncensored-Heretic-NM-DAU-NEO-MAX-MTP-GGUF

## 🥇 Cerebellum v5 Q2_K Mixed (deucebucket)
Qwen3.6-27B-Cerebellum-v5-Q2_K_deucebucket.gguf                   12.4 GB
https://huggingface.co/deucebucket/Qwen3.6-27B-Cerebellum-GGUF
Max: 96K context

With Ngram-simple, Temperature of 0.1 gives 22 t/s while temperature of 0.3 gives 17 t/s.  
Low temperature increasa the t/s at 40-43 near the end of the stream, I suppose when code is generated, but it creates longher responses.


##
Qwen3.6-27B-Fable-Fus-711-UnHeretic-NM-DAU-NEO-MAX-NEO-LOW-MTP-IQ4_XS_davidau.gguf            14 GB


## ❌ Esper 3.1 (by mr radermacher)
Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf                    15.4 GB
https://huggingface.co/mradermacher/Qwen3.6-27B-Esper3.1-GGUF  
10 t/s

## ❌ Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf
Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf            15.6 GB
< 10 t/s

## ❌ Q4_K_M (by Unsloth)
Qwen3.6-27B-Q4_K_M_unsloth.gguf                                    15.6 GB
Only 32K, 10 t/s

## ❌ IQ4_K_XS (Unsloth)
Qwen3.6-27B-IQ4_XS_unsloth.gguf                                    13.3 GB
Smart but slow: 64k,  17 t/s also with speculation.

## Qwen3.6-27B-DFlash-Q4_K_M_anbeeld.gguf
Qwen3.6-27B-DFlash-Q4_K_M_anbeeld.gguf   (file lost ?)

Draft models: (https://huggingface.co/Anbeeld/Qwen3.6-27B-DFlash-GGUF?show_file_info=Qwen3.6-27B-DFlash-Q4_K_M.gguf)
Qwen3.6-27B-DFlash-Q8_0_anbeeld.dflash.gguf


## Run tests

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf
|  24 t/s |  16 k |   6 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    759 |  32s | DFlash (N-gram)  | s_M=32 s_N=16 min=1 (99%)      | 1024/256     |                 |
|  24 t/s |  16 k |   6 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    738 |  31s | DFlash (N-gram)  | s_M=24 s_N=12 min=1 (83%)      | 1024/256     |                 |
|  23 t/s |  16 k |   4 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    738 |  32s | DFlash (N-gram)  | s_M=20 s_N=10 min=1 (76%)      | 1024/256     |                 |
|  23 t/s |  16 k |   5 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    738 |  33s | DFlash (N-gram)  | s_M=20 s_N=10 min=1 (76%)      | 1024/256     |                 |
|  20 t/s |  16 k |   5 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    733 |  36s | DFlash (N-gram)  | s_M=12 s_N=6 min=1 (71%)       | 1024/256     |                 |
|  20 t/s |  16 k |   6 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    733 |  37s | DFlash (N-gram)  | s_M=12 s_N=6 min=1 (71%)       | 1024/256     |                 |
|  14 t/s |  16 k |   5 | 65/65  | 15.7 GB | 14.7/0.0  | --    |    762 |  52s | none             | --                             | 1024/256     |                 |
|  13 t/s |  32 k |   6 | 63/65  | 15.7 GB | 14.3/0.5  | --    |   2048 | 160s | DFlash (N-gram)  | s_M=16 s_N=16 min=1 (94%)      | 1024/256     |                 |



```bash


model=Qwen3.6-27B-Fable-Fus-711-UnHeretic-NM-DAU-NEO-MAX-NEO-LOW-MTP-IQ4_XS_davidau.gguf
ctx_k=64
gpu_layers=99
cpu_moe=0
spec=mtp
draft_model=none
predict_token=4/6
jinja=0
batch=1024
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  15 t/s |  64 k |   0 | 66/66 | 15.3 | 13.5/0.1  | q4_0  |    690 |  45s | N-gram      N=6 M=12 min=1 (43%) |  1024/512 |            |
|  15 t/s |  64 k |   3 | 66/66 | 15.3 | 13.5/0.1  | q4_0  |    690 |  45s | N-gram      N=6 M=12 min=1 (43%) |  1024/512 |            |
|  15 t/s |  64 k |   0 | 66/66 | 15.7 | 13.5/0.1  | q4_0  |    837 |  56s | MTP                     -- (95%) |  1024/512 |            |


model=Qwen3.6-27B-Cerebellum-v5-Q2_K_deucebucket.gguf
ctx_k=128
gpu_layers=99
cpu_moe=0
spec=simple
draft_model=none
predict_token=6/12
jinja=0
batch=1024
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Predicion                        | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  17 t/s |  96 k |   0 | 65/65 | 14.6 | 12.0/0.1  | q4_0  |   1090 |  63s | none                             |  1024/512 |            |
|  17 t/s |  64 k |   2 | 65/65 | 13.9 | 12.0/0.1  | q4_0  |   1090 |  63s | none                             |  1024/512 |            |
|  17 t/s |  32 k |   0 | 65/65 | 13.1 | 12.0/0.0  | q4_0  |    683 |  39s | none                             |  1024/256 |            |

|  22 t/s | 128 k |   0 | 65/65 | 15.3 | 12.0/0.1  | q4_0  |   1086 |  51s | N-gram       N=8 M=8 min=1 (87%) |  1024/512 |            |

|  22 t/s |  96 k |   0 | 65/65 | 14.6 | 12.0/0.1  | q4_0  |   1086 |  49s | N-gram       N=8 M=8 min=1 (87%) |  1024/512 |            |
|  17 t/s |  96 k |   0 | 65/65 | 14.6 | 12.0/0.1  | q4_0  |    608 |  36s | N-gram       N=8 M=8 min=1 (66%) |  1024/512 |            |

|  19 t/s |  96 k |   0 | 65/65 | 15.7 | 12.0/0.1  | q8_0  |   1077 |  57s | N-gram       N=8 M=4 min=1 (68%) |  1024/512 |            |
|  16 t/s |  96 k |   0 | 65/65 | 15.7 | 12.0/0.1  | q8_0  |   1077 |  67s | N-gram       N=4 M=4 min=1 (84%) |  1024/512 |            |
|  16 t/s |  96 k |   0 | 65/65 | 14.6 | 12.0/0.1  | q4_0  |    608 |  37s | N-gram     N=10 M=10 min=1 (52%) |  1024/512 |            |
|  17 t/s |  64 k |   0 | 65/65 | 13.9 | 12.0/0.1  | q4_0  |    620 |  37s | N-gram      N=8 M=10 min=1 (58%) |  1024/512 |            |
|  22 t/s |  64 k |   0 | 65/65 | 13.9 | 12.0/0.1  | q4_0  |   1086 |  50s | N-gram       N=8 M=8 min=1 (87%) |  1024/512 |            |
|  15 t/s |  64 k |   0 | 65/65 | 14.9 | 12.0/0.1  | q8_0  |    638 |  42s | N-gram       N=8 M=6 min=1 (56%) |  1024/512 |            |



model=Qwen3.6-27B-Q4_K_M_unsloth.gguf
ctx_k=64
gpu_layers=99
cpu_moe=0
spec=none
draft_model=none
predict_token=4/4
jinja=1
batch=1024
ubatch=256
_test_model


model=Qwen3.6-27B-IQ4_XS_unsloth.gguf
ctx_k=80
gpu_layers=99
cpu_moe=0
spec=simple
draft_model=none
predict_token=6/12
jinja=0
batch=1024
ubatch=512
_test_model

|  16 t/s |  64 k |   0 | 65/65 | 15.5 | 13.7/0.0  | q4_0  |   1129 |  72s | none                             |  1024/256 |            |
|  16 t/s |  32 k |   0 | 65/65 | 14.8 | 13.7/0.0  | q4_0  |   1129 |  72s | none                             |  1024/256 |            |

|  26 t/s |  80 k |   0 | 65/65 | 15.7 | 13.7/0.0  | q4_0  |   1592 |  62s | N-gram      N=8 M=16 min=1 (75%) |  1024/256 |            |
|  25 t/s |  80 k |   0 | 65/65 | 15.7 | 13.7/0.0  | q4_0  |   1612 |  64s | N-gram      N=8 M=14 min=1 (80%) |  1024/256 |            |
|  24 t/s |  64 k |   0 | 65/65 | 15.5 | 13.7/0.0  | q4_0  |   1725 |  73s | N-gram      N=8 M=12 min=1 (81%) |  1024/256 |            |
|  23 t/s |  64 k |   0 | 65/65 | 15.5 | 13.7/0.0  | q4_0  |   3446 | 153s | N-gram      N=8 M=10 min=1 (86%) |  1024/256 |            |
|  21 t/s |  80 k |   0 | 65/65 | 15.7 | 13.7/0.1  | q4_0  |   1142 |  55s | N-gram      N=6 M=12 min=1 (69%) |  1024/512 |            |
|  19 t/s |  64 k |   0 | 65/65 | 15.5 | 13.7/0.0  | q4_0  |   1631 |  86s | N-gram      N=6 M=10 min=1 (72%) |  1024/256 |            |
|  18 t/s |  80 k |   0 | 65/65 | 15.7 | 13.7/0.1  | q4_0  |   1167 |  63s | N-gram       N=4 M=8 min=1 (70%) |  1024/512 |            |
|  16 t/s |  64 k |   0 | 65/65 | 15.5 | 13.7/0.0  | q4_0  |    778 |  48s | N-gram     N=10 M=10 min=1 (62%) |  1024/256 |            |


model=Qwen3.6-27B-Claude-Mythos-Distilled.Q4_K_M_chatqaq.gguf
ctx_k=32
gpu_layers=60
cpu_moe=5
spec=1
draft_model=none
predict_token=12/12
jinja=0
batch=1024
ubatch=256
_test_model


model=Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf
ctx_k=64
gpu_layers=3
cpu_moe=5
spec=0
draft_model=none
predict_token=16/16
jinja=1
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Predicion                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------- | --------- |----------- |
|  15 t/s |  32 k |   7 | 65/65 | 15.7 | 14.7/0.0  | q4_0  |   4096 | 282s | none       --              |  1024/256 |            |
|  15 t/s |  32 k |   5 | 65/65 | 15.7 | 14.7/0.0  | q4_0  |   4096 | 281s | none       --              |  1024/256 |            |
|  12 t/s |  32 k |   3 | 64/65 | 15.6 | 14.5/0.0  | q4_0  |   1248 | 107s | none       --              |  1024/256 |            |


model=Qwen3.6-27B-Esper3.1.Q4_K_M_mr_radermacher.gguf
ctx_k=16
gpu_layers=99
cpu_moe=7
spec=0
draft_model=none
predict_token=16/16
jinja=1
batch=1024
ubatch=256
_test_model


model=Qwen3.6-27B-Q4_K_M_unsloth.gguf
ctx_k=64
gpu_layers=59
cpu_moe=3
spec=none
draft_model=none
predict_token=6/12
jinja=0
batch=1024
ubatch=256
_test_model

model=Qwen3.6-27B-Q4_K_M_unsloth.gguf
ctx_k=32
gpu_layers=99
cpu_moe=0
spec=none
draft_model=none
predict_token=4/4
jinja=1
batch=1024
ubatch=256
_test_model


| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Predicion                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------- | --------- |----------- |
|  16 t/s |  48 k |   0 | 65/65 | 15.1 | 13.7/0.0  | q4_0  |   1129 |  72s | none       --              |  1024/256 |            |
|  16 t/s |  32 k |   0 | 65/65 | 14.8 | 13.7/0.0  | q4_0  |   1129 |  72s | none       --              |  1024/256 |            |



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


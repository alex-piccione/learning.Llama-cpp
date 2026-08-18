# Nemotron 3.5 Lightning

| File                                                                  | Result                                      |
| ---                                                                   | ---                                         |
| Nemotron-3.5-Lightning-30B-A3B-IQ4_NL_bartowski.gguf                  | ❌ 96k: 40 t/s     DANGEROUS behaviour     |


## ❌ IQ4_NL (bartowski)
Nemotron-3.5-Lightning-30B-A3B-IQ4_NL_bartowski.gguf               17.6 GB
https://huggingface.co/bartowski/NVIDIA-Nemotron-3.5-Lightning-30B-A3B-GGUF
!!! [DANGER] Edit completely unrelated files when asked to create a PR. It failed to create teh PR for 10 minutes, finning hte context, then started edit skills files and AGENTS.md file. !!!



```bash

model=Nemotron-3.5-Lightning-30B-A3B-IQ4_NL_bartowski.gguf
ctx_k=96
gpu_layers=99
cpu_moe=9
spec=none
draft_model=none
predict_token=6/8
jinja=0
batch=1024
ubatch=256
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Prediction                       | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------------- | --------- |----------- |
|  46 t/s |  96 k |   8 | 54/54 | 15.7 | 14.7/0.1  | q8_0  |    868 |  19s | none                          -- |  1024/256 |            |
|  41 t/s |  96 k |   9 | 54/54 | 15.0 | 14.1/0.1  | q8_0  |    560 |  14s | none                          -- |  1024/256 |            |
|  40 t/s |  96 k |   9 | 54/54 | 15.0 | 14.1/0.1  | q8_0  |    560 |  14s | none                          -- |  1024/256 |            |

|  31 t/s |  96 k |   9 | 51/54 | 15.0 | 14.0/0.1  | q8_0  |    547 |  17s | none                          -- |  1024/256 |            |
|  30 t/s |  96 k |   9 | 50/54 | 15.2 | 14.0/0.1  | q8_0  |    590 |  20s | none                          -- |  1024/256 |            |
|  22 t/s |  96 k |   9 | 47/54 | 15.1 | 13.9/0.1  | q8_0  |    627 |  29s | none                          -- |  1024/256 |            |

|  22 t/s |  96 k |   9 | 54/54 | 15.7 | 14.8/0.1  | q8_0  |    645 |  29s | MTP min=2 max=4 p_min=0.70 (87%) |  1024/256 |            |
|  18 t/s |  96 k |   9 | 54/54 | 15.7 | 14.8/0.1  | q8_0  |    537 |  30s | MTP min=6 max=8 p_min=0.70 (84%) |  1024/256 |            |

|  49 t/s |  64 k |   8 | 54/54 | 15.6 | 14.7/0.0  | q8_0  |    868 |  18s | none                          -- |  1024/256 |            |
|  48 t/s |  64 k |   7 | 54/54 | 15.6 | 14.7/0.0  | q8_0  |    868 |  18s | none                          -- |  1024/256 |            |



```
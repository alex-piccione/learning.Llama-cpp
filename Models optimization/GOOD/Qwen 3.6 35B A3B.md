# Qwen 3.6 35B A3B

| Model                                    | File                                                         | Result                                  |
| ---------------------------------------- | ------------------------------------------------------------ | --------------------------------------- |
| Genesis V3 APEX Compact (LuffyTheFox)    | Qwen3.6-35B-A3B-Unc-Genesis-V3-APEX-Compact_luffythefox.gguf | ✔️ 30-35 t/s with 96 and 128k           | 
| Coder CD CD-Q4_K_M (ManniX)              | Qwen3.6-27B-A3B-Coder-CD-Q4_K_M_mannix.gguf                  | ⚠️ 30-35 t/s with 96 and 128k TEST      |
| REAP20 Q4_K_M (by barozp)                | Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf                    | ⚠️ Good but only 64k                    |
| MOE384-pruned-Q4_K_M (by tipe)           | Qwen3.6-35B-A3B-MOE384-pruned-Q4_K_M_tipe.gguf               | ⚠️ Loop in Pi. Good analyze/write code  |
| MTP MXFP4 MOE (by Unsloth)               | Qwen3.6-35B-A3B-MXFP4_MOE_unsloth.gguf                       | ❌ Too big. Slow.                       |
| REAP pruned ratio 0.3 Q4_K_M (amazeble)  | Qwen3.6-35B-REAP-pruned-ratio-0.3-Q4_K_M_amazeble.gguf       | ❌ no tools                             |
| REAP pruned ratio 0.5 Q4_K_M (lemmyhans) | Qwen3.6-35B-REAP-pruned-ratio-0.5-Q4_K_M_lemmyhans.gguf      | ❌ no tools                             |
| UD Q3_K_XL (Unsloth)                     | Qwen3.6-35B-A3B-UD-Q3_K_XL_unsloth.gguf                      | ❌ Too slow at 96K                      |
| UD Q4_K_M (Unsloth)                      | Qwen3.6-35B-A3B-UD-Q4_K_M_unsloth.gguf                       | ❌ 22GB                                 |


## ⚠️ Coder CD Q4_K_M (by Mannix)
Qwen3.6-27B-A3B-Coder-CD-Q4_K_M_mannix.gguf                             13.6 GB
⚠️ A lot of mistakes:
  - Instead of use the web-search skill... it tried to re-create it (actually breaking it)!
  - It uses the write tool for edit and instead completely wipe out files.
  - It continue to say that .net 10 cannot have F# test projects (claiming a known bug) and want to switch to xUnit ot .net 9, despite I repeatedly said I have a solution that is working fine.

## ✔️ Uncensored Genesis V3 APEX (by luffythefox)
Qwen3.6-35B-A3B-Unc-Genesis-V3-APEX-Compact_luffythefox.gguf            16.1 GB  
With scepulation like 24/24 I obtain 50 t/s in the test but 18 t/s in the real use in Pi  

- 128k with MOE 4
- 96k with MOE 3 
Speed is super variable, it can get stuck at 10-15 t/s and reach 40 t/s with both the configuration.

No Spec: Speculation active gives low t/s in real use (Test: 45 t/s, Pi: 18 t/s).


## Q4_K_XL (Unsloth)
                                    GB
https://huggingface.co/unsloth/Qwen3.5-35B-A3B-GGUF

## ⚠️ REAP20 Q4_K_M (by barozp)
Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf                            16.0 GB
https://huggingface.co/barozp/Qwen3.6-28B-REAP20-A3B-GGUF

CPU_MOE: 3-4
Context: MAX 64k, can't go over! ❌

Speed on Pi
| N/M   |   t/s | Note                                 |
| ----- | ----- | ------------------------------------ |
| 8/8   | 45-50 | Smart                                |
| 12/12 | 45-50 | Smart                                |
| 16/16 | 35-45 | On writing file it reached 80 t/s    |

Not relevant differences noted between these 3 configurations using Pi agent.


## ⚠️ MOE384-pruned-Q4_K_M (by tipe)
Qwen3.6-35B-A3B-MOE384-pruned-Q4_K_M_tipe.gguf                         16.5 GB
MOE: Yes (best value: 5)

❌ Went in loop often in Pi. It is very good to write and analyze code.


## ❌ REAP pruned ratio 0.3 Q4_K_M (by amazeble)
Qwen3.6-35B-REAP-pruned-ratio-0.3-Q4_K_M_amazeble.gguf               14.2 GB
OpenAI tools compatibility    : ❌

## ❌ MTP MXFP4 MOE (by Unsloth)
Qwen3.6-35B-A3B-MXFP4_MOE_unsloth.gguf                               .6 GB
https://huggingface.co/unsloth/Qwen3.6-35B-A3B-MTP-GGUF
(Other quantizations: https://huggingface.co/unsloth/Qwen3.6-35B-A3B-MTP-GGUF)

❌ Too slow

## ❌ REAP pruned ratio 0.5 Q4_K_M (by lemmyhans)  [DELETED]
Qwen3.6-35B-REAP-pruned-ratio-0.5-Q4_K_M_lemmyhans.gguf               10.5 GB
https://huggingface.co/lennyhans/Qwen3.6-35B-REAP-Pruned-ratio-0.5-Q4_K_M-GGUF
❌ OpenAI tools compatibility


## ❌ UD Q3_K_XL (by Unsloth)   [DELETED]
Qwen3.6-35B-A3B-UD-Q3_K_XL_unsloth.gguf                                16.0 GB
❌ Too slow at 96k

## ❌ UD Q4_K_M (by Unsloth)       [DELETED]
Qwen3.6-35B-A3B-UD-Q4_K_M_unsloth.gguf                                 20.6 GB
https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF

❌ Too big, too slow.

## Run results

| Speed   | Ctx   | MoE | GPU    | VRAM    | VRAM/RAM  | Cache | Tokens | Time | Pred type        | Pred info                      | Batch/Ubatch | Note            |
| ------- | ----- | --- | -----  | ------- | --------- | ----- | ------ | ---- | ---------------- | ------------------------------ | ------------ |---------------- |
| Qwen3.6-27B-A3B-Coder-CD-Q4_K_M_mannix.gguf
|  51 t/s | 128 k |   1 | 42/42  | 14.9 GB | 12.9/0.8  | --    |   1185 |  24s | none             | --                             | 1024/512     |                 |
|  43 t/s | 128 k |   1 | 42/42  | 15.0 GB | 12.9/0.8  | --    |   1173 |  27s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (76%)      | 1024/512     |                 |
|  47 t/s | 128 k |   1 | 42/42  | 14.9 GB | 12.9/0.8  | --    |   2291 |  48s | none             | --                             | 1024/256     |                 |
|  43 t/s | 128 k |   2 | 42/42  | 14.6 GB | 12.6/1.1  | --    |   1113 |  26s | none             | --                             | 1024/256     |                 |
|  43 t/s | 128 k |   2 | 42/42  | 14.6 GB | 12.6/1.1  | --    |   1113 |  26s | none             | --                             | 2048/256     |                 |
|  44 t/s | 128 k |   2 | 42/42  | 14.6 GB | 12.6/1.1  | --    |   1113 |  25s | none             | --                             | 1024/256     |                 |
|  38 t/s | 128 k |   4 | 42/42  | 14.0 GB | 12.0/1.6  | --    |   1144 |  30s | none             | --                             | 1024/256     |                 |
|  40 t/s | 128 k |   3 | 42/42  | 14.3 GB | 12.3/1.3  | --    |   2835 |  71s | none             | --                             | 1024/256     |                 |
|
| Qwen3.6-35B-A3B-MOE384-pruned-Q4_K_M_tipe.gguf                                                                                                                    |
|  45 t/s |  64 k |   5 | 41/41  | 15.6 GB | 14.2/2.1  | --    |   1079 |  25s | none             | --                             | 1024/256     |                 |
|  45 t/s |  32 k |   5 | 41/41  | 15.2 GB | 14.2/2.1  | --    |   1079 |  24s | none             | --                             | 1024/256     |                 |
|  46 t/s |  16 k |   5 | 41/41  | 15.0 GB | 14.2/2.1  | --    |   1079 |  24s | none             | --                             | 1024/256     |                 |
| 
| Qwen3.6-35B-REAP-pruned-ratio-0.3-Q4_K_M_amazeble.gguf
|  52 t/s | 128 k |   1 | 41/41  | 15.7 GB | 13.7/0.3  | --    |    821 |  16s | none             | --                             | 1024/256     |                 |
|  50 t/s | 128 k |   1 | 41/41  | 15.7 GB | 13.7/0.3  | --    |    542 |  11s | none             | --                             | 1024/512     |                 |
|  46 t/s | 128 k |   2 | 41/41  | 15.4 GB | 13.3/0.7  | --    |    834 |  18s | none             | --                             | 1024/256     |                 |
|  43 t/s | 128 k |   3 | 41/41  | 15.0 GB | 13.0/1.0  | --    |   2048 |  47s | none             | --                             | 1024/256     |                 |
|  44 t/s |  96 k |   3 | 41/41  | 14.6 GB | 13.0/1.0  | --    |   2048 |  46s | none             | --                             | 1024/256     |                 |
|  45 t/s |  64 k |   3 | 41/41  | 14.1 GB | 13.0/1.0  | --    |   2048 |  45s | none             | --                             | 1024/256     |                 |
|  42 t/s |  64 k |   5 | 41/41  | 13.6 GB | 12.3/1.7  | --    |    702 |  17s | none             | --                             | 1024/256     |                 |
|  32 t/s |  64 k |   3 | 41/41  | 14.1 GB | 13.0/1.0  | --    |    639 |  20s | none             | ngram N:12, M:24 (16%)         | 1024/256     |                 |
|
| Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf
|  42 t/s | 128 k |   5 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   2048 |  49s | none             | --                             | 1024/256     |                 |
|  34 t/s | 128 k |   5 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   1261 |  38s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (77%)      | 1024/256     |                 |
|  43 t/s |  96 k |   5 | 41/41  | 15.5 GB | 13.9/1.9  | --    |   2048 |  47s | none             | --                             | 1024/256     |                 |
|  38 t/s |  96 k |   5 | 41/41  | 15.5 GB | 13.9/1.9  | --    |   1261 |  32s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (77%)      | 1024/256     |                 |
|  32 t/s | 128 k |  11 | 41/41  | 13.8 GB | 11.7/4.3  | --    |    665 |  20s | none             | --                             | 1024/256     |                 |
|  28 t/s | 128 k |  12 | 41/41  | 13.5 GB | 11.4/4.7  | --    |    799 |  29s | none             | --                             | 1024/256     |                 |
|  29 t/s |  96 k |  11 | 41/41  | 13.4 GB | 11.7/4.3  | --    |    665 |  23s | none             | --                             | 1024/256     |                 |

|
|  43 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   1100 |  25s | DFlash (N-gram)  | s_M=16 s_N=16 min=1 (72%)      | 1024/256     |                 |
|  42 t/s |  64 k |   4 | 41/41  | 15.5 GB | 14.2/1.6  | --    |   1214 |  29s | none             | --                             | 1024/256     |                 |
|  35 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   1126 |  33s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (75%)      | 1024/256     |                 |
|  34 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   1126 |  33s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (75%)      | 1024/256     |                 |
|  32 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   1128 |  35s | DFlash (N-gram)  | s_M=10 s_N=10 min=1 (83%)      | 1024/256     |                 |
|  45 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   2048 |  46s | none             | --                             | 1024/256     | ❌ tool        |
|  42 t/s |  64 k |   5 | 41/41  | 15.1 GB | 13.9/1.9  | --    |   2048 |  49s | none             | --                             | 1024/256     | ❌ tool        |
|  49 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   2048 |  42s | DFlash (N-gram)  | s_M=24 s_N=24 min=1 (89%)      | 1024/256     | ❌ tool        |
|  49 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   2048 |  42s | DFlash (N-gram)  | s_M=24 s_N=24 min=1 (89%)      | 1024/256     | ❌ tool        |
|  34 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   2048 |  60s | none             | ngram-simple N:12 M:24 (10%)   | 1024/256     | ❌ tool        |
|  25 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   2007 |  80s | none             | ngram-simple N:10 M:24 (18%)   | 1024/256     |                 |
|  21 t/s |  64 k |   3 | 41/41  | 15.7 GB | 14.6/1.2  | --    |   1845 |  87s | none             | ngram-simple N:5 M:10 (60%)    | 1024/256     |                 |
|
| Qwen3.6-35B-REAP-pruned-ratio-0.5-Q4_K_M_lemmyhans.gguf
|  50 t/s |  64 k |   3 | 41/41  | 10.8 GB | 9.6/0.7   | --    |   2048 |  41s | none             | --                             | 1024/256     |                 |
|  39 t/s |  64 k |   5 | 41/41  | 10.3 GB | 9.1/1.2   | --    |   2048 |  53s | none             | --                             | 1024/256     |                 |
|
| Qwen3.6-35B-A3B-Unc-Genesis-V3-APEX-Compact_luffythefox.gguf 
|  52 t/s | 128 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   1127 |  21s | DFlash (N-gram)  | s_M=24 s_N=24 min=1 (98%)      | 2048/512     |                 |
|  45 t/s | 128 k |   6 | 41/41  | 15.3 GB | 13.1/2.8  | --    |   1287 |  28s | DFlash (N-gram)  | s_M=24 s_N=24 min=1 (95%)      | 2048/512     |                 |
|  42 t/s | 128 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   2018 |  48s | DFlash (N-gram)  | s_M=16 s_N=16 min=1 (73%)      | 2048/512     |                 |
|  39 t/s | 128 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   1148 |  29s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (75%)      | 2048/512     |                 |
|  36 t/s | 128 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   1602 |  45s | DFlash (N-gram)  | s_M=8 s_N=8 min=1 (82%)        | 2048/512     |                 |
|  36 t/s | 128 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   1602 |  44s | DFlash (N-gram)  | s_M=8 s_N=8 min=1 (82%)        | 1024/512     |                 |
|  33 t/s | 128 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   1342 |  40s | DFlash (N-gram)  | s_M=8 s_N=8 min=1 (81%)        | 1024/256     |                 |
|  34 t/s | 128 k |   5 | 41/41  | 15.7 GB | 13.4/2.4  | --    |   2048 |  60s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (60%)      | 2048/512     |                 |
|  33 t/s | 128 k |   5 | 41/41  | 15.6 GB | 13.4/2.4  | --    |   1086 |  32s | DFlash (N-gram)  | s_M=8 s_N=8 min=1 (86%)        | 1024/256     |                 |
|
|  50 t/s |  96 k |   3 | 41/41  | 15.7 GB | 14.4/1.5  | --    |   1768 |  35s | none             | --                             | 2048/512     |                 |
|  47 t/s |  96 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   1127 |  24s | none             | --                             | 2048/512     |                 |
|  41 t/s |  96 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   1148 |  28s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (75%)      | 2048/512     |                 |
|  36 t/s |  96 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   1602 |  45s | DFlash (N-gram)  | s_M=8 s_N=8 min=1 (82%)        | 2048/512     |                 |
|  38 t/s |  96 k |   3 | 41/41  | 15.7 GB | 14.4/1.5  | --    |    915 |  24s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (51%)      | 1024/256     |                 |
|  37 t/s |  96 k |   3 | 41/41  | 15.7 GB | 14.4/1.5  | --    |   1024 |  28s | DFlash (N-gram)  | s_M=8 s_N=8 min=1 (70%)        | 1024/256     |                 |
|  37 t/s |  96 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |   1041 |  28s | DFlash (N-gram)  | s_M=12 s_N=12 min=1 (76%)      | 1024/256     |                 |
|  34 t/s |  96 k |   5 | 41/41  | 15.2 GB | 13.4/2.4  | --    |   1086 |  32s | DFlash (N-gram)  | s_M=8 s_N=8 min=1 (86%)        | 1024/256     |                 |
|  34 t/s |  64 k |   3 | 41/41  | 15.6 GB | 14.4/1.5  | --    |    933 |  27s | DFlash (N-gram)  | s_M=12 s_N=8 min=1 (53%)       | 1024/256     |                 |
|  22 t/s |  96 k |   4 | 41/41  | 15.7 GB | 13.9/1.9  | --    |    780 |  35s | DFlash (N-gram)  | s_M=4 s_N=4 min=1 (70%)        | 2048/512     |                 |
|
| Qwen3.5-35B-A3B-UD-Q4_K_M_unsloth.gguf
|  16 t/s |  96 k |   0 | 41/42  | 14.0 GB | 12.4/8.6  | --    |    783 |  50s | none             | --                             | 2048/256     |                 |
|
| Qwen3.6-35B-A3B-UD-Q3_K_XL_unsloth.gguf
|  24 t/s |  96 k |   0 | 41/42  | 14.0 GB | 12.3/3.7  | --    |    676 |  28s | none             | --                             | 1024/512     |                 |
|   6 t/s |  96 k |   1 | 39/42  | 15.7 GB | 14.4/1.6  | --    |    674 | 120s | none             | --                             | 1024/256     |                 |
| Qwen3.6-35B-A3B-MXFP4_MOE_unsloth.gguf 
| [ABORT] Generation speed dropped to 2.13 t/s.



```bash

model=Qwen3.6-35B-A3B-Unc-Genesis-V3-APEX-Compact_luffythefox.gguf
ctx_k=96
gpu_layers=-1
cpu_moe=3
spec=none
draft_model=none
predict_token=4/4
mtp=0
jinja=0
batch=2048
ubatch=512
_start_server

model=Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf
ctx_k=96
#gpu_layers=-1
gpu_layers=39
#cpu_moe=11
cpu_moe=9
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinja=1
batch=1024
ubatch=256
_start_server

|  28 t/s |  96 k |   9 | 41/41  | 14.2 GB | 12.5/3.6  | --    |   1271 |  46s | none             | --                             | 1024/256     |                 |
|  28 t/s |  96 k |   7 | 41/41  | 14.9 GB | 13.2/2.9  | --    |   1337 |  47s | none             | --                             | 1024/256     |                 |
|  34 t/s |  96 k |   6 | 41/41  | 15.2 GB | 13.5/2.6  | --    |   2330 |  68s | none             | --                             | 1024/256     |                 |
|  33 t/s |  96 k |   6 | 41/41  | 15.2 GB | 13.5/2.6  | --    |   2330 |  71s | none             | --                             | 1024/256     |                 |
|  39 t/s |  64 k |   5 | 41/41  | 15.1 GB | 13.9/2.2  | --    |   2203 |  57s | none             | --                             | 1024/256     |                 |
|  38 t/s |  64 k |   5 | 41/41  | 15.1 GB | 13.9/2.2  | --    |   2203 |  57s | none             | --                             | 1024/256     |                 |
|  35 t/s |  64 k |   6 | 41/41  | 14.8 GB | 13.5/2.6  | --    |   2330 |  66s | none             | --                             | 1024/256     |                 |

model=unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf
ctx_k=96
gpu_layers=-1
cpu_moe=0
spec=1
draft_model=none
predict_token=8/12
mtp=0
jinja=0
batch=2048
ubatch=256


model=Qwen3.6-27B-A3B-Coder-CD-Q4_K_M_mannix.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=1
spec=none
draft_model=none
predict_token=0/0
mtp=0
jinja=0
batch=1024
ubatch=512
_start_server


model=Qwen3.6-35B-A3B-UD-Q3_K_XL_unsloth.gguf
ctx_k=96
gpu_layers=-1
cpu_moe=1
spec=none
draft_model=none
predict_token=0/0
mtp=0
jinja=0
batch=1024
ubatch=256
_start_server


model=Qwen3.6-35B-A3B-MXFP4_MOE_unsloth.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=6
spec=0
mtp=1
draft_model=none
predict_token=2/4
jinja=0
batch=1024
ubatch=256


model=Qwen3.6-35B-A3B-MOE384-pruned-Q4_K_M_tipe.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=5
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinja=0
batch=1024
ubatch=256


model=Qwen3.6-35B-REAP-pruned-ratio-0.3-Q4_K_M_amazeble.gguf
ctx_k=128
gpu_layers=-1
cpu_moe=3
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinja=0
batch=1024
ubatch=256


model=Qwen3.6-35B-REAP-pruned-ratio-0.5-Q4_K_M_lemmyhans.gguf
ctx_k=64
gpu_layers=-1
cpu_moe=3
spec=0
draft_model=none
predict_token=0/0
mtp=0
jinja=0
batch=1024
ubatch=256

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
    $jinja \
    $batch \
    $ubatch
    
source test_models_common.sh && print_test_call
}
```


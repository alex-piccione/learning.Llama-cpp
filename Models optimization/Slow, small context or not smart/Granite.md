# Granite

| File                                             | Result                               |
| ---                                              | ---                                  |
| granite-4.2-30b-Q3_K_M_ibm.gguf                  | X Too slow                           |

## Cerebellum-v2 Q3_K_M                [DELETED]
Granite-4.1-30B-Cerebellum-v2-Q3_K_M.gguf                 12.6 GB
https://huggingface.co/deucebucket/Granite-4.1-30B-Cerebellum-GGUF

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Predicion                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------- | --------- |----------- |
|  17 t/s |  16 k |   7 | 65/65 | 15.2 | 12.6/0.0  | q8_0  |    462 |  28s | none       --              |  1024/512 |            |
|  17 t/s |   8 k |   5 | 65/65 | 14.1 | 12.6/0.0  | q8_0  |    462 |  28s | none       --              |  1024/512 |            |
|  10 t/s |  16 k |   0 | 63/65 | 14.8 | 12.2/0.0  | q8_0  |    464 |  47s | none       --              |  1024/512 |            |


## granite-4.2-30b-Q3_K_M_ibm.gguf
MTP: No

## Tests

```bash
_test_model() {

model=granite-4.2-30b-Q3_K_M_ibm.gguf
ctx_k=32
gpu_layers=99
cpu_moe=0
spec=draft-simple
draft_model=none
predict_token=8/10
jinja=0
batch=1024
ubatch=512
_test_model

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | CH  (draft) | Tokens | Time | Speculative Prediction                  | Batch/Ub. | Note              |
| ------- | ----- | --- | ----- | ---- | --------- | ----------- | ------ | ---- | --------------------------------------- | --------- |------------------ |
|  22 t/s |  32 k |   0 | 65/65 | 15.7 | 13.0/0.0  | q4_0 (none) |    988 |  46s | N-gram              N=4 M=6 min=1 (50%) |  1024/512 |                   |
|  19 t/s |  32 k |   0 | 65/65 | 15.7 | 13.0/0.0  | q4_0 (none) |   1126 |  60s | N-gram             N=8 M=10 min=1 (44%) |  1024/512 |                   |
|  16 t/s |  32 k |   0 | 65/65 | 15.7 | 13.0/0.0  | q4_0 (none) |   1015 |  63s | none                                 -- |  1024/512 |                   |

model=Granite-4.1-30B-Cerebellum-v2-Q3_K_M.gguf
ctx_k=16    # 8 ok
cpu_moe=0   # no effect
gpu_layers=63
spec=none
draft_model=none
predict_token=1/2   # (N/M)
jinja=0
batch=1024
ubatch=512
_test_model
```
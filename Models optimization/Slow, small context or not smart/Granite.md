# Granite

## Cerebellum-v2 Q3_K_M                [DELETED]
Granite-4.1-30B-Cerebellum-v2-Q3_K_M.gguf                 12.6 GB
https://huggingface.co/deucebucket/Granite-4.1-30B-Cerebellum-GGUF

| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Predicion                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------- | --------- |----------- |
|  17 t/s |  16 k |   7 | 65/65 | 15.2 | 12.6/0.0  | q8_0  |    462 |  28s | none       --              |  1024/512 |            |
|  17 t/s |   8 k |   5 | 65/65 | 14.1 | 12.6/0.0  | q8_0  |    462 |  28s | none       --              |  1024/512 |            |
|  10 t/s |  16 k |   0 | 63/65 | 14.8 | 12.2/0.0  | q8_0  |    464 |  47s | none       --              |  1024/512 |            |


## Tests

```bash
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
    $ubatch \
    $cache_kv
    
source test_models_common.sh && print_test_call
}


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
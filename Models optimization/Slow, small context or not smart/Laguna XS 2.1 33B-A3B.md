# Laguna XS 2.1 33B-A3B



## ❌ XS-2.1 Q4_K_M (by poolside)
https://huggingface.co/poolside/Laguna-XS-2.1-GGUF
Laguna-XS-2.1-Q4_K_M_poolside.gguf                           18.8 GB
1.3 t/s

## 
https://huggingface.co/mradermacher/Laguna-XS-2.1-i1-GGUF
[NOT dowloaded]


```bash
model=Laguna-XS-2.1-Q4_K_M_poolside.gguf
ctx_k=16
gpu_layers=39
cpu_moe=3
spec=none
draft_model=none
predict_token=4/4
jinja=1
batch=1024
ubatch=256
_test_model


| Speed   | Ctx   | MoE | GPU   | VRAM | VRAM/RAM  | Cache | Tokens | Time | Predicion                  | Batch/Ub. | Note       |
| ------- | ----- | --- | ----- | ---- | --------- | ----- | ------ | ---- | -------------------------- | --------- |----------- |



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
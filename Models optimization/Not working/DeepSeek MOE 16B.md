# DeepSeek MOE 16B

## 1. Lucy in the Sky

❌ Response contains 1 token.

- HuggingFace link: https://huggingface.co/Lucy-in-the-Sky/deepseek-moe-16b-base-Q4_K_M-GGUF
- model: deepseek-moe-16b-base-q4_k_m.gguf
- Quantized by: Lucy in the Sky
- file: lucy_in_the_sky_deepseek-moe-16b-base-q4_k_m.gguf


## 2. mradermacher

❌ Response contains 1 token.

- https://huggingface.co/mradermacher/deepseek-moe-16b-base-GGUF?show_file_info=deepseek-moe-16b-base.Q4_K_M.gguf
- model: deepseek-moe-16b-base-q4_k_m.gguf
- Quantized by: mradermacher
- file: mradermacher_deepseek-moe-16b-base-q4_k_m.gguf
- MoE: 
- MTP:
- OpenAI Tools capability: 


## Run tests

```bash
cd scripts

model=mradermacher_deepseek-moe-16b-base.Q4_K_M.gguf
ctx_k=16
gpu_layers=-1
cpu_moe=5
dflash=0
draft_model=none
predict_token=0
mtp=0
jinjia=0

source start_server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $dflash \
    $draft_model \
    $predict_token \
    $mtp \
    $jinjia

source test_models_common.sh && \
test_call_result_row $(flag_or $dflash $mtp)

```
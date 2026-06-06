# Models

| Model                   | Quantized by | File                                            | Speed  | Context | Pi                    | Note                             |
| ----------------------- |------------- | ----------------------------------------------- | ------ | ------- | --------------------- | -------------------------------- |
| GPT OSS 20B             | Unsloth      | gpt-oss-20b-Q4_K_M.gguf                         | 75 t/s |   128 k |                       |                                  |
| Qwen 3.5 9B             | Unsloth      |                                                 | 39 t/s |   256 k |                       |                                  |
| Qwen 3.6 27B (not-MTP)  | bezorp       | barozp_Qwen3.6-28B-REAP20-A3B-Q4_K_M.gguf       | 42 t/s |   128 k | ✔️ 64k 35 t/s  OK     |                                  |
| Gemma 4 26B             | noctrex      | gemma-4-26B-A4B-it-MXFP4_MOE.gguf               | 36 t/s |   128 k |                       |                                  |
| GLM 4.7 Flash 23B       | Unsloth      | unsloth_GLM-4.7-Flash-REAP-23B-A3B-Q4_K_M.gguf  | 32 t/s |   128 k | ❌ 64k 35 t/s  FAIL   | Rubbish after a few questions    |
| Gemma 4 26B             | Unsloth      | gemma-4-26B-A4B-it-UD-Q4_K_M.gguf               | 28 t/s |    64 k |                       |                                  |
| Gemma 4 26B             | Unsloth      | gemma-4-26B-A4B-it-UD-Q4_K_M.gguf               | 25 t/s |   128 k |                       |                                  |
| Qwen 3.6 35B-A3B        | Unsloth      | unsloth_Qwen3.6-35B-A3B-UD-Q4_K_M.gguf          | 25 t/s |    96 k |                       |                                  |
| Qwen 3 14B              | Unsloth      | unsloth_Qwen3-14B-Q4_K_M.gguf                   | 27 t/s |    64 k |                       |                                  |
| GLM 4.7 Flash           | Unsloth      | unsloth_GLM-4.7-Flash-Q4_K_M.gguf               | 32 t/s |    32 k | ❌ 64k 5 t/s          | Too slow                         |



| Mistral-Small-3.2-24B-Instruct-2506-Q4_K_M.gguf         |              | 18 t/s |    16 k | No  |                                |
| Nemotron-3-Nano-30B-A3B-Q4_K_M.gguf                     | Unsloth      | 16 t/s |    16 k |     |                                |

Note tested yet:
- https://huggingface.co/JZC973/Qwen3.6-35B-REAP-MTP-UD-GGUF-Collection
- https://huggingface.co/Akicou/GLM-4.7-Flash-REAP-09-GGUF
- https://huggingface.co/Akicou/GLM-4.7-Flash-REAP-19-GGUF
- https://huggingface.co/mradermacher/gemma-4-19b-a4b-it-REAP-GGUF
- https://huggingface.co/DavidAU/Openai_gpt-oss-20b-CODER-NEO-CODE-DI-MATRIX-GGUF
- https://huggingface.co/noctrex/gemma-4-26B-A4B-it-MXFP4_MOE-GGUF?show_file_info=gemma-4-26B-A4B-it-MXFP4_MOE.gguf       
- https://huggingface.co/Jackrong/Qwen3.5-9B-DeepSeek-V4-Flash-MTP-GGUF?show_file_info=Qwen3.5-9B-DeepSeek-V4-Flash-MTP-Q8_0.gguf
- https://huggingface.co/Anbeeld/Qwen3.6-27B-DFlash-GGUF   draft model for  Qwen 3.6 27B
  With llama.cpp latest version (B9371 28/05/2026) it is not supported:
  > 0.16.418.984 E llama_model_load: error loading model: unknown model architecture: 'dflash-draft'
  It requires special compiled version of llama.cpp. 



Not working models:  
- qwen2.5-coder-14b-instruct-q4_k_m.gguf                         : No OpenAI tools capability         
- ERNIE-4.5-21B-A3B-Thinking-Q4_K_M.gguf                         : No OpenAI tools capability  
- Mistral Small 3.2 24B.md                                       : No MoE, no MTP, no predictive, not possible to optimize (18 t/s at 24K context)
- unsloth_Qwen3.6-27B-Q4_K_M.gguf                                : 1 t/s
- unsloth_Qwen3.6-27B-MTP-UD-Q4_K_XL.gguf                        : 1 t/s
- lucy_in_the_sky_deepseek-moe-16b-base-q4_k_m.gguf              : No OpenAI tools capability  
- mammoth-coder-13b.Q4_K_M.gguf                                  : Response contains 1 token. That's it.
- Deepseek-Coder-V2-Lite-13B-Instruct-sft-s1K.i1-Q4_K_M.gguf     : No OpenAI tools capability           (100 t/s !!)
- Kwaipilot.KwaiCoder-DS-V2-Lite-Base.Q4_K_M.gguf                : No OpenAI tools capability           (100 t/s !!)
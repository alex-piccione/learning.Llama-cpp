# Models

| Model                                                   | Quantized by | Speed  | Context | Note                           |
| ------------------------------------------------------- | ------------ | ------ | ------- | ------------------------------ |
| gpt-oss-20b-Q4_K_M.gguf                                 | Unsloth      | 75 t/s |   128 k |                                |
| Qwen 3.5 9B                                             | Unsloth      | 39 t/s |   256 k |                                |
| gemma-4-26B-A4B-it-MXFP4_MOE.gguf                       | noctrex      | 36 t/s |   128 k |                                |
| gemma-4-26B-A4B-it-UD-Q4_K_M.gguf                       | Unsloth      | 28 t/s |    64 k |                                |
| gemma-4-26B-A4B-it-UD-Q4_K_M.gguf                       | Unsloth      | 25 t/s |   128 k |                                |
| Qwen3.6-35B-A3B-UD-Q4_K_M.gguf                          | Unsloth      | 25 t/s |    96 k |                                |
| Qwen3-14B-Q4_K_M.gguf                                   | Unsloth      | 27 t/s |    64 k |                                |
| GLM 4.7 Flash                                           | Unsloth      | 24 t/s |    32 k |                                |  


| Mistral-Small-3.2-24B-Instruct-2506-Q4_K_M.gguf         |              | 18 t/s |    16 k | To test with DFlash            |
| Nemotron-3-Nano-30B-A3B-Q4_K_M.gguf                     | Unsloth      | 16 t/s |    16 k |                                |

Note tested yet:
- https://huggingface.co/noctrex/Qwopus3.6-35B-A3B-v1-MTP-MXFP4_MOE-GGUF      <<<<<<<----------
- https://huggingface.co/noctrex/gemma-4-26B-A4B-it-MXFP4_MOE-GGUF?show_file_info=gemma-4-26B-A4B-it-MXFP4_MOE.gguf       
- https://huggingface.co/Anbeeld/Qwen3.6-27B-DFlash-GGUF   draft model for  Qwen 3.6 27B
  With llama.cpp latest version (B9371 28/05/2026) it is not supported:
  > 0.16.418.984 E llama_model_load: error loading model: unknown model architecture: 'dflash-draft'
  It requires special compiled version of llama.cpp. 



Not working models:  
- qwen2.5-coder-14b-instruct-q4_k_m.gguf                         : No OpenAI tools capability         
- ERNIE-4.5-21B-A3B-Thinking-Q4_K_M.gguf                         : No response / Errors
- Qwen3.6-27B-Q4_K_M.gguf                                        : 1 t/s
- unsloth_Qwen3.6-27B-MTP-UD-Q4_K_XL.gguf                        : 1 t/s
- lucy_in_the_sky_deepseek-moe-16b-base-q4_k_m.gguf              : No OpenAI tools capability  
- mammoth-coder-13b.Q4_K_M.gguf                                  : Response contains 1 token. That's it.
- Deepseek-Coder-V2-Lite-13B-Instruct-sft-s1K.i1-Q4_K_M.gguf     : No OpenAI tools capability           (100 t/s !!)
- Kwaipilot.KwaiCoder-DS-V2-Lite-Base.Q4_K_M.gguf                : No OpenAI tools capability           (100 t/s !!)
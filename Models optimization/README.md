# Models

| Model                                                   | Quantized by | Speed  | Context | Note                           |
| ------------------------------------------------------- | ------------ | ------ | ------- | ------------------------------ |
| gemma-4-26B-A4B-it-UD-Q4_K_M.gguf                       | Unsloth      | 28 t/s |    64 k |                                |
| gemma-4-26B-A4B-it-UD-Q4_K_M.gguf                       | Unsloth      | 25 t/s |   128 k |                                |   
| Qwen3-14B-Q4_K_M.gguf                                   | Unsloth      | 27 t/s |    64 k |                                |
| Qwen3.6-35B-A3B-UD-Q4_K_M.gguf                          | Unsloth      | 25 t/s |    16 k |                                |
| Mistral-Small-3.2-24B-Instruct-2506-Q4_K_M.gguf         |              | 18 t/s |    16 k | To test with DFlash            |
| Nemotron-3-Nano-30B-A3B-Q4_K_M.gguf                     | Unsloth      | 16 t/s |    16 k |                                |

Note tested yet:
- lucy_in_the_sky_deepseek-moe-16b-base-q4_k_m.gguf
- mammoth-coder-13b.Q4_K_M.gguf                          


Not working models:  
- qwen2.5-coder-14b-instruct-q4_k_m.gguf          : No OpenAI tools capability         
- ERNIE-4.5-21B-A3B-Thinking-Q4_K_M.gguf          : No response / Errors
- Qwen3.6-27B-Q4_K_M.gguf                         : 1 t/s
- unsloth_Qwen3.6-27B-MTP-UD-Q4_K_XL.gguf         : 1 t/s
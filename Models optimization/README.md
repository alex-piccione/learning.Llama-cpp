# Models

**Not updated** Look at single model files

| Model               | Quantized by  | File                                                | Speed  | Ctx   | Pi                  | Note                             |
| ------------------- |-------------- | --------------------------------------------------- | ------ | ----- | ------------------- | -------------------------------- |
| Qwen 3.6 27B        |               | Qwen3.6-27B-Cerebellum-v5-Q2_K_deucebucket.gguf     | 17 t/s |  96 K | ✔️ 96k 16 t/s      | Best reasoning and action        |
| Qwen 3.5 27B        | Unsloth       | Qwen3.5-27B-IQ4_XS_unsloth.gguf                     | 16 t/s |  64 k | ✔️ 64k 16 t/s      | Best reasoning and action        |
| Qwen 3 Coder Next   | mrradermacher | Qwen3-Coder-Next-REAP-40B-A3B.i1-IQ3_M_.gguf        | 24 t/s |  64 k | ✔️ 64k 22 t/s      | Very good untill now             |
| Gemma 4 26B         | Unsloth       | Gemma-4-26B-A4B-it-UD-IQ4_NL_unsloth.gguf           | 39 t/s | 160 k | ✔️ 160k 20-25 t/s  |                                  |
| Gemma 4 26B         | Google        | Gemma-4-26B_Q4_0-it_google.gguf                     | 4? t/s | 128 k | ✔️ 128k 40 t/s     |                                  |

| Gemma 4 26B         | Noctrex       | Gemma-4-26B-A4B-it-MXFP4_MOE.gguf                   | 36 t/s | 128 k | ✔️ 128k 35 t/s     |                                  |
| Qwen 3.6 35B A3B    | bazorp        | Qwen3.6-28B-REAP20-A3B-Q4_K_M_barozp.gguf           | 42 t/s |  64 k | ✔️ 64k 45-80 t/s   | ✔️ Real discussion in PR.       | 
| Qwen 3.6 35B A3B    | luffithefox   | Qwen3.6-35B-A3B-Un-Genesis-V3-APEX_luffythefox.gguf | 45 t/s | 128 k | ✔️ 128k 45 t/s     | ❌ Indisciplinate                |
| Qwen 3.6 35B A3B    | tipe          | Qwen3.6-35B-A3B-MOE384-pruned-Q4_K_M_tipe.gguf      |        |  64 k | ✔️ 40 t/s          | ❌ Loop and too much proactive  |

| Gemma 4 12B         | Unsloth       | Gemma-4-12b-it-IQ4_NL_unsloth.gguf                  | 52 t/s | 256 k |                     |                                  |
| Qwen 3.5 9B         | Unsloth       |                                                     | 39 t/s | 256 k |                     |                                  |

| GPT OSS 20B         | Unsloth       | GPT-OSS-20B-Q4_K_M_unsloth.gguf                     | 75 t/s | 128 k | ✔️ 256k 45 t/s     | ❌ Not adapt for coding          |
| GPT OSS 20B         | David AU      | OpenAI-20B-NEO-CODE2-Plus-UN-IQ4_NL_davidau.gguf    | 80 t/s | 128 k | ✔️ 128k 60/70 t/s  | ❌ wrong reasoning , Loop       |
| GLM 4.7 Flash 23B   | Unsloth       | GLM-4.7-Flash-REAP-23B-A3B-Q4_K_M_unsloth.gguf      | 32 t/s | 128 k | ❌ 64k 35 t/s      | ❌Rubbish after a few questions |
| Qwopus 3.6 35B A3B  | Jackrog       | Qwopus3.6-35B-A3B-Coder-MTP-Q3_K_M_jackrong.gguf    | 47 t/s |  64 k | ❌ 64k 40 t/s      | ❌ wrong reasoning , Loop       |

| Gemma 4 26B         | Unsloth       | Gemma-4-26B-A4B-it-UD-Q4_K_M.gguf                   | 28 t/s |  64 k |                     |                                  |
| Gemma 4 26B         | Unsloth       | Gemma-4-26B-A4B-it-UD-Q4_K_M.gguf                   | 25 t/s | 128 k |                     |                                  |
| Qwen 3.6 35B-A3B    | Unsloth       | Qwen3.6-35B-A3B-UD-Q4_K_M_unsloth.gguf              | 25 t/s |  96 k | ✔️ 64k 20 t/s      | Too slow                         |
| Qwen 3.6 27B        | Unsloth       | Qwen3.6-27B-IQ4_XS_unsloth.gguf                     | 16 t/s |  80 k |                     | 24 t/s with ngram-simple
| Qwen 3.6 27B        | Unsloth       | Qwen3.6-27B-Q4_K_M_unsloth.gguf                     | 10 t/s |  32 K |                     | Too slow                         |
| Qwen 3 14B          | Unsloth       | Qwen3-14B-Q4_K_M_unsloth.gguf                       | 27 t/s |  64 k |                     |                                  |
| GLM 4.7 Flash       | Unsloth       | GLM-4.7-Flash-Q4_K_M_unsloth.gguf                   | 32 t/s |  32 k | ❌ 64k 5 t/s       | Too slow                         |
| 
| GLM 4.7 Flash 23B   | Unsloth       | GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL_unsloth.gguf  | 42 t/s |  64 k | ✔️ 37 t/s          | ❌ Rubbish with just "hi"        |
| Ornith 1.0          | liodonai      | Ornith-1.0-35B-GGUF-IQ3_M_liodonai.gguf             |        |       | ❌ 30 t/s          | ❌ An idiot                      |

| 
| Mistral-Small-3.2-24B-Instruct-2506-Q4_K_M.gguf         |              | 18 t/s |    16 k | No  |                                |
| Nemotron-3-Nano-30B-A3B-Q4_K_M.gguf                     | Unsloth      | 16 t/s |    16 k |     |                                |

Not tested yet:

- https://huggingface.co/GestaltLabs/Ornstein3.6-35B-A3B-RYS-SABER-GGUF   

- https://huggingface.co/HauhauCS/Gemma4-26B-A4B-QAT-Uncensored-HauhauCS-Balanced-MTP
  READ INTRUCTION to use MTP properly
       

- https://huggingface.co/chatqaq/Qwen3.6-27B-Claude-Mythos-Distilled-MTP-GGUF

- https://huggingface.co/JZC973/Qwen3.6-35B-REAP-MTP-UD-GGUF-Collection
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
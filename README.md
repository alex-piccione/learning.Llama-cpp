# Learning LLAMA.cpp

Website: https://llama-cpp.com  
Documentation: ???  
GitHub: https://github.com/ggml-org/llama.cpp

## Videos about it



Running a 35B AI Model on 6GB VRAM, FAST (llama.cpp Guide):
https://www.youtube.com/watch?v=8F_5pdcD3HY


llama.cpp just got faster: Qwen 27B on 16GB VRAM (MTP Test)
https://www.youtube.com/watch?v=ROGG36aEkhg


Llama.cpp Just Merged MTP And You Should Be Using It.
https://www.youtube.com/watch?v=hAHFENCe59M


DFlash on GTX 1060: Can Dense AI Models Cheat VRAM Like MoE?
https://www.youtube.com/watch?v=9vY4-Z-tkHs


## Installation

Which version I need to download ?  
Which CUDA version is my graphic card ?
``nvidia-smi`` says 12.6 . 

### Windows
- download both the compoiled binaries zip and the CUDA libraries
- unzip both the folders
- move the binaries folder (containing llama-server.exe, llama-cli.exe) where you want.
- copy hte libraries in hte unzipped CUDA folder in the same folder of llama.cpp
- Add (or update) the PATH variable to point to the folder.

### Ubuntu
[TODO]


## Running

```bash
llama-server 

- -m path to the GGUF file
- --port: 8001
- --no-warmup to avoid the server to pre-load the model with an empty message (to have it available immediately)
- --ctx-size: N * 1024  DEPENDS FROM MODEL
- --n-gpu-layers 999  offload (practically) all possible layers to the GPU


```

### llama-server

https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md


- -c,    --ctx-size N    size of the prompt context (default: 0, 0 = loaded from model)  (env: LLAMA_ARG_CTX_SIZE)
- -n,    --predict, --n-predict N         number of tokens to predict (default: -1, -1 = infinity)  (env: LLAMA_ARG_N_PREDICT)
- -fa,   --flash-attn [on|off|auto]       set Flash Attention use ('on', 'off', or 'auto', default: 'auto')  (env: LLAMA_ARG_FLASH_ATTN)
- -ctk,  --cache-type-k TYPE              KV cache data type for K
                                          allowed values: f32, f16, bf16, q8_0, q4_0, q4_1, iq4_nl, q5_0, q5_1 (default: f16)  (env: LLAMA_ARG_CACHE_TYPE_K)
- -ctv,  --cache-type-v TYPE              KV cache data type for V
                                          allowed values: f32, f16, bf16, q8_0, q4_0, q4_1, iq4_nl, q5_0, q5_1 (default: f16)  (env: LLAMA_ARG_CACHE_TYPE_V)
- -cmoe, --cpu-moe                        keep all Mixture of Experts (MoE) weights in the CPU  (env: LLAMA_ARG_CPU_MOE)
- -ncmoe, --n-cpu-moe N                   keep the Mixture of Experts (MoE) weights of the first N layers in the CPU  (env: LLAMA_ARG_N_CPU_MOE)
- -ngl,  --gpu-layers, --n-gpu-layers N   max. number of layers to store in VRAM, either an exact number, 'auto', or 'all' (default: auto)  (env: LLAMA_ARG_N_GPU_LAYERS)
- -ts,   --tensor-split N0,N1,N2,...      fraction of the model to offload to each GPU, comma-separated list of proportions, e.g. 3,1  (env: LLAMA_ARG_TENSOR_SPLIT)
- -mg,   --main-gpu INDEX                 the GPU to use for the model (with split-mode = none), or for intermediate results and KV (with split-mode = row) (default: 0)  (env: LLAMA_ARG_MAIN_GPU)
- -m,    --model FNAME                    model path to load  (env: LLAMA_ARG_MODEL)
- -mu,   --model-url MODEL_URL            model download url (default: unused)  (env: LLAMA_ARG_MODEL_URL)
- -dr,   --docker-repo [<repo>/]<model>[:quant]  Docker Hub model repository. repo is optional, default to ai/. quant is optional, default to :latest. example: gemma3
                                        (default: unused)  (env: LLAMA_ARG_DOCKER_REPO)
-hf,   -hfr, --hf-repo <user>/<model>[:quant]  Hugging Face model repository; quant is optional, case-insensitive, default to Q4_K_M, or falls back to the first file 
                                          in the  repo if Q4_K_M doesn't exist. mmproj is also downloaded automatically if available. to disable, add --no-mmproj
                                          example: ggml-org/GLM-4.7-Flash-GGUF:Q4_K_M (default: unused)  (env: LLAMA_ARG_HF_REPO)
- -hff,  --hf-file FILE                   Hugging Face model file. If specified, it will override the quant in --hf-repo (default: unused)  (env: LLAMA_ARG_HF_FILE)
- -hfv,  -hfrv, --hf-repo-v <user>/<model>[:quant]  Hugging Face model repository for the vocoder model (default: unused)  (env: LLAMA_ARG_HF_REPO_V)
- -hffv, --hf-file-v FILE                 Hugging Face model file for the vocoder model (default: unused)  (env: LLAMA_ARG_HF_FILE_V)
- -hft,  --hf-token TOKEN                 Hugging Face access token (default: value from HF_TOKEN environment variable)  (env: HF_TOKEN)
- --log-disable                           Log disable
- --log-file FNAME                        Log to file  (env: LLAMA_LOG_FILE)
- --log-colors [on|off|auto]              Set colored logging ('on', 'off', or 'auto', default: 'auto')  'auto' enables colors when output is to a terminal  (env: LLAMA_LOG_COLORS)
- -v,    --verbose, --log-verbose         Set verbosity level to infinity (i.e. log all messages, useful for debugging)
- -lv,   --verbosity, --log-verbosity N   Set the verbosity threshold. Messages with a higher verbosity will be ignored. Values:
                                         - 0: generic output
                                         - 1: error
                                         - 2: warning
                                         - 3: info  (default
                                         - 4: debug

----- sampling params -----

- --samplers SAMPLERS                     samplers that will be used for generation in the order, separated by ';' 
                                        (default: penalties;dry;top_n_sigma;top_k;typ_p;top_p;min_p;xtc;temperature)
- --temp, --temperature N                 temperature (default: 0.80)
- --top-k N                               top-k sampling (default: 40, 0 = disabled)  (env: LLAMA_ARG_TOP_K)
- --top-p N                               top-p sampling (default: 0.95, 1.0 = disabled)
- --min-p N                               min-p sampling (default: 0.05, 0.0 = disabled)
- --top-nsigma, --top-n-sigma N           top-n-sigma sampling (default: -1.00, -1.0 = disabled)
- --xtc-probability N                     xtc probability (default: 0.00, 0.0 = disabled)
- --xtc-threshold N                       xtc threshold (default: 0.10, 1.0 = disabled)
- --typical, --typical-p N                locally typical sampling, parameter p (default: 1.00, 1.0 = disabled)
- --repeat-last-n N                       last n tokens to consider for penalize (default: 64, 0 = disabled, -1 = ctx_size)
- --repeat-penalty N                      penalize repeat sequence of tokens (default: 1.00, 1.0 = disabled)

----- example-specific params -----

- --host HOST                             ip address to listen, or bind to an UNIX socket if the address ends with .sock (default: 127.0.0.1)  (env: LLAMA_ARG_HOST)
- --port PORT                             port to listen (default: 8080)  (env: LLAMA_ARG_PORT)
- --ui-config JSON                        JSON that provides default UI settings (overrides UI defaults)  (env: LLAMA_ARG_UI_CONFIG)
- -ui-config-file PATH                    JSON file that provides default UI settings (overrides UI defaults)  (env: LLAMA_ARG_UI_CONFIG_FILE)
- --ui-mcp-proxy, --no-ui-mcp-proxy       experimental: whether to enable MCP CORS proxy - do not enable in untrusted environments (default: disabled)  
                                          (env: LLAMA_ARG_UI_MCP_PROXY)
- --tools TOOL1,TOOL2,...                 experimental: whether to enable built-in tools for AI agents - do not enable in untrusted environments (default: no tools)
                                        specify "all" to enable all tools available tools: read_file, file_glob_search, grep_search, exec_shell_command, write_file, edit_file, apply_diff, get_datetime  (env: LLAMA_ARG_TOOLS)
- --ui,  --no-ui                          whether to enable the Web UI (default: enabled)  (env: LLAMA_ARG_UI)


## llama-bench

https://github.com/ggml-org/llama.cpp/blob/master/tools/server/README.md

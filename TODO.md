# TODO

## Current


- 3 Correct extraction of DFlash prediction settings
- 3 Test DFlash models

## Backlog

- 5 proxy bridge to start requested model on llama-server
- 5 Test TurboQuant, use the new llama.cpp version and try to use "tbq4_0" cache type

- 3 Test MTP models (it needs to verify llamacpp_run and test_call functions)

- 3 cleanup run_server.sh


- 2 set a task to start Gemma4

- 2 for models wit hs amll training context (40k) use the parameters "--grp-attn-n 8" and "--grp-attn-w 512"

- 1 server_common.sh get_info_from_server_log(), extract more info
- 1 script to extract info from GGUF file (GGUF.md)
- 1 cleanup README
- 1 Removed/commented out error check of JSON response in run_llamacpp function

- prepare Qwen3.6 35B readme for tests
- prepare unsloth_ERNIE-4.5-21B-A3B-Thinking-Q4_K_M readme for tests
- prepare Qwen3.6 27B readme for tests



## Done

- 5 Test for checking if the model can use open-ai tools
- 2 start_server_common.sh  does not behave like the run_server function.
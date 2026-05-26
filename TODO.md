# TODO

## Current

- 5 Quick test for check if the model can use open-ai tools
  - the output od test_call doesn't print model and context !!
  - the output of test_call doesn't print GPU info and LAyers
  - the memory used/free:     nvidia-smi --query-gpu=memory.used,memory.free --format=csv,noheader


## Backlog

- 5 Test TurboQuant, use the new llama.cpp version and try to use "tbq4_0" cache type
- 3 cleanup run_server.sh
- 1 script to extract info from GGUF file (GGUF.md)
- 1 used meory script to get data in desired format. put it in a common script file

- 2 set a task to start Gemma4
- prepare Qwen3.6 35B readme for tests
- prepare unsloth_ERNIE-4.5-21B-A3B-Thinking-Q4_K_M readme for tests
- prepare Qwen3.6 27B readme for tests

- 1 cleanup README

- 1 Removed/commented out error check of JSON response in run_llamacpp function


## Done

- 2 start_server_common.sh  does not behave like the run_server function.
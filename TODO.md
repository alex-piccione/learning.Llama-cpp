# TODO

## Current



## Backlog

- [PAUSED] Test TurboQuant, use the new llama.cpp version and try to use "tbq4_0" cache type
- [PAUSED] Test MTP models (it needs to verify llamacpp_run and test_call functions) (2026.07.24 llama.cpp is bugged and MTP does not work for Gemma 4)

- Removed/commented out error check of JSON response in run_llamacpp function
- Manage server start failing due to error loading the model


## Done

- Cleanup run_server.sh
- Add --reasoning-preserve flag
- Correct the logic to extract speculative info in server_common.sh, maybe it is changed with new version
- Test DFlash models
- Correct extraction of DFlash prediction settings
- Test for checking if the model can use open-ai tools
- start_server_common.sh  does not behave like the run_server function.
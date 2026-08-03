# Qwopus 3.6 27B Coder MTP


source server_common.sh && \
start_server \
    $model \
    $ctx_k \
    $gpu_layers \
    $cpu_moe \
    $spec \
    $draft_model \
    $predict_token \
    $mtp \
    $jinja \
    $batch \
    $ubatch

source test_models_common.sh && print_test_call

```


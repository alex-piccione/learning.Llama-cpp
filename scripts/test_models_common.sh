

# test_model <model> <ctx_k>
test_model() {

    start_llama_server \
        "$model" \
        --ctx-size $((ctx_k * 1024)) \
        --flash-attn

    result=$(llamacpp_run_full "$test_code_file")

    stats=$(llamacpp_stats)

    stop_llama_server

}



json_payload=$(jq -n \
'{
    messages:[
        {
            role:"user",
            content:$code_prompt
        }
    ],
    tools:[
        {
            type:"function",
            function:{
                name:"run_code",
                parameters:{
                    type:"object",
                    properties:{
                        language:{type:"string"},
                        code:{type:"string"}
                    }
                }
            }
        }
    ],
    max_tokens:300,
    temperature:0,
    seed:1234
}')
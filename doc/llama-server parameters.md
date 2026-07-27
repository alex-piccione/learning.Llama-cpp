# llama-server patrameters

To see used parameters for current call: 
``ps -ef | grep llama-server`` 
``ps -ef | grep llama-server | sed 's/ -/\n-/g' | sed 's/^.*\llama-b/"llama-b/' `` (to have on multiple lines)
```text
"D:\Standalone Programs\llama-b10098-bin-win-cuda-12.4-x64\llama-server.exe" --host 127.0.0.1 --port 8001 --parallel 1 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --no-mmap --mlock --draft-p-min 0.7 --log-verbosity 3 --samplers penalties;dry;top_k;top_p;min_p;temperature --temperature 0.1 --top-k 20 --top-p 0.8 --min-p 0.05 --repeat-penalty 1.15 --repeat-last-n 1024 --context-shift --reasoning-preserve --model L:\GGUF/Gemma-4-26B_Q4_0-it_google.gguf --alias Gemma-4-26B-Q4_0_(Google)_64k --ctx-size 65536 --n-gpu-layers -1 --n-cpu-moe 1 --batch-size 1024 --ubatch-size 256 --spec-type none --spec-draft-n-max 3 --spec-draft-n-min 1 --spec-draft-type-k q8_0 --spec-draft-type-v q8_0``
```


## Analyze new poarameters

Source: https://www.reddit.com/r/LocalLLaMA/comments/1smlvni/qwen3535b_running_well_on_rtx4060_ti_16gb_at_60/

[qwen3.5-35b-64k]  
model = Qwen3.5-35B-A3B-UD-Q4_K_L.gguf
✔️ ctx-size = 65536 
 ❗ threads = 6
 ❗ threads-batch = 8
✔️ n-cpu-moe = 11
✔️ batch-size = 1024
 ❗ ubatch-size = 512
 ❗ parallel = 2
❔ kv-unified = true
;also from defaults
✔️ ngl = 99
✔️ fa = on
✔️ ctk = q8_0
✔️ ctv = q8_0
❔ prio = 3
 ❗ jinja = true
✔️ mlock = true
 ❗ reasoning = off

✔️: Same vas me 
 ❗: I use a different value  
❔: What is this ??


I have a i7-3770S with 64GB RAM.
MSI 4060 Ti 16GB on PCIex slot B (it doesn't work on slot A), NO display attached (I use iGPU for them).
MSI afterburner with flat mV curve set at some value (undervolt).


`threads` and `threads-batch`  
We have 4 phisical cores, I leave thread working itself... and it will use a value of 4.  
Same for threads-batch, when I researched what values to use I got to the conclusion llama-cpp knows what to do.  
`ubatch-size`: I have betetr result with 256
`parallel` : llama.cpp is not really for multiple user (I'll use vLLM in case I need) so why more than 1 ?
`ngl` I use -1 recently
`jinja` It is not needed for this model, why you set it ?
`reasoning` Maybe I loose speed but in Pi I need to know why it did what it did (especially when is a mistake).


I will research what are `kv-unified` and  `prio`.  
   
##
Here my tests of this model: 


## Here my call of llama-server (for coding):
```sh

"llama-b10098-bin-win-cuda-12.4-x64\llama-server.exe" # I'll update often

# common parameters
--host 127.0.0.1
--port 8001
--parallel 1
--flash-attn on
--cache-type-k q8_0
--cache-type-v q8_0
--no-mmap
--mlock
--draft-p-min 0.7
--log-verbosity 3
--samplers penalties;dry;top_k;top_p;min_p;temperature  # ! exact order is really important !
--temperature 0.1
--top-k 20
--top-p 0.8
--min-p 0.05
--repeat-penalty 1.15
--repeat-last-n 1024
--context-shift
--reasoning-preserve

# specific model parameters
--model L:\GGUF/Gemma-4-26B_Q4_0-it_google.gguf
--alias Gemma-4-26B-Q4_0_(Google)_64k
--ctx-size 65536
--n-gpu-layers -1
--n-cpu-moe 1
--batch-size 1024
--ubatch-size 256
--spec-type none
--spec-draft-n-max 3  # not used when spec-type is none
--spec-draft-n-min 1  # not used when spec-type is none
--spec-draft-type-k q8_0  # not used when spec-type is none
--spec-draft-type-v q8_0  # not used when spec-type is none
```
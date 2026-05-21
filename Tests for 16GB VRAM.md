# Tests for 16GB VRAM


| Model                                                        |〰️| Size  | Ctx   | GPU   | Tk/s | Time  |🔨|Pi| Note                                     
| Qwen3.5-9B-Q4_K_M.gguf                                       |✔️| ?     |   8 k |   ? % |   42 |  18 s |✔️|〰️|                                          |  <-- strem: false
| Qwen3.5-9B-Q4_K_M.gguf                                       |✔️| ?     |   8 k | 100 % |   38 |   0 s |✔️|〰️|                                          |  <-- strem: true
draft_model Qwen3.5:2B_Q4_K_M
| Qwen3.5-9B-Q4_K_M.gguf                                       |✔️| ?     |   8 k | 100 % |   94 |   0 s |✔️|〰️|                                          |
draft_model Qwen3.5-0.8B-Base-Q4_0.gguf
| Qwen3.5-9B-Q4_K_M.gguf                                       |✔️| ?     |   8 k | 100 % |  126 |   0 s |✔️|〰️|                                          |

## Different paramaters

--cache-type-k q8_0
--cache-type-v q8_0
--spec-type  draft-simple...
Model: "Qwen3.5-9B-Q4_K_M.gguf"
before:
after:   42 tkm/s




generation: xx tok/s
accepted draft tokens: xx%
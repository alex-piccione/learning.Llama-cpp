# Tests for 16GB VRAM


| Model                                                        |〰️| Size  | Ctx  | GPU  | Tk/s | Time  |🔨|Pi| Note                                     |
| Qwen3.5-9B-Q4_K_M.gguf                                       |✔️| ?          |   8 k |   ? % |   42 |  18 s |✔️|〰️|                                          |



## Difefrent paramaters

--cache-type-k q8_0
--cache-type-v q8_0

Model: "Qwen3.5-9B-Q4_K_M.gguf"
before:
after:   42 tkm/s
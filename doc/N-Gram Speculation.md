# N-Gram speculation

## The Myth
Many users assume that enabling --spec-type ngram-simple will universally accelerate LLM inference by "guessing" future tokens based on past context.  
The expectation is a linear speedup proportional to the draft acceptance rate.


## The Reality
**N-gram speculation is fundamentally ineffective for code generation, planning, and creative writing tasks.**

Unlike natural language, which contains frequent repetitive phrases (e.g., "in the", "of the"), code is unique. When an LLM generates a script, function, or logic flow, it is creating novel sequences that have never existed before.


## Why It Fails
N-gram speculation relies on exact string matching:
- The Mechanism: The algorithm looks back N tokens in the history to find an exact match for the current sequence. If found, it predicts the next M tokens based on that match.  
- The Failure Point: In a coding task, the probability of finding an exact 10-token sequence (e.g., if (x > 5) { return true; }) that repeats verbatim in the immediate history is near zero.  
- The Result:  
  + 0 Matches: The algorithm checks thousands of times and finds nothing. Overhead is incurred with zero gain.  
  + Low Acceptance: If N is lowered to find any match (e.g., N=2), the predictions are often generic boilerplate (e.g., import os) that the main model rejects because it doesn't fit the specific logic. This leads to low acceptance rates (<30%), causing the verifier to waste compute on rejected tokens.


## Benchmark Evidence (RTX 4060 Ti, GLM-4.7-23B)
Our tests on unsloth_GLM-4.7-Flash-REAP-23B-A3B-UD-Q4_K_XL.gguf revealed:

| Configuration	| size_n / size_m |	Draft Matches |	Acceptance Rate	| Throughput | Verdict |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Baseline | N/A | N/A | N/A | 35.4 t/s | Optimal |
| Aggressive | 10 / 6 |	0 (out of 1037 calls) |	N/A | 35.4 t/s | Wasted Overhead |
| Lenient | 6 / 10 | 10 (out of 832 calls) | 25% | 33.2 t/s | Slower (-6%) |

- Observation 1: With size_n=10, the algorithm found zero matches in the entire generation process. The draft_n field was omitted from logs because no speculation occurred.
- Observation 2: With size_n=6, matches were found, but the 25% acceptance rate meant 75% of the speculative work was wasted. The net result was a drop in throughput.


## Conclusion & Recommendation

Do not use ngram-simple for code generation agents.  
  
- **For Unique Tasks** (Coding, Planning, Reasoning): Disable N-gram speculation. The overhead of checking for non-existent patterns slows down the model.
- **For Repetitive Tasks** (Boilerplate, Loops, JSON): N-gram might help if the output is highly repetitive, but gains are marginal.
- **Alternative**: If you require speculative speedups for code, use a Neural Draft Model (--spec-type draft-simple) or MTP (--spec-type draft-mtp), which predict based on probabilities rather than exact string matches.

**Recommended Config for Coding Agents:**
```
spec=0
# OR
draft_model=none
mtp=0
```
Trust the baseline speed. N-gram speculation is a trap for unique text generation.
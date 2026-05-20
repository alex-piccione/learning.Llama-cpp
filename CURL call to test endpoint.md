# CURL call to test endpoint


## OpenAI-compatible endpoint

```
curl -s http://localhost:8001/v1/chat/completions -H "Content-Type: application/json" -d '{"model":"Qwen3.5-9B-Q4_K_M","messages":[{"role":"user","content":"Hello"}],"stream":false}'
```

```bash
# OpenAI-compatible path
BASE_URL=http://localhost:8001/v1/chat/completions

API_KEY=NOT_REQUIRED
MODEL=Qwen3.5-9B-Q4_K_M

PAYLOAD=$(cat <<EOF
{
  "model": "$MODEL",
  "messages": [
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": "Say hello in exactly 3 words."}
  ],
  "temperature": 0.7,
  "max_tokens": 50,
  "stream": false
}
EOF
)

curl -X POST "$BASE_URL" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d "$PAYLOAD"
```


## Anthropic-compatible endpoint



## Gemini-compatible endpoint
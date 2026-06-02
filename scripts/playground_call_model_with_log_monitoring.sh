

# 2. Query the endpoint with continuous server log monitoring
    local min_speed="15.0"
    local server_log="logs/llama_server.log" # Update this to your actual server log path
    local tmp_raw="logs/tmp_curl_raw.json"
    
    # Capture current log line count so we only check new lines from this run
    local initial_lines=$(wc -l < "$server_log" 2>/dev/null || echo 0)

    # Launch curl in the background to safely capture its PID
    curl -s http://localhost:$SERVER_PORT/v1/chat/completions -d "$json_payload" > "$tmp_raw" &
    local curl_pid=$!

    # Active monitoring loop: runs as long as curl is active
    while kill -0 "$curl_pid" 2>/dev/null; do
        # Extract the latest 'tg =' value printed since this test started
        local speed=$(tail -n +"$((initial_lines + 1))" "$server_log" 2>/dev/null | grep "I slot print_timing" | grep "tg =" | tail -n 1 | sed -n 's/.*tg = *\([0-9.]*\).*/\1/p')

        if [[ -n "$speed" ]]; then
            # Compare decimal speed with your threshold using bc
            if (( $(echo "$speed < $min_speed" | bc -l) )); then
                echo "❌ ERROR: Live speed ($speed t/s) fell below threshold of $min_speed t/s. Killing process!" >&2
                kill "$curl_pid" 2>/dev/null
                rm -f "$tmp_raw"
                printf "error=Speed_too_low\n"
                return 1
            fi
        fi
        sleep 0.5 # Polling frequency
    done

    # Finalize background process and read the response back into $raw
    wait "$curl_pid" 2>/dev/null
    local raw=$(cat "$tmp_raw" 2>/dev/null)
    rm -f "$tmp_raw"

    if [ -z "$raw" ]; then
        echo "❌ ERROR: Request failed or was aborted due to slow inference." >&2
        return 1
    fi

    # UNCOMMENT THE LINE BELOW TO INSPECT API RAW OUTPUT IN TERMINAL:
    #echo "DEBUG RAW OUTPUT: $raw" >&2
    echo "$raw" > logs/llama_api_response.log

    # Robust space-insensitive streaming line cleaner
    local json_stream=$(echo "$raw" | sed -n 's/^data: *{/{/p')
    if [ -z "$json_stream" ]; then
        echo "❌ ERROR: json_stream is empty from API response" >&2
        printf "error=Failed_to_read_json_stream\n"
        return 1
    fi
## source "scripts.sh"

GGUF_FOLDER="V:\GGUF"
LLAMA_BINS_FOLDER="D:\Standalone Programs\llama-b9251-bin-win-cuda-12.4-x64"  # b9251 CUDA
SERVER_PORT=8001


# $'' makes the inteprets to be done at assignation time, so it doesn't require "-e" whan used in echo command
yellow=$'\033[33m'
gray_light=$'\033[37m'
gray=$'\033[90m'
white=$'\033[97m'
blue=$'\033[0;34m'
reset=$'\033[0m'


###############################
###        Utilities        ###
###############################

# print_key_value "AAA" 123
print_value() {
    printf '%s%-20s : %s%s%s\n' \
        "$gray_light" "$1" "$yellow" "$2" "$reset" >&2
}

from_nano() {
    # echo $(echo "scale=9; $1 / 1000000000" | bc)  ## requires bc          
    local seconds=$(($1/ 1000000000))
    local nanoseconds=$(($1 % 1000000000))
    printf "%.9f\n" $((seconds)).$(printf "%09d" $((nanoseconds)))
}

# returns seconds (float) from milliseconds
from_ms() {
    awk -v ms="$1" 'BEGIN { printf "%.3f\n", ms / 1000 }'
}

# float_div 100.1 1.23 6
float_div_bak() {
    local a="$1"
    local b="$2"
    local scale="${3:-6}"

    if [[ -z "$a" || -z "$b" ]]; then
        echo "ERROR: float_div requires 2 numbers" >&2
        return 1
    fi

    if [[ "$b" == "0" || "$b" == "0.0" ]]; then
        echo "ERROR: float_div division by zero" >&2
        return 1
    fi

    awk -v a="$a" -v b="$b" -v scale="$scale" 'BEGIN {
        printf "%.*f\n", scale, a / b
    }'
}

# float_div 100.1 1.23 6
float_div() {
    awk -v a="$1" -v b="$2" -v scale="${3:-6}" 'BEGIN {
        if (b == 0) exit 1
        printf "%.*f\n", scale, a / b
    }'
}


# https://antofthy.gitlab.io/info/ascii/Spinners.txt
run_with_spinner() {
    local label="$1"
    shift

    local tmp_out tmp_err pid status
    tmp_out=$(mktemp) || return 1
    tmp_err=$(mktemp) || { rm -f "$tmp_out"; return 1; }

    cleanup() {
        printf '\033[?25h' >&2
        printf '\r\033[0m\033[K' >&2
    }

    trap 'cleanup; rm -f "$tmp_out" "$tmp_err"; trap - INT; return 130' INT

    "$@" >"$tmp_out" 2>"$tmp_err" &
    pid=$!

    local frames="⠁⠂⠄⡀⡈⡐⡠⣀⣁⣂⣄⣌⣔⣤⣥⣦⣮⣶⣷⣿⡿⠿⢟⠟⡛⠛⠫⢋⠋⠍⡉⠉⠑⠡⢁"    
    local i=0
    local l=${#frames}

    printf '\033[?25l' >&2

    while kill -0 "$pid" 2>/dev/null; do
        i=$(( (i + 1) % l ))
        printf '\r%s%s%s %s%s%s' \
            "$yellow" "${frames:i:1}" "$reset" \
            "$gray" "$label" "$reset" >&2
        sleep 0.1
    done

    wait "$pid"
    status=$?

    cleanup

    cat "$tmp_err" >&2
    cat "$tmp_out"

    rm -f "$tmp_out" "$tmp_err"
    trap - INT

    return "$status"
}


## source "scripts.sh"

## ASCII codes ref: https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences

source debug.sh

GGUF_FOLDER="L:\GGUF"
#LLAMA_BINS_FOLDER="D:\Standalone Programs\llama-b9251-bin-win-cuda-12.4-x64"  # b9251 CUDA
LLAMA_BINS_FOLDER="D:\Standalone Programs\llama-b9371-bin-win-cuda-12.4-x64"  # b9371 CUDA
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

return_value() {
    printf '%s=%s\n' "$1" "$2"
}


# get_output_values "$(my_function)" [1]]
declare_output_values() {
    debug_function "get_output_values"    
    local values="$1"
    local print="${2:-false}"
    #debug "values from '$values'"

    local key value    
    while IFS='=' read -r key value; do
        if [[ -z "$value" ]]; then
            echo "❌ ERROR: the value for \"$key\" is empty." >&2
            printf "error=the value for key \"${key}\" is empty\n"
            return 1
        fi

        # declare global (to make it visible in the caller function scope)
        declare -g "$key=$value"
            
        if [[ -n "${error:-}" ]]; then
            echo "❌ ERROR: $error" >&2
            #printf "error=%s\n" "$error"
            return 1
        fi

        if [[ "$print" = "1" ]]; then
            print_value "$key" "$value"
        fi

    done < <(printf '%s\n' "$values")
}


# return_output_values "$(my_function)" [1]
return_output_values() {
    debug_function "return_output_values"    
    local values="$1"
    local print="${2:-false}"
    #debug "values from '$values'"

    local key value    
    while IFS='=' read -r key value; do
        if [[ -z "$value" ]]; then
            echo "❌ ERROR: the value for \"$key\" is empty." >&2
            printf "error=the value for key \"${key}\" is empty\n"
            return 1
        fi

        declare "$key=$value"

        # check if it returned an error
        if [[ -n "${error:-}" ]]; then
            echo "❌ ERROR: $error" >&2
            #printf "error=%s\n" "$error"
            return 1
        fi

        return_value "$key" "$value"

        if [[ "$print" = "1" ]]; then
            print_value "$key" "$value"
        fi

    done < <(printf '%s\n' "$values")
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
float_div() {
    awk -v a="$1" -v b="$2" -v scale="${3:-6}" 'BEGIN {
        if (b == 0) exit 1
        printf "%.*f\n", scale, a / b
    }'
}


get_memory_info() {
    #  16380 MiB, 15717 MiB, 393 MiB
    # Read the output directly into variables
    # We use sed to remove "MiB" and spaces, then set IFS to comma
    IFS=',' read -r total used free < <(nvidia-smi --query-gpu=memory.total,memory.used,memory.free --format=csv,noheader | sed 's/ MiB//g; s/ //g')

    return_value "total" "$total"
    return_value "used" "$used"
    return_value "free" "$free"
}

# get_VRAM_ratio h=1 means human readable
get_VRAM_ratio() {
    debug_function "get_VRAM_ratio"
    # We use eval to populate the variables 'total' and 'used' in the subshell
    # eval "$(get_memory_info | grep -E 'total|used')"
    eval "$(get_memory_info)"

    # Calculate ratio using awk
    awk -v t="$total" -v u="$used" 'BEGIN { printf "%.4f", u / t }'
}

get_readable_VRAM_usage() {
    debug_function "get_readable_VRAM_usage"
    # Get current memory stats
    eval "$(get_memory_info)"

    # Convert to GiB (scale 1 for "14.5" format)
    local used_gib=$(float_div "$used" 1024 1)
    local total_gib=$(float_div "$total" 1024 1)

    printf "%s/%s" "$used_gib" "$total_gib"
}


### return used/total
print_used_VRAM_ratio() {
    debug_function "print_used_VRAM_ratio"
    echo "#f print_used_VRAM_ratio)" >&2
    local data=get_memory_info

    return_value ""
}


# returns 1 if any of the argument is 1, 0 otherwise
flag_or() {
    local val=0
    for arg in "$@"; do
        [[ "$arg" == "1" ]] && val=1 && break
    done
    echo "$val"
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


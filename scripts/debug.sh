DEBUG=0

## ref: https://gist.github.com/JBlond/2fea43a3049b38287e5e9cefc87b2124

debug=$'\033[48;5;240m'
debug_reset=$'\033[0m'

debug() {
    if [ "$DEBUG" -eq "1" ]; then
        printf " $debug[$1]$debug_reset \n" >&2
    fi 
}

debug_function() { 
    debug  "$1()"
}
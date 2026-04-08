# Custom Functions

# fzf directory stack
zz() {
    local dir_entry
    local dir_path

    dir_entry=$(dirs -v | sed -E '/^0[[:space:]]/d' | fzf --height=10 --reverse)

    if [[ -z "$dir_entry" ]]; then
        return 1
    fi

    dir_path=$(echo "$dir_entry" | sed -E 's/^[0-9]+\s+//')

    if [[ -n "$dir_path" ]]; then
        dir_path=$(eval echo "$dir_path")
        cd "$dir_path" || { echo "Error: Failed to change directory to '$dir_path'." >&2; return 1; }
    else
        echo "Error: Could not extract a valid directory path from fzf selection. Raw entry: '$dir_entry'" >&2
        return 1
    fi
}

# Thanks: https://yazi-rs.github.io/docs/quick-start
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

gg() {
    local url=$1
    if [[ -z "$url" ]]; then
        echo "Usage: gg <github-url>"
        return 1
    fi
    local repo_url=$(echo "$url" | sed -E 's|(https://github\.com/[^/]+/[^/]+).*|\1|')
    ghq get "$repo_url"
}


wcx() {
    local total_l=0 total_w=0 total_m=0 total_c=0
    
    printf "%10s %10s %10s %10s  %s\n" "Lines" "Words" "Chars" "Bytes" "Target"
    echo "----------------------------------------------------------------------"

    _do_wc() {
        local input_file="$1"
        local res

        if [[ -z "$input_file" ]]; then
            res=$(wc -l -w -m -c)
        else
            res=$(wc -l -w -m -c "$input_file" 2>/dev/null)
        fi

        [[ -z "$res" ]] && return

        local stats=($(echo $res))
        local l=${stats[1]}
        local w=${stats[2]}
        local m=${stats[3]}
        local c=${stats[4]}
        local label=${stats[5]:--}

        printf "%10d %10d %10d %10d  %s\n" $l $w $m $c "$label"
        
        total_l=$((total_l + l))
        total_w=$((total_w + w))
        total_m=$((total_m + m))
        total_c=$((total_c + c))
    }

    if [ -t 0 ]; then
        [[ $# -eq 0 ]] && { echo "Usage: wcx [file ...]"; return; }
        for f in "$@"; do _do_wc "$f"; done
        
        if [ $# -gt 1 ]; then
            echo "----------------------------------------------------------------------"
            printf "\e[1;32m%10d %10d %10d %10d  %s\e[m\n" $total_l $total_w $total_m $total_c "TOTAL"
        fi
    else
        _do_wc
    fi
}

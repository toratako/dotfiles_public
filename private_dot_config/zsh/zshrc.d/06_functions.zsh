# Custom Functions

# fzfing directory stack
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

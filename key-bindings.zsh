bindkey -v

if [[ "${terminfo[khome]}" != "" ]]; then
    bindkey "${terminfo[khome]}" beginning-of-line # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
    bindkey "${terminfo[kend]}" end-of-line # [End] - Go to end of line
fi

if [[ "${terminfo[kcbt]}" != "" ]]; then
    bindkey "${terminfo[kcbt]}" reverse-menu-complete # [Shift-Tab] - move through the completion menu backwards
fi

bindkey ' ' magic-space # [Space] - do history expansion
bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word

# Make vi mode behave sanely
bindkey '^?' backward-delete-char
bindkey '^W' backward-kill-word
bindkey '^H' backward-delete-char      # Control-h also deletes the previous char
bindkey '^U' backward-kill-line

bindkey '^R' history-incremental-search-backward

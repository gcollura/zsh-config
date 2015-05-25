# get the node.js version
function nvm_prompt_info() {
    [ -f "$HOME/.nvm/nvm.sh" ] || return
    [ -f "$PWD/package.json" ] || return
    local nvm_prompt
    nvm_prompt=$(node -v 2>/dev/null)
    [[ "${nvm_prompt}x" == "x" ]] && return
    nvm_prompt=${nvm_prompt:1}
    echo "${ZSH_THEME_NVM_PROMPT_PREFIX}${nvm_prompt}${ZSH_THEME_NVM_PROMPT_SUFFIX}"
}

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"

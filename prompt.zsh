# Yay! High voltage and arrows!
# get the name of the branch we are on

setopt prompt_subst # Allow for functions in the prompt

ZSH_VIM_MODE=true
if [ "$ZSH_VIM_MODE" = "true" ] ; then
    # bindkey -v      # vi mode
    vim_ins_mode="%{$fg[green]%}I%{$reset_color%}"
    vim_cmd_mode="%{$fg[blue]%}N%{$reset_color%}"
    vim_mode=$vim_ins_mode
else
    vim_mode=""
fi

function zle-keymap-select {
    vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
    vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local ret_status="%(?:%{$fg[white]%}→ :%{$fg[red]%}→ %s)"

PROMPT='%{$fg[blue]%}%~%{$reset_color%}% $(git_prompt_info)%{$fg[cyan]%}%{$reset_color%} $vim_mode ${ret_status}%{$reset_colors%} '

RPROMPT='%{$fg[red]%}$(nvm_prompt_info)%{$reset_color%}'

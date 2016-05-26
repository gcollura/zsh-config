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

function zle-keymap-select zle-line-init {
    # change cursor shape in urxvt
    case $KEYMAP in
        vicmd)      print -n -- "\033[2 q";;  # block cursor
        viins|main) print -n -- "\033[5 q";;  # line blinking cursor
    esac

    vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    zle reset-prompt
    zle -R
}
zle -N zle-keymap-select
zle -N zle-keymap-init

function zle-line-finish {
    print -n -- "\033[2 q"  # block cursor
    vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_NVM_PROMPT_PREFIX="%{$reset_color%}%{$fg[red]%}"
ZSH_THEME_NVM_PROMPT_SUFFIX="%{$reset_color%}"

local ret_status="%(?:%{$fg[white]%}:%{$fg[red]%})➤ "

PROMPT='%{$fg[blue]%}%~%{$reset_color%}% $(git_prompt_info)%{$fg[cyan]%}%{$reset_color%} ${ret_status}%{$reset_color%}'

RPROMPT='$(nvm_prompt_info)'

# put plugin configurations here
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_ITERM2=false
# sometimes TMPDIR is set to a certain value, so disable this
unset TMPDIR

source $ZSH/plugins/git.zsh
source $ZSH/plugins/nvm.zsh
if hash bower >& /dev/null ; then
    source $ZSH/plugins/bower.zsh
fi
source $ZSH/plugins/history-substring-search.zsh
if hash tmux >& /dev/null ; then
    source $ZSH/plugins/tmux.zsh
fi
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $ZSH/plugins/safe-paste.zsh

BASE16_SHELL="$ZSH/plugins/base16-shell/base16-one.dark.sh"
[[ -s $BASE16_SHELL ]] && [[ -z "$TMUX" ]] && source $BASE16_SHELL

fpath=($ZSH/plugins/completions $fpath)

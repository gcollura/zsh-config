# put plugin configurations here
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_ITERM2=false
# sometimes TMPDIR is set to a certain value, so disable this
unset TMPDIR

fpath=($ZSH/plugins/completions $fpath)

source $ZSH/plugins/git.zsh
source $ZSH/plugins/nvm.zsh
source $ZSH/plugins/history-substring-search.zsh
if type "tmux" > /dev/null ; then
    source $ZSH/plugins/tmux.zsh
fi
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
BASE16_SHELL="$ZSH/plugins/base16-shell/base16-monokai.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

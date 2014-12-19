# put plugin configurations here
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_ITERM2=false
# sometimes TMPDIR is set to a certain value, so disable this
unset TMPDIR

source $ZSH/plugins/git.zsh
source $ZSH/plugins/history-substring-search.zsh
source $ZSH/plugins/tmux.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

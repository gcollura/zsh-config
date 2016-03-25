autoload colors; colors;
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty --group-directories-first' || alias ls='ls -G'
setopt prompt_subst

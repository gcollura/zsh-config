##
# Completion
##
autoload -U compinit; compinit
zmodload -i zsh/complist
setopt menu_complete 		# select the first entry
unsetopt flowcontrol
setopt alwayslastprompt
setopt hash_list_all            # hash everything before completion
setopt completealiases          # complete alisases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt list_types
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.
setopt autocd cdablevars
unlimit

zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion::complete:*' rehash true
zstyle ':completion:*' cache-path ~/.zsh/cache              # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use
zstyle ':completion:*:functions' ignored-patterns '_*'

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B---- %d%b'
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d ---'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:warnings' format 'Too bad there is nothing'
zstyle ':completion:*' group-name ''

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
users=(random root)           # because I don't care about others
zstyle ':completion:*' users $users

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

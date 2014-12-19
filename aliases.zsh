# List direcory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias mdstat='cat /proc/mdstat'
alias ...='cd ../../'
alias ....='cd ../../../'

# be more human
alias df='df -h'
alias free='free -h'

alias zshrc="$EDITOR ~/.zsh/zshrc" # Quick access to the ~/.zshrc file

#Show progress while file is copying
# Rsync options are:
# -p - preserve permissions
# -o - preserve owner
# -g - preserve group
# -h - output in human-readable format
# --progress - display progress
# -b - instead of just overwriting an existing file, save the original
# --backup-dir=/tmp/rsync - move backup copies to "/tmp/rsync"
# -e /dev/null - only work on local files
# -- - everything after this is an argument, even if it looks like an option
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

# Add an "alert" alias for long running commands. Use like so:
# $ sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Programming
alias cmake='cmake -DCMAKE_INSTALL_PREFIX=/usr'
alias make='make -j6'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'

# System info
alias cpuu="ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed '/^ 0.0 /d'"
alias memu='ps -e -o rss=,args= | sort -b -k1,1n | pr -TW$COLUMNS'
alias pg='ps aux | grep'  #requires an argument
# alias sensors='sensors && aticonfig --od-gettemperature'
# What's gobbling the memory?
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'

# Misc
alias todo="python ~/.scripts/todo.py"
alias xbox-controller="sudo xboxdrv -s --controller-slot"
alias :q="exit"
alias ccat='pygmentize -O bg=dark'
alias glog='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

function take () {
    mkdir -p $1
    cd $1
}
#
# Get the value of an alias.
#
# Arguments:
# 1. alias - The alias to get its value from
# STDOUT:
# The value of alias $1 (if it has one).
# Return value:
# 0 if the alias was found,
# 1 if it does not exist
#
function alias_value () {
    alias "$1" | sed "s/^$1='\(.*\)'$/\1/"
    test $(alias "$1")
}

# Get ubuntu daily release
function get-daily () {
    if type zsync > /dev/null ; then
        echo "zsyncing $1..."
        zsync "http://cdimage.ubuntu.com/daily-live/current/$1-desktop-amd64.iso.zsync"
    fi
    if [[ -n $1 ]]; then
        echo "wgetting $1..."
        wget -c "http://cdimage.ubuntu.com/daily-live/current/$1-desktop-amd64.iso"
    else
        echo "Please insert a development release name"
    fi
}

function compile () {
    local compiler
    if [[ $1 == 'c' ]]; then
        compiler="clang"
    elif [[ $1 == 'cpp' ]]; then
        compiler="clang++ --std=c++11"
    else
        echo "Input a source type. Available: c cpp"
        return
    fi
    if [[ -n $2 ]]; then
        for file in $2/*.$1; do
            echo "Compiling source file: $file"
            eval $($compiler $file -o ${file:t:r})
            echo "Done."
        done
    else
        echo "Arg 2: give a working directory"
    fi
}

function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# ssh wrapper that rename current tmux window to the hostname of the
# remote host.
function ssh () {
    # Do nothing if we are not inside tmux or ssh is called without arguments
    if [[ $# == 0 || -z $TMUX ]]; then
        command ssh $@
        return
    fi
    # The hostname is the last parameter (i.e. ${(P)#})
    local remote=${${(P)#}%.*}
    local old_name="$(tmux display-message -p '#W')"
    local renamed=0
    # Save the current name
    if [[ $remote != -* ]]; then
        renamed=1
        tmux rename-window $remote
    fi
    command ssh $@
    if [[ $renamed == 1 ]]; then
        tmux rename-window "$old_name"
    fi
}

# Tmux
function trw () {
    if [[ -z $TMUX ]]; then
        return
    fi
    local window=`basename $PWD`
    if [[ -n $1 ]]; then
        window="$1"
    fi
    tmux rename-window "$window"
}

function sensors () {
    # alias sensors='sensors && aticonfig --od-gettemperature'
    command sensors
    if type aticonfig > /dev/null ; then
        command aticonfig --od-gettemperature
    fi
}

function cd () {
    # cd /etc/fstab
    if [[ -f ${1} ]]; then
        [[ ! -e ${1:h} ]] && return 1
        print "Correcting ${1} to ${1:h}"
        builtin cd ${1:h}
    else
        builtin cd ${1}
    fi
}

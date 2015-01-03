# Path to zsh configurations
if [ -n "$ZSH" ] ; then
    ZSH=$HOME/.zsh
fi

autoload -U zsh-mime-setup
zsh-mime-setup

##
# History
##
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=1024                   # big history
SAVEHIST=1024                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword

##
# Directory Stack
##
DIRSTACKSIZE=8                  # limit size of the stack
setopt autopushd                # change behavior of 'cd' to 'pushd'
setopt pushdsilent              # disable messages when push directories
setopt pushdminus               # because - is easier to type than +
setopt pushdignoredups          # ignore dupes
setopt pushdtohome              # pushd behaves like 'pushd $HOME'

##
# Various
##
setopt auto_cd                  # if command is a path, cd into it
setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
unsetopt print_exit_value         # print return value if non-zero
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
unsetopt clobber                # must use >| to truncate existing files
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'
if type setxkbmap > /dev/null && [[ -z "$DISPLAY" ]]; then
    setxkbmap -option compose:ralt  # compose-key
fi

function set_title() {
    print -Pn "\e]0;%n@%M: %~\a"    # terminal title
}
chpwd_functions=(set_title)
set_title()

# Uses the command-not-found package zsh support
# as seen in http://www.porcheron.info/command-not-found-for-zsh/
# this is installed in Ubuntu
[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
# Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

# Customize to your needs...
export EDITOR='vim'

# Android
export ANDROID_HOME=$HOME/.android/sdk
export ANDROID_SDK_ROOT=$HOME/.android/sdk
export ANDROID_NDK=$HOME/.android/ndk
export ANDROID_NDK_ROOT=$HOME/.android/ndk
export ANDROID_NDK_HOST=linux-x86_64

# Java
export ECLIPSE_HOME=/opt/eclipse

export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.local/bin
export PATH=$PATH:$ANDROID_HOME/tools

DIRCOLORS=$HOME/.dircolors.luna
if [[ -f $DIRCOLORS ]]; then
    eval $(dircolors -b $HOME/.dircolors.luna)
fi

# Load modules
source $ZSH/key-bindings.zsh
source $ZSH/plugins.zsh
source $ZSH/colors.zsh
source $ZSH/functions.zsh
source $ZSH/prompt.zsh
source $ZSH/aliases.zsh
source $ZSH/completion.zsh

# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file
##############################################################
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
 set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
 shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"
#
# History saved numbers
export HISTSIZE=5000
export HISTFILESIZE=5000

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# show-control-chars for zh-CN display

# LS_COLORS='di=32:fi=4:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
# export LS_COLORS
alias ls='ls -F --show-control-chars --color'

# classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #
#
# change the display color for ls
#
# eval $(dircolors -b /etc/DIR_COLORS)
# eval $(dircolors -b ~/.dircolors)
##############################################################
# A function to pipe any command to less:
function so {
  eval "$@" |less -I
}
#
# set a nice looking prompt: (comment because of /etc/profile, for both login and non-login mode)
# PS1='\u@\h:\W\$ '
# PS1="\n\[\e[30;1m\]\[\016\]l\[\017\](\[\e[34;1m\]\u@\h\[\e[30;1m\])-(\[\e[34;1m\]\j\[\e[30;1m\])-(\[\e[34;1m\]\@ \d\[\e[30;1m\])->\[\e[30;1m\]\n\[\016\]m\[\017\]-(\[\[\e[32;1m\]\w\[\e[30;1m\])-(\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[30;1m\])--> \[\e[0m\]"
# PS1="\[\e[1;32m\]\u@\H:\[\e[m\] \[\e[1;37m\]\w/\[\033[1;36m\]      \@ \d    \[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep total | /bin/sed 's/total //')b\[\e[m\]\n\[\e[1;33m\]hist:\! \[\e[0;33m\] \[\e[1;31m\]jobs:\j \$\[\e[m\] "
# PS1="\[\e[1;37m\]\w: "

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle ()
# {
#   echo -ne "\e]2;$@\a\e]1;$@\a";
# }
#
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
#
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
#
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
#
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
#
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
#
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
#
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
#
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
#
#   return 0
# }
#
# alias cd=cd_func
#############################################################
# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# For example, I see 'Bold Red' as 'orange' on my screen,
# hence the 'Green' 'BRed' 'Red' sequence I often use in my prompt.
#############################################################

# Normal Colors
#Black="\e[0;30m"        # Black
#Red="\e[0;31m"          # Red
#Green="\e[0;32m"        # Green
#Yellow="\e[0;33m"       # Yellow
#Blue="\e[0;34m"         # Blue
#Purple="\e[0;35m"       # Purple
#Cyan="\e[0;36m"         # Cyan
#White="\e[0;37m"        # White

# Bold
#BBlack="\e[1;30m"       # Black
#BRed="\e[1;31m"         # Red
#BGreen="\e[1;32m"       # Green
#BYellow="\e[1;33m"      # Yellow
#BBlue="\e[1;34m"        # Blue
#BPurple="\e[1;35m"      # Purple
#BCyan="\e[1;36m"        # Cyan
#BWhite="\e[1;37m"       # White

# Background
#On_Black="\e[40m"       # Black
#On_Red="\e[41m"         # Red
#On_Green="\e[42m"       # Green
#On_Yellow="\e[43m"      # Yellow
#On_Blue="\e[44m"        # Blue
#On_Purple="\e[45m"      # Purple
#On_Cyan="\e[46m"        # Cyan
#On_White="\e[47m"       # White

#NC="\e[m"               # Color Reset

##############################################################
# If ~./inputrc doesn't exist yet,
# first include the original /etc/inputrc so we don't override it
if [ ! -a ~/.inputrc ];
  then echo "\$include /etc/inputrc" > ~/.inputrc;
fi

# Add option to ~/.inputrc to enable case-insensitive tab completion
echo "set completion-ignore-case On" >> ~/.inputrc

#############################################################
#done in ~/.bashrc
# git prompt
#source ~/tmp/bash/git-prompt.sh
#source ~/tmp/bash/git-completion.bash

#export MAKE_MODE=unix
#export GIT_PS1_SHOWDIRTYSTATE=1
#export PS1='\033[32m\]\u@\h \[\033[33m\w\033[0m\]\e[33;40m$(__git_ps1 " (%s)")\e[0m
#$ '

# cd "$HOME"
#############################################################
# enchanced cd
#function _cd {
#    # typing just `_cd` will take you $HOME ;)
#    if [ "$1" == "" ]; then
#        pushd "$HOME" > /dev/null
#
#    # use `_cd -` to visit previous directory
#    elif [ "$1" == "-" ]; then
#        pushd $OLDPWD > /dev/null
#
#    # use `_cd -n` to go n directories back in history
#    elif [[ "$1" =~ ^-[0-9]+$ ]]; then
#        for i in `seq 1 ${1/-/}`; do
#            popd > /dev/null
#        done
#
#    # use `_cd -- <path>` if your path begins with a dash
#    elif [ "$1" == "--" ]; then
#        shift
#        pushd -- "$@" > /dev/null
#
#    # basic case: move to a dir and add it to history
#    else
#        pushd "$@" > /dev/null
#    fi
#}

# replace standard `cd` with enhanced version, ensure tab-completion works
#alias cd=_cd
#complete -d cd
#
#alias dirs='dirs -p'
#############################################################
# TMUX
#if which tmux >/dev/null 2>&1; then
#    #if not inside a tmux session, and if no session is started, start a new session
#   test -z "$TMUX" && { tmux attach &> /dev/null || tmux new-session && exit; }
#fi

#################################################################
# save & load pwd
alias s="pwd > ~/pwd"
function loadDir () {
  cd "$(cat $1)"
}
# use function to avoid "~/pwd" expanded when script loaded
alias l="loadDir ~/pwd"

#################################################################
# gVim
function gvim() {
    /e/Vim/vim81/gvim.exe "$@" &
}

#################################################################
# Ethereum Geth
function geth() {
    /e/Geth/geth.exe "$@"
}

#################################################################
# VirtualBox
# should be end of file, since waiting for a background job running
ipFile="/home/.ipAddress"
vboxUser="lanbosudo"
#vboxIP="192.168.1.96"
#vboxUser="cs4221"
echo 0 > /dev/shm/progressFlag #shared memory, write: echo > /dev/shm/abc, read: echo $(< /dev/shm/abc)

({
while true; do
    diff=$(($(date +%s) - $(date -r $ipFile +%s)))
    if [[ $diff -le 60 ]]; then
        break
    fi
    sleep 30
done

ping -n 1 $vboxIP|grep -E "unreachable|timed out" &> /dev/null

if [ $? -gt 0 ]; then
    echo 1 > /dev/shm/progressFlag
else
    echo 2 > /dev/shm/progressFlag
fi

} &) # parentheses for quiet quit

progressLine="looking for VirtualBox IP address .."
echo -n $progressLine
while :; do
    if [ $(< /dev/shm/progressFlag) -eq 0 ]; then
        echo -n "."
        sleep 1
    else
        echo FOUND!
        break
    fi
done

#vboxIP="127.0.0.1"  # For NAT with Port Forwarding
vboxIP="$(cat $ipFile |head -1)" # For Host-Only and Bridge Network mode
if [[ $vboxIP = 10.0.* ]]; then
    vboxIP="127.0.0.1"  # For NAT with Port Forwarding
fi

echo connecting to virtualbox \($vboxUser@$vboxIP\) ...
if [ $(< /dev/shm/progressFlag) -eq 1 ]; then
    ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null $vboxUser@$vboxIP
else
    echo no connection
fi


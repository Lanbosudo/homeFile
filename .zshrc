#source ~/.zshrc
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="random"
ZSH_THEME="agnoster" # with colorbar for directory and git status

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias lc="ls -C --color=always"
# alias li="ls"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Customize to your needs...
source $ZSH/oh-my-zsh.sh

# change the display color for ls
#
# eval $(dircolors -b /etc/DIR_COLORS)
# eval $(dircolors -b ~/.dircolors)
# LS_COLORS='di=33:fi=36:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:'
# windows excutables
# LS_COLORS+='*.exe=1;32:'
# LS_COLORS+='*.com=1;32:'
# LS_COLORS+='*.bat=1;32:'
# executable bit
# LS_COLORS+='*.sh=1;32:'
# export LS_COLORS

# export CHERE_INVOKING=1
alias s="pwd > ~/.pwd"
function loadDir () cd "$(cat $1)"
alias l="loadDir ~/.pwd"

# TMUX
loadDir ~/.pwd
if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    (test -z "$(tmux ls)" && tmux new || (test -z "$TMUX" && tmux attach)) && exit
fi


# tmux function
function t() {
    if [ $# -gt 0 ]; then
        eval 'tmux $@'
    else
        tmux attach > /dev/null || tmux new > /dev/null
    fi
}

# less all
function so() {
    eval 'unbuffer $@ |less -i'
}

# alias MacVim, java, ls
alias vim="/Applications/MacVim.app/Contents/bin/vim"
alias java="/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home/bin/java"
alias javac="/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home/bin/javac"
alias ls="ls -GF"

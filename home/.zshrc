# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Bind Ctrl-z to fg
stty susp 
bindkey -s  'fg'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)


source $ZSH/oh-my-zsh.sh

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

if [ -f ~/.localrc ]; then
    source ~/.localrc
fi

# export CUPS_SERVER=print

export EDITOR='vim'

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

alias ip="curl --silent checkip.dyndns.org \
           | grep --extended-regexp --only-matching '[0-9\.]+'"
alias nuke="skill -KILL -u ${USER}"

runon() {
    if [ "$1" = "niagara1" ]; then
	ssh $1 "/bin/bash; cd ${PWD}; $2"
    else
	ssh $1 "cd ${PWD}; $2"
    fi
}



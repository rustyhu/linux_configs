
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[1;32m\][\u@\h\[\e[m\] \[\e[1;33m\]\W]\[\e[m\]\$ '


##### abstract layer
# alias
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'
#alias suspend='systemctl suspend'
#alias hibernate='sudo systemctl hibernate'

# Vim
alias vi='vim --noplugins'
alias gvi='gvim --noplugins'

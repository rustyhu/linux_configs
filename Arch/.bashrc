#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[1;32m\]\u\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[0;32m\]\$\[\e[m\] '

# a trick - seems not effective
#echo "welc RUSTY!!!!"

##	alias
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

alias rm='rm -i'
alias mv='mv -i'
alias suspend='systemctl suspend'
#alias hibernate='sudo systemctl hibernate'

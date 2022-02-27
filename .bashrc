##### A simple template from Arch Linux #####

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[1;32m\][\u@\h\[\e[m\] \[\e[1;33m\]\W]\[\e[m\]\$ '


##### Layers
source ~/Linux_configs/.bashrc_layers
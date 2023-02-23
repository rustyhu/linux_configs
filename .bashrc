##### A simple template #####

PS1='\[\e[1;32m\][\u@\h\[\e[m\] \[\e[1;33m\]\W]\[\e[m\]\$ '

##### Layers
if [[ -f ~/linux_configs/.bashrc_layers ]]; then
  source ~/linux_configs/.bashrc_layers
fi

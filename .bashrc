##### Only some advices for .bashrc, copy or not #####

### workspace color
#PS1='\[\e[1;36m\][\u@\h\[\e[m\] \[\e[1;33m\]\w]\[\e[m\]\$ '
PS1='\[\e[1;36m\][\u@\h\[\e[m\] \[\e[1;33m\]\w]\[\e[m\] \n\$ '

### Layers
if [[ -f ~/linux_configs/.bashrc_layers ]]; then
  source ~/linux_configs/.bashrc_layers
fi

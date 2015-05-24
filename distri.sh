#!/bin/bash

# This is a script to distribute configuration files of Rusty's favorite softwares(such as vim and Emacs, etc. all free softwares) automatically.
# The feature of prompting user for softwares' installation directories target will be added later.

# Basic commands
# Because Rus like to install his software in D partition under Windows, the default target directory accord to this.
GIT_DIR_E=./emacs
GIT_DIR_V=./vim

TARGET_DIR_E=~/.Emacs
TARGET_DIR_V=~/.vimrc

# Following commands still need condition judgement as ">>" operates accumulatively.
#cat ${GIT_DIR_E}/.emacs >> ${TARGET_DIR_E}
cp ${GIT_DIR_V}/.vimrc ${TARGET_DIR_V}


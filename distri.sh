#!/bin/bash

# This is a script to distribute configuration files of Rusty's favorite softwares(such as vim and Emacs, etc. all free softwares) automatically.
# The feature of prompting user for softwares' installation directories target will be added later.

# Source: git repo here
GIT_DIR_E=emacs
GIT_DIR_V=vim
# By default target directory is usually ${HOME}.
TARGET_DIR_E=$HOME
TARGET_DIR_V=$HOME

# overwrite
cp "${GIT_DIR_E}/.emacs" "${TARGET_DIR_E}/"
cp "${GIT_DIR_V}/.vimrc" "${TARGET_DIR_E}/"

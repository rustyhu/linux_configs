#!/bin/bash

# a script to deploy configuration files automatically.
# The feature of prompting user for softwares' installation directories will be added later.

# Source: git repo here
GIT_DIR_V=vim
# By default target directory is usually ${HOME}.
TARGET_DIR_V=$HOME

cp "${GIT_DIR_V}/.vimrc" "${TARGET_DIR_E}/"

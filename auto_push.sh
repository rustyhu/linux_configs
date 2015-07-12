#!/bin/bash
# push my commits automatically

# 'git add ...' still needs to be operate manually.
git commit -m "$1"
git push origin master

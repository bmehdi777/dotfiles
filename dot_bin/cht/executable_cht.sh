#!/bin/bash


selected=$(cat ./cht.lang ./cht.cmd | fzf)

read -p "Search: " query

query=`echo $query | tr ' ' '+'`
tmux split-window -h bash -c "echo \"cht.sh/$selected/$query\" & curl -s cht.sh/$selected/$query | less -r"

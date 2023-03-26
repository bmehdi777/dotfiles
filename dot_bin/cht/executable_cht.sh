#!/bin/bash


selected=$(cat ~/.bin/cht/cht.lang ~/.bin/cht/cht.cmd | fzf)

read -p "Search: " query

if [[ -z $query ]]; then
	tmux split-window -h bash -c "echo \"cht.sh/$selected/$query\" & curl -s cht.sh/$selected | less -r"
else
	query=`echo $query | tr ' ' '+'`
	tmux split-window -h bash -c "echo \"cht.sh/$selected/$query\" & curl -s cht.sh/$selected/$query | less -r"
fi

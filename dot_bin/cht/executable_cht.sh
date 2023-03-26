#!/bin/bash


selected=$(cat ./cht.lang ./cht.cmd | fzf)

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Search: " query

if grep -qs "$selected" ./cht.lang; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less -r"
fi


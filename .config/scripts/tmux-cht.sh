#! /usr/bin/env bash

selected=`cat /home/kaine/.config/scripts/.tmux-cht-languages /home/kaine/.config/scripts/.tmux-cht-commands | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "query: " -r query

if grep -qs "$selected" /home/kaine/.config/scripts/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
fi

tmux neww bash -c "curl cht.sh/$selected~$(echo "$query" | tr ' ' '+') & while [ : ]; do sleep 1; done"


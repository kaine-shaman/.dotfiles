#! /bin/bash

url=$(git remote get-url origin)
if [[ $url =~ "git@" ]]; then
   # remote URL is git@host:path, change it to https://host/path
   url=$(echo "$url" | sed -E 's|.*git@(.*?):|https://\1/|')
fi

open $url || echo "No remote found"

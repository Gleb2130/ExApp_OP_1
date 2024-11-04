#!/bin/bash

if [ "$#" -eq 0 ]; then
	exit 1
fi

search=$(echo "$*" | sed "s/ /+/g")

url="https://arxiv.org/search/?query=$search&searchtype=all"

curl -s -L "$url" |\
	tr -d '\n' | tr ' ' '\n' |\
	grep -oP 'arXiv:[^<&?]+' | tr -d 'arXiv:' |\
	sort -u


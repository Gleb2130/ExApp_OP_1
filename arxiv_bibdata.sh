#!/bin/bash

for id in "$@"; do
	url="https://arxiv.org/abs/$id"
	md=$(curl -s -L -A Lynx "$url" | grep -Po '<meta name="citation_\w+" content="[^"]+"')
	echo "--title=\"$(echo "$md" | grep -Po 'citation_title" content="\K[^"]+')\""
	echo "author=\"$(echo "$md" | grep -Po 'citation_author" content="\K[^"]+' | tr '\n' ' ')\""
	echo "date=\"$(echo "$md" | grep -Po 'citation_date" content="\K[^"]+')\""
	echo "online_date=\"$(echo "$md" | grep -Po 'citation_online_date" content="\K[^"]+' | head -n1)\""
	echo "pdf_url=\"https://arxiv.org/pdf/$id\""
	echo "arxiv_id=\"$id\""
	echo
done


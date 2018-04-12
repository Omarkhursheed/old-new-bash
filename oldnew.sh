#!/bin/bash
rm -rf ~/old-new-shell/old && mkdir ~/old-new-shell/old
rm -rf ~/old-new-shell/new && mkdir ~/old-new-shell/new
INDEX=0
for var in "$@"
do
	if [[ $INDEX -eq 0 ]]
	then
		startd=$(date -j -f '%d/%m/%Y' "$1" +'%Y-%m-%d');
		echo $startd
		let INDEX=${INDEX}+1
		echo $INDEX
	else
		cp -r "$var" ~/old-new-shell/old
		cp -r "$var" ~/old-new-shell/new
	fi
done
touch -t $startd /tmp/$startd
find ./new -type f ! -newermt $startd | xargs rm -rf
find ./old -type f -newermt $startd | xargs rm -rf
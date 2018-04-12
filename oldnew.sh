#!/bin/bash
rm -rf ./old && mkdir ./old
rm -rf ./new && mkdir ./new
INDEX=0
for var in "$@"
do
	if [[ $INDEX -eq 0 ]]
	then
		startd=$(date -j -f '%d/%m/%Y' "$1" +'%Y-%m-%d');
		let INDEX=${INDEX}+1
	else
		cp -r "$var" ./old
		cp -r "$var" ./new
	fi
done
find ./new -type f ! -newermt $startd | xargs rm -rf
find ./old -type f -newermt $startd | xargs rm -rf
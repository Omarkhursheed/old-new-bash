rm -rf ./old && mkdir ./old && rm -rf ./new && mkdir ./new && INDEX=0
for var in "$@" 
do
	if [[ $INDEX -eq 0 ]]
		then startd=$(date -j -f '%d/%m/%Y' "$1" +'%Y%m%d') && let INDEX=${INDEX}+1 && startd+="0000"
	else 
		touch -t $startd /tmp/timestamp 
		find "$var" -type d -exec mkdir -p ./old{} \; && find "$var" -type f ! -newer /tmp/timestamp -exec cp -R {} ./old/{}  \;
		find "$var" -type d -exec mkdir -p ./new{} \; && find "$var" -type f -newer /tmp/timestamp -exec cp -R {} ./new/{}  \;
	fi 
done
rm -rf ./old && mkdir ./old && rm -rf ./new && mkdir ./new && INDEX=0
for var in "$@" 
do
	if [[ $INDEX -eq 0 ]]
		then startd=$(date -j -f '%d/%m/%Y' "$1" +'%Y%m%d') && let INDEX=${INDEX}+1 && startd+="0000"
	else 
		touch -t $startd /tmp/timestamp && find "$var" -type f ! -newer /tmp/timestamp | cpio -mdp ./old && find "$var" -type f -newer /tmp/timestamp | cpio -mdp ./new
	fi 
done
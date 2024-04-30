#!/usr/bin/bash

# safety
if [ -f $1 ]; then
	read_file=$1
else
	echo "must provide a file to read!"
	exit
fi

# declaring using declare!
declare -a array

# link filedescriptor 10? with stdin 

exec 10<&0

exec < $1

# explicitly use 'let' keyword, though no calculations are done here, it allows for expressions to be used.
let count=0

while read LINE; do
	array[$count]=$LINE
	((count++))
done

echo "the array: ${array[@]}"

echo "there are ${#array[@]} elements in the array"

# this line restores stdin. what?
exec 0<&10 10<&-

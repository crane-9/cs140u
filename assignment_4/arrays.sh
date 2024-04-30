#!/usr/bin/bash

# declaring the array.
arr=('value one' 'value two' 'value three' four five)

# iterate through array!
count=${#arr[@]}

for ((i=0;i<$count;i++)); do
	echo ${arr[${i}]}
done

echo "those are all the things!"

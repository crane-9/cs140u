#!/usr/bin/bash

trap bashtrap INT
clear

bashtrap() {
	echo "oh you want to close the app? haha! no, you are trapped!"
}

# for loop to count and wait for the ctrl + c command
for a in `seq 1 10`; do
	echo "$a ...."
	sleep 1;
done

echo "bye bye!"

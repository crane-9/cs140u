#!/usr/bin/bash

function functionA {
	echo "local arg 1: $1"
}

function functionB {
	echo "1 + 2 = $((1+2))"
}


echo "global arg 1: $1"

#functionA hello world!
#functionB

select func in functionA functionB echo; do
	# hypothetically, this should ring a bell, but it's not working for me? i wonder if this is something about how my terminal is configured. i will test on my laptop later because ubuntu is noisy for me.
	# echo -ne $'\a'

	echo "you selected: $func"
	echo `${func} argument`
	break
done

exit 0

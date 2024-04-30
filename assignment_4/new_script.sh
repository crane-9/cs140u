#!/usr/bin/bash

<< INFO
	this script is a utility for me creating so many new scripts.
		- it will create a file
		- fill in the hashbang.
		- add execution permissions to the file.
		- open it in nano?

	before it does that, it will validate the name does not already exist.
INFO

# make a script name that won't overwrite another
file_name=$1.sh
i=1

while [ -e $file_name ] ; do
	file_name=$1_$i.sh
	((i++))
done

echo "creating new script: $file_name"

# fill first line
echo "#!/usr/bin/bash" > $file_name
chmod +x $file_name

# open the new file! yay
nano $file_name

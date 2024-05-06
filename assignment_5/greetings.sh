#!/usr/bin/bash

# A welcoming script that greets the user with a rainbow stegosaurus.

QUOTES_PATH=$(dirname $0)/greetings.txt

# Get a random phrase
random_phrase() {
    # Establish array.
    declare -a array

    # Redirect STDIN to FD 3
    exec 3<&0
    
    # Take input from quotes path.
    exec < $QUOTES_PATH

    # Turn the file into an array of lines.
    count=0
    while read LINE; do
        array[$count]=$LINE
        ((count++))
    done

    # Restore STDIN from FD3
    exec 0<&3 3<&-

    # Use random in the count range.
    echo ${array[(($RANDOM % $count))]}
}


# Pipe result throught `cowsay` and then `lolcat` for added decoration.
random_phrase | cowsay -f stegosaurus.cow | lolcat

exit 0

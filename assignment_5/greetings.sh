#!/usr/bin/bash


# Get a random phrase
random_phrase() {
    # Establish array.
    declare -a array
    exec 10<&0
    exec < greetings.txt

    # Turn the file into an array of lines.
    count=0
    while read LINE; do
        array[$count]=$LINE
        ((count++))
    done

    # restore stdin/stdout
    exec 0<&10 10<&-

    # Use random in the count range.
    echo ${array[(($RANDOM % $count))]}
}


# Pipe result throught `cowsay` and then `lolcat` for added decoration.
random_phrase | cowsay -f stegosaurus.cow | lolcat

#!/usr/bin/bash

echo -e "hello please type a word: \c"
read wordA

echo "you said: $wordA"
echo -e "now enter two words: \c"
read wordB wordC
echo "this is what you said '$wordB' '$wordC'"

echo -e "what are your favorite colors? tell them to me"

read -a colors
echo "ew! i do not like ${colors[0]}"

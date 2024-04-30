#!/usr/bin/bash

VALUE="hello world :]"
echo $VALUE

echo ""

# # backup
# output_file=dotfiles_backup_$(date +%Y-%m-%d).tar.gz
# echo "i'm backing up your dotfiles now ok?"
# tar -czf $output_file /home/crane/.config

# arguments
echo "your first 3 arguments:"
echo $1 $2 $3

echo ""

echo "now all $# of your arguments: "
echo $@


# subshell
echo $(uname -o)

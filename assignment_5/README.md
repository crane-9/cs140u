# Assignment 5

This script is a simple greeting on the launch of a terminal.

 It randomly selects one line of text from a file, and pipes it through `cowsay`, and then pipes the result through `lolcat` to add colors.


### Dependencies:
- `cowsay`
- `lolcat`


### Installation:
- Download both `greetings.sh` and `greetings.txt` to the same directory.
 - I suggest something like `~/.local/share/greetings` for easy access and organization.
- In your terminal, use `chmod u+x greetings.sh` to make the script executable.
- Include a call to `$HOME/.local/share/greetings/greetings.sh` at the end of your `.bashrc` file.


### Configuration:
To add more phrases to the roster of phrases, edit the file `greetings.txt` with more lines of greetings. Please note: phrases are separated by newline characters.

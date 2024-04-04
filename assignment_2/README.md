# Assignment 2

1. `cd`
    
    Guess: Nothing will happen. `cd` changes directory, but without a command, you remain in one place.

    Output: Running this command from the root, nothing happened. I ran `cd` a second time from `~/Documents` to be sure, and this time it brought me back to root.

2. `sudo useradd papabear`
3. `sudo useradd mamabear`
4. `sudo useradd babybear`

    Guess: I will be asked for a password, and then a new user will be created on the system. I wonder if there will be feedback for success, but I doubt it.

    Output: I was asked for my password (for the first command only), and then it seemed nothing happened. I wonder how to list all users.

5. `sudo groupadd bears`

    Guess: It will look like nothing happened, but this will create a new usergroup.

    Output: No obvious result. I would think that the following commands will confirm the existence of the group

6. `sudo usermod -G bears papabear`
7. `sudo usermod -G bears mamabear`
8. `sudo usermod -G bears babybear`

    Guess: This will add each bear user to the group `bears`. I wonder if this might show some output to confirm or show the updated usergroup.

    Output: No obvious result. I tried `sudo usermod -G lions papabear` just to see what happened, and I got an error informing me that group "lions" does not exist.

9. `sudo adduser wolf`

    Guess: Just like creating the bear users, this will create a wolf user. There will be no output.

    Output: I was surprised to see a couple lines of immediate output, and then a prompt asking for a password, folowed by prompts asking for a full name, room number, work phone, and home phone. It seems this adds a user *and* a group named after the given argument ("wolf" in this case).

10. `mkdir cranepermissions`

    Guess: This will create a new directory in the current directory. There will be no feedback to show that this has been made.

    Output: (See guess.)

11. `cd cranepermissions`

    Guess: This will make `~/cranepermissions` the current working directory.

    Output: Yes, this navigates into the directory `cranepermissions`, which is shown in the prompt in my BASH terminal.

12. `tail /etc/group | tee tailgroup`

    Guess: I have no idea. I have never seen or used the `tail` command before, but I have seen the `tee` command before. I believe that the `|` is going to run both commands, perhaps in parallel if possible? I am wondering if there is an operator for sequential and an operator for sequential, but unsure if parallel execution in this fashion is a thing.

    Output: A list of information printed to terminal. Most lines I don't understand, but I have some ideas.

    ```bash
    gdm:x:134:
    lxd:x:135:crane
    crane:x:1000:
    sambashare:x:136:crane
    _flatpak:x:137:
    papabear:x:1001:
    mamabear:x:1002:
    babybear:x:1003:
    bears:x:1004:papabear,mamabear,babybear
    wolf:x:1005:
    ```

    I believe that this is a table of groups:
    - The first column is the name of the group. 
    - I'm not sure what the `x` means, and it is intersting it appears in every row.
    - I believe the number is an id of some sort. There are two continuities: 134 - 137, and 1000 - 1005, which to me implies `gdm`, `lxd`, `sambashare`, and `_flatpak` have a specific distinction from the rest -- possibly that they are groups? but that doesn't line up with `bears` having id 1004, unless the distinction is that these groups weren't created by the user. 
    - The final column is a comma-separated list of users that belong to the group. This is with the exception of users who share a name with a group (ie. neither `wolf` nor `crane` have themselves listed in their own users).

    Out of the two commands that were separated by a `|` however, I'm not sure which printed the list, and what the point of the other was. I did some research and found:

    - `tail` prints the end of a file. Useful in cases of long log files. So are there more groups that would answer my questions? (Using `cat /etc/group` I found the answer to be absolutely yes.)
    - `tee` saves the output of a command to a given file. (Using `ls` to check, this did in fact create a file called `tailgroup`)
    - The pipe (`|`) feeds the output of one command into the next. (So, it does run sequentially.)

    So in summary: `tail /etc/group` read the last 10 lines of the given file, the operator `|` "piped" that output into the next command, and `tee tailgroup` created a file called `tailgroup` with the text delivered by the pipe.

13. `touch file`

    Guess: This will attempt to touch (ie. update its "last modified" timestamp to the current timestamp) a non-existent file called `file` in the given directory. Because it does not exist, it will create the fill and mysteriously return no output.

    Output: (See guess.) 

14. `sudo chown papabear:bears file`

    Guess: This will set the owner user of `file` to the user papabear, and the owner group to the group bears. No output.

    Output: First asked for a password on behalf of `sudo`, showing that it is not session-based verification but time(?)-based. Then nothing seemed to happen, as expected. I opened up the directory `~/cranepermissions` in the GUI file explorer, and it appeared that I, the user "crane" did not have permissions to interact with the file.

15. `sudo chmod g+w file`

    Guess: This will add writing permissions for the group that owns the file `file`.

    Output: No output is good output?

16. `sudo su babybear`

    Guess: This will **s**witch the current **u**ser to babybear.

    Output: No output, but the BASH prompt changed from `crane@bot-maker-5000:~/cranepermissions$` to just `$`, which I found interesting. I attempted `cd`, which returned an error message, "`can't cd to /home/babybear`". I then used `pwd` to learn that I was still in `/home/crane/cranepermissions`

17. `echo I want my porridge! >> file`

    Guess: This will append the text "I want my porridge" into the file `file`. No output.

    Output: (See guess.)

18. `exit`

    Guess: `exit` closes the terminal. Yet I feel unsure about if that will happen.

    Output: I was logged out of babybear, and my BASH prompt returned to `crane@bot-maker-5000...$`.

19. `sudo su wolf`

    Guess: This will switch me to user wolf. It may ask for a password for wolf?

    Output: It did not ask for any passwords. However, unlike babybear, wolf has a directory under `home`, so the BASH prompt now reads: `wolf@bot-maker-5000/home/crane/cranepermissions`. (I then used `cd` which brought me to `home/wolf`, and was unable to return to `/home/crane/cranepermissions` as user wolf.)

20. `echo You cant have any >> file`

    Guess: This will attempt to write the given text into the file, just like in command 17. However, wolf does not have permission for this as a group or user, so I predict this will return an error.

    Output: Permissions was denied.

21. `exit`

    Guess: This will log me out of wolf just like it logged me out of babybear.

    Output: It did. I wish I remembered this back in 19 when I was fiddling with directories and users.

22. `vi eatporridge`

    Guess: This will create file `eatporridge` and open it in the in-terminal text editor Vi. I believe I have this installed, but I'm unsure if this may raise an issue of it not being found. I have very little idea on how to use Vi, so I may struggle to save the file.

    Output: I do have Vi installed, and I indeed do not know how to use it. I struggled for a moment and eventually crashed Vi, and re-opened the file with Nano. 

23. `sudo su babybear`

    Guess: This will switch me to the user babybear, just like before.

    Output: (See guess.)

24. `bash eatporridge`

    Guess: This will run the script I just wrote, which has no visible output. 

    Output: (See guess.)

25. `exit`

    Guess: Logs me out of babybear just as before.

    Output: (See guess.)

26. `cat eatporridge`

    Guess: This will print the contents of file `eatporridge` to the terminal.

    Output: (See guess.)

27. `cat file`

    Guess: This will print the contents of file `file` to the terminal. This will be two lines, the second being "This porridge is just right" as added by the `eatporridge` script.

    Output: (See guess.)

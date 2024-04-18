# Assignment 3

[Contents of `q1` & `q2` here.](./assignment.log)

1. I open my terminal.

    - I use `pwd` to confirm that `~` indicates `/home/<username>`.
    - I use `mkdir` to create a new directory for the assignment, creatively named `cs140u_assignment3`
    - I use `mkdir` to create the subdirectory `subdir` under `cs140u_assignment3`: this makes the full command `mkdir cs140u_assignment3/subdir`.
    - To create a new empty file (which I will call `file_a`) I use `touch file_a`.
    - (I then pause and research [hard links](https://linuxhandbook.com/hard-link/) and [system links](https://linuxhandbook.com/symbolic-link-linux/). And [inodes](https://linuxhandbook.com/inode-linux/).)
    - I use `ln file_a hardlink1` and `ln file_a hardlink2` to create two hardlinks.
    - I use `ln -s file_a symlink1`.
    - I use `ln -s symlink1 symlink2`.
    - I create a file in the parent directory using relative paths: `touch ../file_b`
    - I create a soft link to this file with `ln -s ../file_b symlink_b`.
    - I then use the command `ls -il > ~/q1` to create a new file in my `home` directory and populate it with the given output of `ls -il` (ran from within `subdir`).
    - I use `cat ~/q1` to check and confirm the contents of this file.

2. I clear the terminal for the sake of organization.

    - (I find a [reference](https://linuxize.com/post/how-to-find-files-in-linux-using-the-command-line/) for `find`'s syntax.)

    - I use `find -L /etc "pass*"`, which yields a long list of paths but a final message reading `find 'pass*': No such file or directory.` After noticing files/directories that begin with "profile", I run `find -L /etc "profile*"` to check if I'm doing something wrong, and the results are not as expected.
    - I double check my reference and run `find -L /etc -iname "pass*"` and get results.
    - I run `find -L /etc -iname "pass*" >> ~/q2` to save the output for the assignment.

    - I run `whatis awk` to remind myself what `awk` does.
    - I use `ls /` to double check that I know where the `/bin` directory is.
    - I run `find -L /bin -iname "awk*"` and am pleased to see `/bin/awk` appear. 
    - I then use `which awk` to confirm its location. The command returns `/usr/bin/awk`, which I see as good enough. However, I wonder why it is that `awk` appears in both `bin` directories. I also wonder if these two files are hardlinked.
    - I use `stat /usr/bin/awk` and `stat /bin/awk` to find that these two share an inode.
    - I run `find -L /etc -iname "awk*" >> ~/q2` to save the output for the assignment.

    - I consult my reference again and find how to work with file sizes.
    - I run `find -L /etc -type f -size +500k` and it returns a reasonably-sized list of result files.
    - I attempt to verify the size of the files using `stat /etc/alternatives/c++`, however the size is listed as `12` without any units. [This](https://www.howtogeek.com/451022/how-to-use-the-stat-command-on-linux/) reference claims this size should be in bytes, but I am unsure of where my error is.
    - I poke around for answers but come up with nothing. I use `find -L /etc -type f -size +500k > ~/q2` to save the output for class.

    - I check the reference I have been using for the `find` command, and then `find --help` when I'm still unsure what the option is for access time. I still have questions after that, so I find [this](https://bytexd.com/how-to-use-find-with-atime-ctime-mtime-amin-cmin-mmin/) which gives me what I need for searching by access time in minutes.
    - I run `find -L /etc -type f -amin -30`.
    - I get one result and a couple of "permission denied" messages (which I have been getting throughout this assignment, and I now realize I should have been using `sudo` for this sake).
    - I use `find -L /etc -type f -amin 30 >> ~/q2` to save the output for the assignment.

3. Command writing:

    d rwx r-x r--
    ```bash
    chmod -R 754 dirname 
    ```

    rw- --- r--
    ```bash
    chmod 604 filename
    ```

    -w- rwx rw-
    ```bash
    chmod 276 filename
    ```

4. Numeric equivalents:

    ```
    rw-r--r--
    644

    r--r--r--
    444

    ---rwxrw-
    076

    -wxr-xrw-
    356

    rw-rw-rwx
    667

    -w-r-----
    240
    ```

5. Unmasks:

    ```
    022
    --- -w- -w-

    777
    rwxrwxrwx

    033
    -wx -wx -wx

    077
    --- rwx rwx

    027
    --- -w- rwx
    ```

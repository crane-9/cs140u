# Assignment 6

I wrote a very quick and simple script that backs up the given directories to a `.tar` file in a configurable backups folder.

This script was written with the expectations of being configured as a `crontab` job, and includes an `--install` option.


## Usage

Example usage:
```sh
# From cs140u/assignment_6/

./archive.sh ../assignment_4 ../assignment_2  # Backs up the folder for my second and fourth assignments into a file named after the current date/time into $HOME/backups/

./archive.sh -A assignment_4_backup.tar -d ../ ../assignment_4  # Back up the assignment_4 folder to assignment_4_backup.tar in the parent folder.

./archive.sh -A assignment_4_backup.tar -d ../ ../assignment_4 --install  # Install a cron job to backup the assignment_4 folder every day at noon.
```

This script has three main configurations, as follows:

| Name      | Flag                   | Argument? | Description                             |
|-----------|------------------------|:---------:|-----------------------------------------|
| Archive   | `--archive`, `-A`      | ✔️         | Sets the name of the output archive.    |
| Directory | `--directory`, `-d`    | ✔️         | Sets the destination for the output archive.    |
| Silence   | `--silent`, `-S`       |           | Silences and skips file/directory verification for input files and directories.    |

Those can be combined with `--install` (with exception of `--silence`) to configure the installed job's command arguments.


### Notes:

- Quick usage information can be viewed with `-h`/`--help`.
- The `-S`/`--silence` flag is not included in the crontab job, as it makes no difference.
- Stderror output from `tar` is redirected to an `error.log` file which -- if necessary -- will be created in the same directory as your backups.
- If `-A`/`--archive` is not set on use of `--install`, then the crontab execution of this script will still allow for dynamic generation of the archive name based on the current date & time.
- Overall order of command arguments does not matter, so long as the needed argument for the relevant flag comes immediately after the flag (as is logically).


## Resources

[This](https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash) Stack Overflow answer changed my perspective on writing scripts in bash.

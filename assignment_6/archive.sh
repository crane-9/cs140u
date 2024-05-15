#!/usr/bin/bash

# Define default outputs
outputDir="$HOME/backups/"
outputName="$(date).tar"

# Non-configurable constants.
errorFile="error.log"


# Help string.
help() {
    cat << EOL 
This is a basic archival tool that archives the given directories as a .tar file.
    
USAGE: ./archive.sh [OPTIONS] [DIRECTORIES ...]

ALTERNATE ACTIONS
    --help, -h : View this help menu.
    --install : Attempts to install this script into the current user's crontab.

PARAMETERS:
    DIRECTORY: One or more directories (or files) to backup.

OPTIONS:
    --archive, -A [ARCHIVE NAME]: The name to give the archive file.
    --directory, -d [DIRECTORY]: The output path to send the archive to. Defaults to '$HOME/backups/'
    --silent, -S : (Not recommended) Disables validating input directories as existing. Script will simply ignore non-existent paths.
EOL
    exit 0
}


# Installs this script into the user's crontab.
install() {
    (crontab -l 2>/dev/null; echo "0 12 * * * $(realpath $0)") | crontab -
    exit 0
}


# Prepare to keep positional arguments in order.
DIR_NAMES=()


# Iterate through all arguments, parsing flags.
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            help
            ;;
        --install)
            install
            ;;
        
        -A|--archive)
            outputName=$2
            shift
            shift
            ;;
        -d|--directory)
            outputDir=$2
            shift
            shift
            ;;
        -S|--silent)
            silent=1
            shift
            ;;

        -*|--*)
            echo "Option $1 not recognized"
            exit 1
            ;;
        *)
            # Check that file exists -- optionally disabled.
            if ! [[ $silent ]] && ! [[ -e $1 ]]; then
                echo "Directory/file '$1' could not be found."
                exit 1
            fi

            # Else, add and continue.
            DIR_NAMES+=($1)
            shift
            ;;
    esac
done


# Ensure output directory exists!
if ! [[ -d $outputDir ]]; then
    mkdir -p $outputDir 
fi

# Do the backup and redirect errors to an error log.
tar -cf "$outputDir/$outputName" ${DIR_NAMES[@]} 2>>"$outputDir/$errorFile"

if [[ -f "$outputDir/$errorFile" ]]; then
    echo "Non-fatal errors written to '$(realpath $outputDir/$errorFile)'"
fi

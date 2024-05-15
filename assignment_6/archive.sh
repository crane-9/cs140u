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

ACTIONS
    --help, -h : View this help menu.
    --install : Attempts to install this script as a crontab job for the current user. This installation will copy the passed arguments.

PARAMETERS:
    DIRECTORY: One or more directories (or files) to backup.

OPTIONS:
    --archive, -A [ARCHIVE NAME]: The name to give the archive file.
    --directory, -d [DIRECTORY]: The output path to send the archive to. Defaults to '$HOME/backups/'
    --silent, -S : (Not recommended) Disables validating input directories as existing. Script will simply ignore non-existent paths.

For further information, view README.md.
EOL
    exit 0
}


# Installs this script into the user's crontab.
install() {
    job="0 12 * * * $(realpath $0) -d $(realpath $outputDir) ${DIR_NAMES[@]}"

    if [[ $renamedArchive ]]; then
        job+=" -A $outputName"
    fi

    (crontab -l 2>/dev/null; echo "$job") | crontab -
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
            # Set a flag to perform install with the given arguments.
            performInstall=1
            shift
            ;;
        
        -A|--archive)
            renamedArchive=1   # SEt a flag -- this ensures that the current date being the default name can continue to function for installed jobs.
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

            # Else, add full path (for the sake of installation) and continue.
            DIR_NAMES+=($(realpath $1))
            shift
            ;;
    esac
done

# Ensure output directory exists!
if ! [[ -d $outputDir ]]; then
    mkdir -p $outputDir 
fi

# Install the crontab job.
if [[ $performInstall ]]; then
    install
fi


# Do the backup and redirect errors to an error log.
tar -cf "$outputDir/$outputName" ${DIR_NAMES[@]} 2>>"$outputDir/$errorFile"

if [[ -f "$outputDir/$errorFile" ]]; then
    echo "Non-fatal errors and warnings written to '$(realpath $outputDir/$errorFile)'"
fi

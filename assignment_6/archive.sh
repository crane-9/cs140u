#!/usr/bin/bash

# Define default output
outputDir="/home/$USER/backups/"

# Help string.
help() {
    cat << EOL 
This is a basic archival tool.
    
USAGE: ./archive.sh [OPTIONS] [DIRECTORIES ...]

PARAMETERS:
    DIRECTORY: One or more directories (or files) to backup.

OPTIONS:
    --archive, -A [ARCHIVE NAME]: The name to give the archive file.

EOL
}


# Prepare to keep positional arguments in order.
POSITIONAL_ARGS=()

# Iterate through all arguments, parsing flags.
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            help
            exit 0
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
        -*|--*)
            echo "Option $1 not recognized"
            exit 1
            ;;
        *)
            POSITIONAL_ARGS+=($1)
            shift
            ;;
    esac
done


# archive the given path.
#   verify it exists
#   default target destination

echo "archiveName: $archiveName"
echo "positional args: $POSITIONAL_ARGS"
echo "${POSITIONAL_ARGS[@]}"


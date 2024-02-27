#!/bin/bash

function show_help() {
    echo "Usage: bash BashProject.sh [options]"
    echo "This script reads log files and displays their information."
    echo "Options:"
    echo "  -h, --help    Display this help message"
    echo "Please enter the path to the log file when prompted."
}

# Prompt the user to enter a log file
read -p "Enter the path to the log file: " logfile

# Check if the log file exists
if [ -f "$logfile" ]; then
    # Display file information
    echo "File Name: $logfile"
    echo "File Size: $(du -h "$logfile" | cut -f1)"
    echo "File Permissions: $(stat -c %A "$logfile")"
    echo "Created: $(stat -c %x "$logfile")"
    echo "Last Modified: $(stat -c %y "$logfile")"
else
    # Display error message
    echo "Error: Log file does not exist."
fi

# Check if the script was called with the help command
if [ "$1" == "-h" ]; then
    show_help
fi
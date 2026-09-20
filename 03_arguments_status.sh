#!/bin/bash
# ICDFA Bash Lab 4 — Arguments & Exit Status
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <name> <course>"
    exit 1
fi

echo "Script name: $0"
echo "Name: $1"
echo "Course: $2"
echo "Number of arguments: $#"
echo "The script completed successfully."
exit 0

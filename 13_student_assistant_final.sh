#!/usr/bin/env bash

set -u

show_header() {
    echo
    echo "======================================"
    echo "        ICDFA BASH STUDENT ASSISTANT"
    echo "======================================"
}

system_info() {
    echo "Username : $(whoami)"
    echo "Hostname : $(hostname)"
    echo "Date     : $(date)"
    echo "Home     : $HOME"
    echo "Current  : $(pwd)"
}

count_files() {
    local total
    total="$(find . -type f | wc -l)"
    echo "Files in this directory: $total"
}

create_folder() {
    local folder

    read -r -p "Enter folder name: " folder

    if [[ -z "$folder" ]]; then
        echo "Folder name cannot be empty."
    elif mkdir -- "$folder" 2>/dev/null; then
        echo "SUCCESS: Folder '$folder' created."
    else
        echo "FAILED: Could not create folder."
    fi
}

create_file() {
    local file

    read -r -p "Enter file name: " file

    if [[ -z "$file" ]]; then
        echo "File name cannot be empty."
    elif touch -- "$file" 2>/dev/null; then
        echo "SUCCESS: File '$file' created."
    else
        echo "FAILED: Could not create file."
    fi
}

display_file() {
    local file

    read -r -p "Enter file name: " file

    if [[ ! -f "$file" ]]; then
        echo "FAILED: File does not exist."
    else
        cat -- "$file"
    fi
}

calculator() {
    local num1 num2 operation

    read -r -p "Enter first integer: " num1
    read -r -p "Enter second integer: " num2

    if ! [[ "$num1" =~ ^-?[0-9]+$ && "$num2" =~ ^-?[0-9]+$ ]]; then
        echo "FAILED: Integers only."
        return
    fi

    echo "1. Add"
    echo "2. Subtract"
    echo "3. Multiply"
    echo "4. Divide"

    read -r -p "Choose operation: " operation

    case "$operation" in
        1)
            echo "Result: $((num1 + num2))"
            ;;
        2)
            echo "Result: $((num1 - num2))"
            ;;
        3)
            echo "Result: $((num1 * num2))"
            ;;
        4)
            if (( num2 == 0 )); then
                echo "FAILED: Cannot divide by zero."
            else
                echo "Result: $((num1 / num2))"
            fi
            ;;
        *)
            echo "FAILED: Invalid operation."
            ;;
    esac
}

disk_usage() {
    echo "Top 10 largest items in current directory:"
    echo "-------------------------------------------"
    du -ah . 2>/dev/null | sort -rh | head -n 10
}

echo "======================================"
echo "       ICDFA BASH STUDENT ASSISTANT"
echo "======================================"

read -r -p "Enter your name: " name

if [[ -z "$name" ]]; then
    echo "Name cannot be empty."
    exit 1
fi

while true; do
    show_header

    echo "Hello, $name"
    echo "1. Show system information"
    echo "2. Count files"
    echo "3. Create a folder"
    echo "4. Create a file"
    echo "5. Display a file"
    echo "6. Calculator"
    echo "7. Show disk usage"
    echo "0. Exit"

    read -r -p "What would you like to do? " choice

    case "$choice" in
        1)
            system_info
            ;;
        2)
            count_files
            ;;
        3)
            create_folder
            ;;
        4)
            create_file
            ;;
        5)
            display_file
            ;;
        6)
            calculator
            ;;
        7)                      
            disk_usage
            ;;
	0)
            echo "Goodbye, $name!"
            break
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
done


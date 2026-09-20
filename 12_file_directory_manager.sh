#!/usr/bin/env bash

# Run this program only inside your dedicated practice directory.

while true; do
    echo
    echo "======================================"
    echo "       FILE & DIRECTORY MANAGER"
    echo "======================================"
    echo "1. mkdir  - Create directory"
    echo "2. touch  - Create empty file"
    echo "3. cp     - Copy file"
    echo "4. mv     - Move or rename"
    echo "5. rm     - Remove file"
    echo "6. cat    - Display file contents"
    echo "7. less   - View longer files"
    echo "0. Exit"
    echo "======================================"

    read -r -p "What would you like to do? " choice

    case "$choice" in
        1)
            read -r -p "Enter directory name: " dir

            if [[ -z "$dir" ]]; then
                echo "FAILED: Directory name cannot be empty."
            elif mkdir -- "$dir" 2>/dev/null; then
                echo "SUCCESS: Directory '$dir' created."
            else
                echo "FAILED: Directory could not be created."
            fi
            ;;

        2)
            read -r -p "Enter file name: " file

            if [[ -z "$file" ]]; then
                echo "FAILED: File name cannot be empty."
            elif touch -- "$file" 2>/dev/null; then
                echo "SUCCESS: File '$file' created/updated."
            else
                echo "FAILED: File could not be created."
            fi
            ;;

        3)
            read -r -p "Enter source file: " source
            read -r -p "Enter destination: " destination

            if [[ ! -f "$source" ]]; then
                echo "FAILED: Source file does not exist."
            elif cp -- "$source" "$destination" 2>/dev/null; then
                echo "SUCCESS: File copied."
            else
                echo "FAILED: Copy operation failed."
            fi
            ;;

        4)
            read -r -p "Enter source: " source
            read -r -p "Enter new name/destination: " destination

            if [[ ! -e "$source" ]]; then
                echo "FAILED: Source does not exist."
            elif mv -- "$source" "$destination" 2>/dev/null; then
                echo "SUCCESS: Move/rename completed."
            else
                echo "FAILED: Move/rename failed."
            fi
            ;;

        5)
            read -r -p "Enter file to remove: " file

            if [[ ! -f "$file" ]]; then
                echo "FAILED: This option removes regular files only."
            else
                read -r -p "Remove '$file'? (y/n): " confirm

                if [[ "$confirm" == "y" ]]; then
                    if rm -- "$file" 2>/dev/null; then
                        echo "SUCCESS: File removed."
                    else
                        echo "FAILED: File could not be removed."
                    fi
                else
                    echo "Operation cancelled."
                fi
            fi
            ;;

        6)
            read -r -p "Enter file name: " file

            if [[ ! -f "$file" ]]; then
                echo "FAILED: File does not exist."
            else
                echo "========== FILE CONTENT =========="
                cat -- "$file"
                echo
                echo "=================================="
            fi
            ;;

        7)
            read -r -p "Enter file name: " file

            if [[ ! -f "$file" ]]; then
                echo "FAILED: File does not exist."
            else
                less -- "$file"
            fi
            ;;

        0)
            echo "Goodbye!"
            break
            ;;

        *)
            echo "FAILED: Invalid choice. Select 0-7."
            ;;
    esac
done


#!/usr/bin/env bash

print_heading() {
    echo
    echo "===== $1 ====="
}

greet() {
    echo "Hello, $1!"
}

print_heading "Functions"

read -r -p "Enter your name: " name

if [[ -z "$name" ]]; then
    echo "Name cannot be empty."
    exit 1
fi

greet "$name"

print_heading "System Information"
echo "User: $(whoami)"
echo "Host: $(hostname)"


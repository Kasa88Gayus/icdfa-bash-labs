#!/usr/bin/env bash
# ICDFA Bash Lab 5 — Conditions & Comparisons
read -r -p "Enter a number: " number

if ! [[ "$number" =~ ^-?[0-9]+$ ]]; then
    echo "Invalid input. Enter an integer."
    exit 1
fi

if (( number > 0 )); then
    echo "The number is positive."
elif (( number < 0 )); then
    echo "The number is negative."
else
    echo "The number is zero."
fi

if (( number == 10 )); then
    echo "The number is exactly 10."
fi

if (( number != 5 )); then
    echo "The number is not 5."
fi

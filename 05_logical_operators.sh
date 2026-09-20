#!/usr/bin/env bash
# ICDFA Bash Lab 6 — Logical AND, OR, NOT
read -r -p "Enter your age: " age
read -r -p "Are you a student? (yes/no): " student

if ! [[ "$age" =~ ^[0-9]+$ ]]; then
    echo "Age must be a number."
    exit 1
fi

if (( age >= 13 )) && [[ "$student" == "yes" ]]; then
    echo "AND: both conditions are true."
fi

if (( age < 13 )) || [[ "$student" == "no" ]]; then
    echo "OR: at least one condition is true."
fi

if [[ ! "$student" == "yes" ]]; then
    echo "NOT: the student answer is not yes."
fi

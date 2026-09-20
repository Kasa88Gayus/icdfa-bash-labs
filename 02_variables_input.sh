#!/bin/bash
# ICDFA Bash Lab 3 — Variables & User Input
name="Student"
course="Bash Scripting Fundamentals"

echo "Default name: $name"
echo "Course: $course"

read -r -p "Enter your name: " name
read -r -p "Enter your level: " level

if [[ -z "$name" || -z "$level" ]]; then
    echo "Name and level cannot be empty."
    exit 1
fi

echo "Welcome, $name!"
echo "Level: $level"
echo "Course: $course"

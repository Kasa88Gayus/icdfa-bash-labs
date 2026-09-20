#!/usr/bin/env bash

mkdir -p practice_files

touch practice_files/one.txt
touch practice_files/two.txt
touch practice_files/notes.md

total="$(find practice_files -type f | wc -l)"

echo "Files found: $total"

echo
echo "===== TEXT FILES ====="
find practice_files -type f -name "*.txt" -print


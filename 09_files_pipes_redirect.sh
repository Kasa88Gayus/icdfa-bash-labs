#!/usr/bin/env bash

workdir="bash_pipeline_lab"

mkdir -p "$workdir"

printf '%s\n' "Bash" "Linux" "Bash" "Security" "Linux" > "$workdir/topics.txt"

echo "Created: $workdir/topics.txt"

echo
echo "===== FILE CONTENTS ====="
cat "$workdir/topics.txt"

echo
echo "===== NUMBER OF LINES ====="
wc -l < "$workdir/topics.txt"

echo
echo "===== SORTED UNIQUE TOPICS ====="
sort "$workdir/topics.txt" | uniq

echo
echo "===== LINES CONTAINING LINUX ====="
grep -n "Linux" "$workdir/topics.txt"


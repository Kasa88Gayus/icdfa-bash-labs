#!/usr/bin/env bash

echo "===== FOR LOOP ====="
for item in one two five eight; do
    echo "Item: $item"
done

echo
echo "===== WHILE LOOP ====="
count=1
while (( count <= 5 )); do
    echo "Count: $count"
    ((count++))
done

echo
echo "===== UNTIL LOOP ====="
count=1
until (( count > 5 )); do
    echo "Count: $count"
    ((count++))
done


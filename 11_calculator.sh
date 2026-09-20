#!/usr/bin/env bash

read -r -p "First integer: " a
read -r -p "Second integer: " b

if ! [[ "$a" =~ ^-?[0-9]+$ && "$b" =~ ^-?[0-9]+$ ]]; then
    echo "Please enter integers only."
    exit 1
fi

echo "1) Add"
echo "2) Subtract"
echo "3) Multiply"
echo "4) Divide"
echo "5) Percentage"

read -r -p "Choose operation: " op

case "$op" in
    1)
        echo "Result: $((a + b))"
        ;;
    2)
        echo "Result: $((a - b))"
        ;;
    3)
        echo "Result: $((a * b))"
        ;;
    4)
        if (( b == 0 )); then
            echo "Cannot divide by zero."
            exit 1
        fi
        echo "Result: $((a / b))"
        ;;
   5)
        if (( b == 0 )); then
            echo "Cannot compute percentage of zero."
            exit 1
        fi
        echo "Result: $(( a * 100 / b ))%"
        ;;

    *)
        echo "Invalid operation."
        ;;
esac


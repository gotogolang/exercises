#!/bin/bash
set -e
cd ~/exercise

EXPECTED="Hello, Go!"
GOT=$(go run main.go 2>&1)

if [ "$GOT" = "$EXPECTED" ]; then
    echo "OK: программа выводит правильную строку"
else
    echo "FAIL: вывод не совпадает"
    echo ""
    echo "Ожидается: $EXPECTED"
    echo "Получено:  $GOT"
    exit 1
fi

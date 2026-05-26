#!/bin/bash
cd ~/exercise

EXPECTED="Level: beginner"
GOT=$(go run main.go 2>&1)

if [ $? -ne 0 ]; then
    echo "FAIL: программа не компилируется"
    echo ""
    echo "$GOT"
    exit 1
fi

if [ "$GOT" = "$EXPECTED" ]; then
    echo "OK: ошибка найдена и исправлена верно"
else
    echo "FAIL: вывод не совпадает"
    echo ""
    echo "Ожидается: $EXPECTED"
    echo "Получено:  $GOT"
    exit 1
fi

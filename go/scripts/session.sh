#!/bin/bash
# Sets up the exercise workspace for a new session.
# Env vars provided by pool-service: EXERCISE_ID, EXERCISES_DIR
set -e

EXERCISES_DIR="${EXERCISES_DIR:-/exercises/go}"
EXERCISE_DIR="${EXERCISES_DIR}/${EXERCISE_ID}"

if [ -z "$EXERCISE_ID" ]; then
    echo "No exercise selected. Starting bare Go environment."
    exec bash
fi

if [ ! -d "$EXERCISE_DIR" ]; then
    echo "Exercise not found: $EXERCISE_ID"
    exit 1
fi

mkdir -p ~/exercise

if [ -d "${EXERCISE_DIR}/workspace" ]; then
    cp -r "${EXERCISE_DIR}/workspace/." ~/exercise/
fi

if [ -f "${EXERCISE_DIR}/check.sh" ]; then
    cp "${EXERCISE_DIR}/check.sh" /usr/local/bin/check
    chmod +x /usr/local/bin/check
fi

cd ~/exercise

[ -f go.mod ] || go mod init exercise 2>/dev/null

if [ -f "${EXERCISE_DIR}/task.md" ]; then
    echo ""
    cat "${EXERCISE_DIR}/task.md"
    echo ""
fi

exec bash

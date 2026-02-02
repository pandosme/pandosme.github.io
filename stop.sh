#!/bin/bash

# Check if PID file exists
if [ ! -f .jekyll.pid ]; then
    echo "No Jekyll server PID file found. Server may not be running."
    exit 1
fi

# Read PID and check if process is running
PID=$(cat .jekyll.pid)

if ps -p $PID > /dev/null 2>&1; then
    echo "Stopping Jekyll server (PID: $PID)..."
    kill $PID

    # Wait for process to stop
    sleep 1

    if ps -p $PID > /dev/null 2>&1; then
        echo "Process didn't stop gracefully, forcing..."
        kill -9 $PID
    fi

    rm -f .jekyll.pid
    echo "Jekyll server stopped."
else
    echo "Jekyll server is not running (PID: $PID not found)"
    rm -f .jekyll.pid
fi

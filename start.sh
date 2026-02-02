#!/bin/bash

# Check if Jekyll is already running
if [ -f .jekyll.pid ]; then
    PID=$(cat .jekyll.pid)
    if ps -p $PID > /dev/null 2>&1; then
        echo "Jekyll server is already running (PID: $PID)"
        echo "Visit http://localhost:4000"
        exit 0
    fi
fi

# Start Jekyll server
echo "Starting Jekyll server..."
bundle exec jekyll serve --livereload > jekyll.log 2>&1 &
PID=$!

# Save PID for stop script
echo $PID > .jekyll.pid

# Wait a moment to check if it started successfully
sleep 2

if ps -p $PID > /dev/null 2>&1; then
    echo "Jekyll server started successfully (PID: $PID)"
    echo "Visit http://localhost:4000"
    echo "Logs are in jekyll.log"
else
    echo "Failed to start Jekyll server. Check jekyll.log for errors."
    rm -f .jekyll.pid
    exit 1
fi

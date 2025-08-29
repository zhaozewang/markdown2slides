#!/bin/bash

echo "🚀 Starting slides development environment..."
echo ""

# Function to handle cleanup on exit
cleanup() {
    echo ""
    echo "🛑 Stopping development environment..."
    kill $WATCHER_PID 2>/dev/null
    kill $SERVER_PID 2>/dev/null
    exit 0
}

# Set up signal handling
trap cleanup INT TERM

# Start file watcher in background
echo "📁 Starting file watcher..."
while true; do
    # Watch for changes to slides.md
    fswatch -o slides.md | while read f; do
        echo "📝 Detected change in slides.md, compiling..."
        marp slides.md --no-stdin
        if [ $? -eq 0 ]; then
            echo "✅ Slides compiled successfully!"
        else
            echo "❌ Error compiling slides"
        fi
    done
done &
WATCHER_PID=$!

# Wait a moment for watcher to start
sleep 1

# Start live server in background
echo "🌐 Starting live server on http://localhost:8080..."
live-server --port=8080 --entry-file=slides.html --wait=1000 --quiet &
SERVER_PID=$!

# Wait for live server to start
sleep 2

echo ""
echo "🎉 Development environment ready!"
echo "📖 Open http://localhost:8080 in your browser"
echo "✏️  Edit slides.md in VS Code - changes will auto-compile and reload"
echo "🛑 Press Ctrl+C to stop"
echo ""

# Wait for user to stop
wait
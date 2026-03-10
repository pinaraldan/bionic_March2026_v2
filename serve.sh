#!/bin/bash
# Run this script to serve the experiment locally (required for audio/video to work)
cd "$(dirname "$0")"
PORT=8000
# Try alternate ports if 8000 is in use
for p in 8000 8080 3000 5500; do
  if ! lsof -i :$p >/dev/null 2>&1; then
    PORT=$p
    break
  fi
done
echo "=========================================="
echo "Serving at http://localhost:$PORT"
echo "Open in browser: http://localhost:$PORT/index.html"
echo "=========================================="
echo "Press Ctrl+C to stop"
python3 -m http.server $PORT

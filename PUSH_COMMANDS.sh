#!/bin/bash

# Commands to run after creating the GitHub repository
# Run these from /home/clawdbot/clawd/mcp-developer-toolkit

echo "🚀 Publishing MCP Developer Toolkit to GitHub..."

# Add remote origin (replace YOUR_USERNAME if different)
git remote add origin https://github.com/donshults/mcp-developer-toolkit.git

# Push to GitHub
git push -u origin main

echo "✅ Code pushed to GitHub!"
echo ""
echo "Next steps:"
echo "1. Go to https://github.com/donshults/mcp-developer-toolkit"
echo "2. Enable Discussions in Settings → General → Features"
echo "3. Create first release (v1.0.0)"
echo "4. Share with MCP community!"
#!/bin/bash

# MCP Developer Toolkit Installation Script
# Installs the mcp-dev command globally

set -e

INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="mcp-dev"

echo "🚀 Installing MCP Developer Toolkit..."

# Check if running as root or with sudo
if [[ $EUID -eq 0 ]]; then
    echo "✅ Running with root privileges"
elif sudo -v 2>/dev/null; then
    echo "✅ Sudo access confirmed"
    SUDO="sudo"
else
    echo "❌ This script requires sudo privileges to install to $INSTALL_DIR"
    echo "💡 Alternative: Copy 'mcp-dev' to a directory in your PATH manually"
    exit 1
fi

# Check Python version
if ! python3 --version &>/dev/null; then
    echo "❌ Python 3 is required but not found"
    echo "💡 Install Python 3: sudo apt update && sudo apt install python3 python3-venv python3-pip"
    exit 1
fi

PYTHON_VERSION=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
echo "🐍 Found Python $PYTHON_VERSION"

# Check required Python packages
echo "📦 Checking Python dependencies..."
if ! python3 -c "import requests" 2>/dev/null; then
    echo "📥 Installing requests package..."
    $SUDO python3 -m pip install requests
fi

# Make mcp-dev executable
chmod +x "$SCRIPT_NAME"

# Copy to system PATH
echo "📂 Installing to $INSTALL_DIR..."
$SUDO cp "$SCRIPT_NAME" "$INSTALL_DIR/"

# Verify installation
if command -v mcp-dev &>/dev/null; then
    echo ""
    echo "✅ MCP Developer Toolkit installed successfully!"
    echo ""
    echo "📋 Quick Start:"
    echo "  mcp-dev create context-vault --repo https://github.com/donshults/ThisIsDonsBrain.git"
    echo "  mcp-dev start context-vault"
    echo "  mcp-dev health context-vault"
    echo ""
    echo "📖 All commands:"
    echo "  mcp-dev list                    # Show all managed servers"
    echo "  mcp-dev create <name> --repo <url>  # Create new MCP server"
    echo "  mcp-dev start <name|all>        # Start server(s)"
    echo "  mcp-dev stop <name|all>         # Stop server(s)"
    echo "  mcp-dev restart <name>          # Restart server"
    echo "  mcp-dev update <name>           # Update from Git"
    echo "  mcp-dev health <name>           # Health check"
    echo "  mcp-dev status                  # Show all server status"
    echo ""
    echo "🗂️ Servers will be managed in: ~/mcp-servers/"
    echo ""
else
    echo "❌ Installation failed - mcp-dev command not found in PATH"
    echo "💡 Try running: export PATH=\"$INSTALL_DIR:\$PATH\""
    exit 1
fi
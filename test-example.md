# MCP Developer Toolkit Test

## Quick Test of the Toolkit

```bash
# Install the toolkit
cd /home/clawdbot/clawd/mcp-developer-toolkit
sudo ./install.sh

# Test basic functionality
mcp-dev list  # Should show empty list initially

# Create Context Vault MCP server
mcp-dev create context-vault --repo https://github.com/donshults/ThisIsDonsBrain.git --entry-point server.py --port 3000

# Check what was created
mcp-dev list

# Start the server
mcp-dev start context-vault

# Check if it's running
mcp-dev health context-vault

# Update it
mcp-dev update context-vault

# Stop it
mcp-dev stop context-vault
```

## What It Does

1. **Creates isolated environment** - Each MCP server gets its own Python venv
2. **Manages Git repos** - Clones, pulls updates automatically  
3. **Process management** - Start/stop without task manager
4. **Health checking** - Validates servers are working
5. **Clean organization** - Everything in `~/mcp-servers/`

## Directory Structure After Setup

```
~/mcp-servers/
├── registry.json                 # Server registry
└── context-vault/               # Your MCP server
    ├── .venv/                   # Isolated Python environment
    ├── server.py                # MCP server entry point
    ├── requirements.txt         # Dependencies
    ├── .env                     # Your configuration
    └── ... (rest of repo files)
```

## Benefits Over Manual Management

❌ **Before:** Manual file copying, task manager, environment chaos  
✅ **After:** One command to create, start, update, health check

Perfect for your 3+ MCP server development workflow!
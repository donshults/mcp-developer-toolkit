# Context Vault MCP Server Setup

## Replace Your Manual Workflow

### Before (Your Current Process)
```
1. Manually copy new files to MCP server folder
2. Manage Python environment and requirements
3. Set up .env configuration  
4. Test MCP connectivity
5. Kill processes with task manager
6. Hope everything works
```

### After (With MCP Developer Toolkit)
```bash
# One-time setup
mcp-dev create context-vault --repo https://github.com/donshults/ThisIsDonsBrain.git --entry-point server.py

# Daily development
mcp-dev update context-vault    # git pull + restart
mcp-dev health context-vault    # test connectivity
```

## Step-by-Step Context Vault Setup

### 1. Install the Toolkit
```bash
cd /home/clawdbot/clawd/mcp-developer-toolkit
sudo ./install.sh
```

### 2. Create Context Vault Server
```bash
# This will:
# - Clone your repo to ~/mcp-servers/context-vault/
# - Create isolated Python environment
# - Install requirements.txt dependencies
# - Register in toolkit registry

mcp-dev create context-vault \
  --repo https://github.com/donshults/ThisIsDonsBrain.git \
  --entry-point server.py \
  --port 3000 \
  --health-path /health
```

### 3. Configure Environment
```bash
# Edit your .env file as needed
nano ~/mcp-servers/context-vault/.env

# Or copy your existing config
cp /your/current/.env ~/mcp-servers/context-vault/.env
```

### 4. Start and Test
```bash
# Start the MCP server
mcp-dev start context-vault

# Verify it's working
mcp-dev health context-vault

# Check process status
mcp-dev status
```

### 5. Development Workflow
```bash
# When you push changes to GitHub, update locally:
mcp-dev update context-vault    # git pull + pip install + restart

# Check if update broke anything:
mcp-dev health context-vault

# View what's running:
mcp-dev list

# Stop when done developing:
mcp-dev stop context-vault
```

## Multiple MCP Servers (Your 3+ Servers)

```bash
# Create different servers from different repos
mcp-dev create context-vault --repo https://github.com/donshults/ThisIsDonsBrain.git
mcp-dev create file-manager --repo https://github.com/user/file-mcp.git  
mcp-dev create database-tool --repo https://github.com/user/db-mcp.git

# Start them all
mcp-dev start all

# Check status of all
mcp-dev status

# Update specific one
mcp-dev update context-vault

# Health check specific one
mcp-dev health context-vault
```

## Troubleshooting

### Server Won't Start
```bash
# Check what's in the directory
ls -la ~/mcp-servers/context-vault/

# Make sure requirements installed
mcp-dev update context-vault  # Will reinstall requirements

# Check registry
cat ~/mcp-servers/registry.json
```

### Process Management Issues
```bash
# Force stop if needed
mcp-dev stop context-vault

# Check if anything is still running
mcp-dev status

# Start fresh
mcp-dev start context-vault
```

### Configuration Issues
```bash
# Test health endpoint directly
curl http://localhost:3000/health

# Or test your API endpoint
curl http://localhost:3000/memories
```

## Integration with Claude Desktop

Your Claude Desktop config remains the same:
```json
{
  "mcpServers": {
    "context-vault": {
      "command": "python",
      "args": ["/home/callteksupport/mcp-servers/context-vault/server.py"],
      "env": {
        "API_KEY": "your-key"
      }
    }
  }
}
```

Just update the path to point to the toolkit-managed version.

## Benefits for Your Workflow

✅ **No more manual file copying** - Git handles code updates  
✅ **No more task manager** - Clean process start/stop  
✅ **No more environment issues** - Isolated Python per server  
✅ **No more broken configs** - Environment preserved during updates  
✅ **Easy health checking** - Know if your servers are working  
✅ **Multiple server management** - Handle all your MCP servers  

This turns MCP server development from a manual chore into a professional workflow! 🔧
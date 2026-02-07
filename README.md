# MCP Developer Toolkit

**Professional lifecycle management for MCP servers** - from setup to deployment to testing.

## The Problem with MCP Development

Current MCP server development is painful:
- ❌ Manual file copying between repositories and client machines
- ❌ Managing Python environments for each server
- ❌ Hunting down crashed processes in task manager
- ❌ No standardized way to organize MCP server code in repositories
- ❌ Complex update workflows when MCP servers change
- ❌ No isolation between different MCP servers

## The Solution

**One toolkit to rule them all:**

```bash
# Create clean MCP server from any repo
mcp-dev create tastytrade --repo https://github.com/company/tastytrade-integration.git

# Professional management
mcp-dev start tastytrade
mcp-dev update tastytrade      # git pull + restart
mcp-dev health tastytrade      # test connectivity  
mcp-dev list                   # show all servers
```

## Repository Standard

This toolkit establishes a **standard convention** for MCP server distribution:

```
your-saas-project/
├── src/              # Your main application
├── api/              # Your web API  
├── docs/
└── mcp-server/       # 🎯 STANDARD: MCP client files here
    ├── server.py
    ├── requirements.txt
    ├── .env.example
    └── README.md
```

**Benefits:**
- ✅ **Predictable** - Developers always know where to find MCP server code
- ✅ **Toolkit friendly** - Auto-detection works out of the box
- ✅ **Clean separation** - MCP code isolated from main application
- ✅ **Ecosystem standard** - Everyone follows the same pattern

## Features

### 🚀 **Server Lifecycle**
- Create new MCP servers from any Git repository
- Automatic Python virtual environment setup
- Requirements installation and dependency management
- Process management (start/stop/restart/status)

### 🔍 **Development Tools**
- Health check validation (`/health` endpoint testing)
- Log tailing and debugging
- Configuration validation
- Connectivity testing

### 🛠️ **Environment Management**
- Isolated Python environments per server
- Automatic requirements.txt handling
- Environment variable management (.env files)
- Clean process cleanup (no more task manager!)

### 📦 **Multi-Server Support**
- Manage unlimited MCP servers
- Different repositories per server
- Independent configurations and environments
- Bulk operations (start/stop all)

## Quick Start

```bash
# Install toolkit
cd /home/clawdbot/clawd/mcp-developer-toolkit
sudo ./install.sh

# Create your first MCP server
mcp-dev create context-vault --repo https://github.com/donshults/ThisIsDonsBrain.git

# Start and test
mcp-dev start context-vault
mcp-dev health context-vault
mcp-dev logs context-vault
```

## Use Cases

### Context Vault Development
```bash
# Set up Context Vault MCP server
mcp-dev create context-vault --repo https://github.com/donshults/ThisIsDonsBrain.git --path server.py

# Update with latest changes
mcp-dev update context-vault

# Test it's working
mcp-dev health context-vault
```

### Multiple MCP Servers
```bash
# Different MCP servers for different purposes
mcp-dev create context-vault --repo https://github.com/donshults/ThisIsDonsBrain.git
mcp-dev create file-manager --repo https://github.com/user/file-mcp.git  
mcp-dev create database-tool --repo https://github.com/user/db-mcp.git

# Manage them all
mcp-dev list
mcp-dev start all
mcp-dev status
```

## Architecture

```
MCP Developer Toolkit
├── Server Registry (tracks all MCP servers)
├── Environment Manager (Python venvs per server)
├── Process Manager (start/stop/restart)
├── Health Monitor (connectivity testing)
├── Update Manager (git pull + restart)
└── Configuration Manager (.env, configs)
```

## Commands Reference

### Server Management
- `mcp-dev create <name> --repo <url>` - Create new MCP server
- `mcp-dev list` - Show all managed servers
- `mcp-dev start <name|all>` - Start server(s)
- `mcp-dev stop <name|all>` - Stop server(s)
- `mcp-dev restart <name>` - Restart server
- `mcp-dev status` - Show running status
- `mcp-dev remove <name>` - Remove server completely

### Development
- `mcp-dev update <name>` - Git pull latest changes
- `mcp-dev install <name>` - Install/update requirements
- `mcp-dev logs <name>` - Tail server logs
- `mcp-dev shell <name>` - Enter server's Python environment

### Testing
- `mcp-dev health <name>` - Test health endpoint
- `mcp-dev test-config <name>` - Validate configuration
- `mcp-dev connect <name>` - Test MCP connectivity

(Implementation coming next...)
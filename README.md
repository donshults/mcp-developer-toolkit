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

### Installation

```bash
# Clone and install
git clone https://github.com/donshults/mcp-developer-toolkit.git
cd mcp-developer-toolkit
sudo ./install.sh
```

### Basic Usage

```bash
# Create MCP server from standardized repo (auto-detects /mcp-server/)
mcp-dev create my-server --repo https://github.com/user/project.git

# Or for legacy/custom structure
mcp-dev create my-server --repo URL --subfolder custom_folder

# Manage your MCP servers
mcp-dev start my-server       # Start the server
mcp-dev list                  # Show all servers
mcp-dev update my-server      # Git pull + restart  
mcp-dev health my-server      # Test connectivity
mcp-dev stop my-server        # Clean shutdown
```

### Real Example - Context Vault

```bash
# Context Vault uses legacy structure (mcp_server folder)
mcp-dev create context-vault \
  --repo https://github.com/donshults/ThisIsDonsBrain.git \
  --subfolder mcp_server

# Start and verify
mcp-dev start context-vault
mcp-dev status               # Check if running
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

## Community & Support

### Contributing
We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**Quick ways to help:**
- ⭐ Star the repository 
- 🐛 Report bugs and issues
- 💡 Suggest features
- 🔧 Submit pull requests
- 📖 Improve documentation
- 🧪 Test with your MCP servers

### Getting Help
- **Issues**: [GitHub Issues](https://github.com/donshults/mcp-developer-toolkit/issues) for bugs and feature requests
- **Discussions**: Use GitHub Discussions for questions
- **Standard Questions**: Use the "Repository Standard Question" issue template

### Repository Standard Adoption
Help establish `/mcp-server/` as the ecosystem standard:

1. **Use the standard** in your MCP server repositories
2. **Share feedback** on what works/doesn't work
3. **Spread the word** to other MCP developers
4. **Contribute examples** of well-structured MCP repositories

## Roadmap

- [ ] **Virtual Environment Support** - Full isolation per MCP server
- [ ] **Health Check Enhancements** - Better connectivity testing
- [ ] **Windows Support** - Cross-platform compatibility  
- [ ] **VSCode Extension** - IDE integration for MCP development
- [ ] **Web Dashboard** - GUI for managing MCP servers
- [ ] **Package Distribution** - PyPI/npm packages for easier installation

## License

MIT License - see [LICENSE](LICENSE) file for details.
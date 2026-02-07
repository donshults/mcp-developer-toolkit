# Contributing to MCP Developer Toolkit

Thank you for your interest in contributing! This toolkit aims to standardize and simplify MCP server development.

## Getting Started

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test with your own MCP servers
5. Submit a pull request

## Development Setup

```bash
# Clone your fork
git clone https://github.com/your-username/mcp-developer-toolkit.git
cd mcp-developer-toolkit

# Install for development
sudo ./install.sh

# Test with a sample MCP server
mcp-dev create test-server --repo https://github.com/example/mcp-test.git
```

## Repository Standard

When contributing examples or testing, please follow the `/mcp-server/` standard:

```
your-test-repo/
└── mcp-server/          # MCP server files here
    ├── server.py
    ├── requirements.txt
    └── README.md
```

## Areas for Contribution

### High Priority
- **Health Check Improvements** - Better MCP server connectivity testing
- **Dependency Management** - Virtual environment enhancements
- **Error Handling** - Better error messages and recovery
- **Windows Support** - Cross-platform compatibility

### Medium Priority
- **Configuration Templates** - Common MCP server setups
- **Documentation** - More usage examples
- **Integration Testing** - Automated testing framework
- **Package Management** - PyPI/npm distribution

### Community Requests
- **IDE Integration** - VSCode extension for MCP development
- **Monitoring Dashboard** - Web UI for managing MCP servers
- **Docker Support** - Containerized MCP server management

## Testing Guidelines

- Test with multiple MCP server repositories
- Verify both `/mcp-server/` standard and legacy structures
- Test on different Python versions (3.8+)
- Include examples in your PRs

## Code Style

- Follow PEP 8 for Python code
- Clear, descriptive variable names
- Comments for complex logic
- Keep functions focused and small

## Reporting Issues

When reporting issues, please include:

1. **MCP server repository** you're trying to manage
2. **Command that failed** with full output
3. **Expected vs actual behavior**
4. **System information** (OS, Python version)

## Pull Request Guidelines

1. **Clear description** of what the PR accomplishes
2. **Test cases** or examples of usage
3. **Documentation updates** if adding features
4. **Backward compatibility** - don't break existing workflows

## Community

- **Discord**: Join the MCP community discussions
- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and ideas

Together we can make MCP development professional and enjoyable! 🔧
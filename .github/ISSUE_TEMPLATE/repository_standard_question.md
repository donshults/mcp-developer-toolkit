---
name: Repository Standard Question
about: Questions about the /mcp-server/ directory standard
title: '[STANDARD] '
labels: documentation, question
assignees: ''

---

## Repository Structure Question
I have a question about organizing my MCP server repository to work with this toolkit.

## Current Repository Structure
Describe your current repository structure:

```
my-repo/
├── src/
├── api/
├── mcp_files/          # or wherever your MCP server is
│   ├── server.py
│   └── requirements.txt
└── other-stuff/
```

## Question
What specific question do you have about the `/mcp-server/` standard?

## Context
- Are you migrating an existing MCP server?
- Are you creating a new MCP server?
- Are you trying to use the toolkit with an existing repository?

## Repository URL (Optional)
If you can share the repository URL, that would help us provide specific guidance:

## Desired Outcome
What are you trying to achieve?

---

## Quick Reference

**Standard Structure:**
```
your-project/
└── mcp-server/         # Standard location
    ├── server.py       # MCP server entry point
    ├── requirements.txt # Python dependencies
    ├── .env.example    # Configuration template
    └── README.md       # MCP-specific documentation
```

**Toolkit Commands:**
```bash
# For standard structure
mcp-dev create myserver --repo https://github.com/user/repo.git

# For custom structure  
mcp-dev create myserver --repo URL --subfolder custom_folder_name
```
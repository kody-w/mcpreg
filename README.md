<!-- retired-notice:start -->
> **Archived.** No longer maintained; kept public for reference.
<!-- retired-notice:end -->

# MCP Registry (mcpreg)

A universal discovery registry for Model Context Protocol (MCP) servers, enabling AI agents and developers to find and integrate MCP-compatible tools.

## 🌟 Features

- **GitHub-Based Storage**: Stores MCP server definitions as JSON files
- **Self-Contained HTML**: Single file that can be hosted on GitHub Pages
- **Local-First with Cloud Sync**: Works offline with automatic GitHub synchronization
- **Agent-Friendly API**: Provides structured JSON data for AI consumption
- **Visual Management UI**: Add, browse, and manage MCP servers through a web interface

## 🚀 Quick Start

1. Fork this repository
2. Enable GitHub Pages (Settings → Pages → Deploy from branch → main → / (root))
3. Access your registry at `https://[your-username].github.io/mcpreg/`

## 📁 Repository Structure
mcpreg/
├── index.html          # Main registry UI and functionality
├── registry.json       # Master registry file (optional)
├── servers/           # Individual server definition files
│   └── *.json
├── .well-known/       # Well-known URIs for discovery
│   └── mcp-manifest.json
├── api/               # API endpoints
│   └── mcp-registry.json
└── docs/              # Additional documentation

## 🔧 Adding MCP Servers

### Via UI
1. Visit your registry page
2. Click "+ Add Server"
3. Fill in server details and tools
4. Export and commit to GitHub

### Via JSON Files
Create a JSON file in the `servers/` directory:

```json
{
  "id": "unique-server-id",
  "name": "Server Name",
  "url": "https://server.url/mcp",
  "description": "What this server does",
  "category": "Documentation",
  "version": "1.0",
  "transport": "stdio",
  "tools": [
    {
      "name": "tool_name",
      "description": "What this tool does",
      "parameters": {
        "param1": "string",
        "param2": "number?"
      }
    }
  ]
}
🤖 For AI Agents
Access the registry data at:

Full Registry: /api/mcp-registry.json
Manifest: /.well-known/mcp-manifest.json

📄 License
MIT License - feel free to use and modify as needed.

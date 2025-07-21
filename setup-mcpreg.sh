#!/bin/bash

# MCP Registry Setup Script
# This script creates the file structure for the mcpreg repository

echo "🚀 Setting up MCP Registry (mcpreg) file structure..."

# Create the main directories
echo "📁 Creating directory structure..."
mkdir -p servers
mkdir -p .well-known
mkdir -p api
mkdir -p docs

# Create a README.md
echo "📝 Creating README.md..."
cat > README.md << 'EOF'
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
EOF
Create an example server file
echo "📄 Creating example server files..."
cat > servers/documentation-server.json << 'EOF'
{
"id": "docs-server-001",
"name": "Documentation Server",
"url": "https://docs.example.com/mcp",
"description": "Interactive documentation with search and component discovery",
"category": "Documentation",
"version": "1.0",
"transport": "stdio",
"tools": [
{
"name": "search_docs",
"description": "Search through documentation",
"parameters": {
"query": "string",
"category": "string?",
"limit": "number?"
}
},
{
"name": "get_page",
"description": "Retrieve a specific documentation page",
"parameters": {
"path": "string",
"format": "string?"
}
},
{
"name": "list_components",
"description": "List all available components",
"parameters": {
"filter": "string?"
}
}
],
"metadata": {
"author": "Example Corp",
"license": "MIT",
"homepage": "https://example.com",
"tags": ["documentation", "search", "components"]
}
}
EOF
Create another example server
cat > servers/github-integration.json << 'EOF'
{
"id": "github-mcp-001",
"name": "GitHub Integration",
"url": "github://mcp/api",
"description": "Access GitHub repositories, issues, pull requests, and actions",
"category": "Development",
"version": "1.0",
"transport": "stdio",
"tools": [
{
"name": "search_code",
"description": "Search code across repositories",
"parameters": {
"query": "string",
"language": "string?",
"repo": "string?",
"user": "string?"
}
},
{
"name": "list_issues",
"description": "List repository issues",
"parameters": {
"repo": "string",
"state": "string?",
"labels": "string[]?",
"assignee": "string?"
}
},
{
"name": "create_issue",
"description": "Create a new GitHub issue",
"parameters": {
"repo": "string",
"title": "string",
"body": "string",
"labels": "string[]?",
"assignees": "string[]?"
}
},
{
"name": "get_pull_request",
"description": "Get details of a pull request",
"parameters": {
"repo": "string",
"pr_number": "number"
}
}
],
"metadata": {
"author": "GitHub Tools Inc",
"license": "MIT",
"homepage": "https://github.com",
"tags": ["github", "development", "vcs", "collaboration"]
}
}
EOF
Create a data analysis server example
cat > servers/data-analysis.json << 'EOF'
{
"id": "data-analysis-001",
"name": "Data Analysis Server",
"url": "https://analytics.example.com/mcp",
"description": "Perform data analysis, visualization, and statistical computations",
"category": "Analytics",
"version": "1.0",
"transport": "stdio",
"tools": [
{
"name": "analyze_csv",
"description": "Analyze CSV data and provide insights",
"parameters": {
"file_path": "string",
"analysis_type": "string",
"columns": "string[]?"
}
},
{
"name": "create_visualization",
"description": "Create data visualizations",
"parameters": {
"data": "object",
"chart_type": "string",
"options": "object?"
}
},
{
"name": "statistical_test",
"description": "Perform statistical tests on data",
"parameters": {
"test_type": "string",
"data_sets": "array",
"confidence_level": "number?"
}
}
],
"metadata": {
"author": "DataViz Corp",
"license": "Apache-2.0",
"homepage": "https://dataviz.example.com",
"tags": ["analytics", "visualization", "statistics", "data"]
}
}
EOF
Create an optional master registry file
echo "📋 Creating master registry file..."
cat > registry.json << 'EOF'
{
"version": "2.0",
"lastUpdated": "2024-01-20T12:00:00Z",
"servers": []
}
EOF
Create .well-known manifest
echo "🔍 Creating .well-known manifest..."
cat > .well-known/mcp-manifest.json << 'EOF'
{
"version": "2.0",
"name": "MCP Registry",
"description": "Universal discovery registry for Model Context Protocol servers",
"registry_endpoint": "/api/mcp-registry.json",
"documentation": "https://github.com/kody-w/mcpreg",
"supported_features": [
"server_discovery",
"tool_search",
"category_filtering",
"version_tracking",
"metadata_storage"
]
}
EOF
Create API directory placeholder
echo "🌐 Creating API endpoint placeholder..."
cat > api/mcp-registry.json << 'EOF'
{
"notice": "This file is dynamically generated by the registry system. Access the live registry at the root URL."
}
EOF
Create a simple GitHub Actions workflow for validation
echo "⚙️ Creating GitHub Actions workflow..."
mkdir -p .github/workflows
cat > .github/workflows/validate-servers.yml << 'EOF'
name: Validate MCP Servers
on:
push:
paths:
- 'servers/.json'
- 'registry.json'
pull_request:
paths:
- 'servers/.json'
- 'registry.json'
jobs:
validate:
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v3
  - name: Validate JSON files
    run: |
      echo "Validating server JSON files..."
      for file in servers/*.json; do
        if [ -f "$file" ]; then
          echo "Checking $file"
          jq empty "$file" || exit 1
          echo "✓ $file is valid JSON"
        fi
      done
      
      if [ -f "registry.json" ]; then
        echo "Checking registry.json"
        jq empty "registry.json" || exit 1
        echo "✓ registry.json is valid JSON"
      fi
      
  - name: Check required fields
    run: |
      echo "Checking required fields in server files..."
      for file in servers/*.json; do
        if [ -f "$file" ]; then
          echo "Checking $file"
          jq -e '.id and .name and .url and .description and .category and .tools' "$file" > /dev/null || {
            echo "❌ $file is missing required fields"
            exit 1
          }
          echo "✓ $file has all required fields"
        fi
      done
EOF
Create .gitignore
echo "🚫 Creating .gitignore..."
cat > .gitignore << 'EOF'
OS files
.DS_Store
Thumbs.db
Editor files
.vscode/
.idea/
*.swp
*.swo
*~
Temporary files
*.tmp
*.temp
*.log
Node modules (if you add any build tools later)
node_modules/
Environment files
.env
.env.local
EOF
Create docs directory with additional documentation
echo "📚 Creating documentation..."
cat > docs/server-specification.md << 'EOF'
MCP Server Specification
Required Fields

id (string): Unique identifier for the server
name (string): Human-readable name
url (string): Server endpoint URL
description (string): What the server does
category (string): One of: Documentation, Development, Data, DevOps, Communication, Analytics, Other
tools (array): List of available tools

Tool Structure
Each tool must have:

name (string): Tool identifier
description (string): What the tool does
parameters (object): Key-value pairs of parameter names and types

Parameter Types

string: Text input
number: Numeric input
boolean: True/false
array: List of values
object: Complex object
Add ? suffix for optional parameters (e.g., string?)

Example
json{
  "id": "example-server",
  "name": "Example Server",
  "url": "https://example.com/mcp",
  "description": "An example MCP server",
  "category": "Other",
  "version": "1.0",
  "transport": "stdio",
  "tools": [
    {
      "name": "example_tool",
      "description": "Does something useful",
      "parameters": {
        "required_param": "string",
        "optional_param": "number?"
      }
    }
  ],
  "metadata": {
    "author": "Your Name",
    "license": "MIT",
    "homepage": "https://example.com"
  }
}
EOF
Make the script executable
chmod +x "$0"
echo "✅ MCP Registry file structure created successfully!"
echo ""
echo "📂 Created structure:"
echo "   ├── index.html (main registry - copy from artifact)"
echo "   ├── README.md"
echo "   ├── registry.json"
echo "   ├── servers/"
echo "   │   ├── documentation-server.json"
echo "   │   ├── github-integration.json"
echo "   │   └── data-analysis.json"
echo "   ├── .well-known/"
echo "   │   └── mcp-manifest.json"
echo "   ├── api/"
echo "   │   └── mcp-registry.json"
echo "   ├── docs/"
echo "   │   └── server-specification.md"
echo "   ├── .github/"
echo "   │   └── workflows/"
echo "   │       └── validate-servers.yml"
echo "   └── .gitignore"
echo ""
echo "🎯 Next steps:"
echo "   1. Copy the index.html from the artifact to this directory"
echo "   2. Initialize git: git init"
echo "   3. Add files: git add ."
echo "   4. Commit: git commit -m 'Initial MCP Registry setup'"
echo "   5. Add remote: git remote add origin https://github.com/kody-w/mcpreg.git"
echo "   6. Push: git push -u origin main"
echo "   7. Enable GitHub Pages in repository settings"
echo ""
echo "🌐 Your registry will be available at: https://kody-w.github.io/mcpreg/"
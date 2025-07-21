#!/usr/bin/env python3
"""
Create MCP Jokes Server JSON file for the registry
"""

import json
import os
from pathlib import Path

# The Jokes MCP Server configuration
jokes_server = {
    "id": "mcp-jokes-server-001",
    "name": "Jokes SSE Server",
    "url": "https://mcpwebappkjw-fehvd9e7esbmdfc0.eastus2-01.azurewebsites.net",
    "description": "A server that provides various types of jokes including Chuck Norris, Dad jokes, and Yo Mama jokes via Server-Sent Events",
    "category": "Entertainment",
    "version": "1.0.0",
    "transport": "sse",
    "type": "remote",
    "endpoints": {
        "base": "https://mcpwebappkjw-fehvd9e7esbmdfc0.eastus2-01.azurewebsites.net",
        "sse": "/sse",
        "messages": "/jokes"
    },
    "tools": [
        {
            "name": "get-chuck-joke",
            "description": "Get a random Chuck Norris joke",
            "parameters": {}
        },
        {
            "name": "get-chuck-categories",
            "description": "Get all available categories for Chuck Norris jokes",
            "parameters": {}
        },
        {
            "name": "get-dad-joke",
            "description": "Get a random dad joke",
            "parameters": {}
        },
        {
            "name": "get-yo-mama-joke",
            "description": "Get a random Yo Mama joke",
            "parameters": {}
        }
    ],
    "connectionInfo": {
        "protocol": "Server-Sent Events (SSE)",
        "authentication": "None",
        "sessionManagement": "Automatic via SSE transport",
        "instructions": [
            "1. Connect to SSE endpoint: /sse",
            "2. Server responds with session URL in format: /jokes?sessionId={uuid}",
            "3. Send POST requests to the session URL for tool execution"
        ]
    },
    "exampleUsage": {
        "connect": "GET https://mcpwebappkjw-fehvd9e7esbmdfc0.eastus2-01.azurewebsites.net/sse",
        "response": "event: endpoint\\ndata: https://mcpwebappkjw-fehvd9e7esbmdfc0.eastus2-01.azurewebsites.net/jokes?sessionId=ae455340-1bf7-491e-b87f-f9594149f14c",
        "toolCall": "POST to the session URL with MCP protocol messages"
    },
    "metadata": {
        "author": "MCP Community",
        "hosting": "Azure Web Apps",
        "region": "East US 2",
        "status": "active",
        "public": True,
        "sourceCode": "TypeScript + Express",
        "apiSources": [
            "api.chucknorris.io",
            "icanhazdadjoke.com",
            "yomama-jokes.com"
        ]
    }
}

def create_jokes_server_json():
    """Create the jokes server JSON file in the servers directory"""
    
    # Create servers directory if it doesn't exist
    servers_dir = Path("servers")
    servers_dir.mkdir(exist_ok=True)
    
    # Write the jokes server JSON file
    jokes_file_path = servers_dir / "mcp-jokes-server.json"
    
    with open(jokes_file_path, 'w', encoding='utf-8') as f:
        json.dump(jokes_server, f, indent=2, ensure_ascii=False)
    
    print(f"✅ Created: {jokes_file_path}")
    
    # Also update or create the main registry.json file
    registry_path = Path("registry.json")
    
    # Load existing registry or create new one
    if registry_path.exists():
        with open(registry_path, 'r', encoding='utf-8') as f:
            registry = json.load(f)
        print(f"📄 Loaded existing registry.json")
    else:
        registry = {
            "version": "2.0",
            "name": "MCP Registry",
            "description": "Community registry of Model Context Protocol servers",
            "lastUpdated": "",
            "categories": [],
            "servers": []
        }
        print(f"📄 Creating new registry.json")
    
    # Update registry
    from datetime import datetime
    registry["lastUpdated"] = datetime.now().isoformat()
    
    # Add categories if not present
    if "Entertainment" not in registry.get("categories", []):
        registry.setdefault("categories", []).append("Entertainment")
    
    # Check if jokes server already exists
    server_exists = False
    for i, server in enumerate(registry.get("servers", [])):
        if server.get("id") == jokes_server["id"]:
            registry["servers"][i] = jokes_server
            server_exists = True
            print(f"🔄 Updated existing jokes server in registry")
            break
    
    # Add server if it doesn't exist
    if not server_exists:
        registry.setdefault("servers", []).append(jokes_server)
        print(f"➕ Added jokes server to registry")
    
    # Write updated registry
    with open(registry_path, 'w', encoding='utf-8') as f:
        json.dump(registry, f, indent=2, ensure_ascii=False)
    
    print(f"✅ Updated: {registry_path}")
    print(f"\n📁 Files created/updated:")
    print(f"   - servers/mcp-jokes-server.json")
    print(f"   - registry.json")
    print(f"\n🎉 You can now commit these changes to your repository!")

if __name__ == "__main__":
    create_jokes_server_json()
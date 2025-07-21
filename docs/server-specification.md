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

# Python Code Quality Plugin

This plugin provides automatic code quality checks for Python projects using modern tooling.

## Features

Automatically runs before Edit and Write operations:
- **Format**: `uv run ruff format` - Auto-formats Python code
- **Lint**: `uv run ruff check --fix` - Lints and auto-fixes issues
- **Type Check**: `uv run ty check` - Validates type annotations

## Requirements

- `uv` package manager
- `ruff` formatter and linter
- `ty` type checker

Install with:
```bash
uv add --dev ruff ty
```

## How It Works

This is a hooks-only plugin (no skills). It uses `PreToolUse` hooks to run code quality tools automatically before Claude modifies Python files.

## Configuration

All configuration is defined inline in the marketplace catalog with `strict: false`, meaning this plugin doesn't require a `plugin.json` file.

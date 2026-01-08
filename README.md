# narumi-marketplace

A working example of a Claude Code plugin marketplace with development tools and comprehensive documentation.

## About This Repository

This repository serves two purposes:

1. **Working Marketplace**: Install plugins for Python development (code quality hooks and Peewee ORM patterns)
2. **Documentation & Examples**: Learn how to create your own plugin marketplace (see [GUIDE.md](GUIDE.md))

## Available Plugins

### python-code-quality

Python code quality hooks that automatically run before Edit/Write operations:
- `uv run ruff format` - Auto-format code
- `uv run ruff check --fix` - Lint and auto-fix issues
- `uv run ty check` - Type checking

**Type**: Hooks plugin (PreToolUse)

### python-peewee

Patterns for using Peewee ORM with DatabaseProxy and scoped connections/transactions:
- DatabaseProxy setup patterns
- Connection context and atomic transaction examples
- Testing patterns with SQLite

**Type**: Skill plugin (provides Claude with Peewee expertise)

## Installation

### Add this marketplace

From GitHub:
```shell
/plugin marketplace add narumi/claude-marketplace
```

Or for local testing:
```shell
/plugin marketplace add ./path/to/claude-marketplace
```

### Install plugins

```shell
# Install code quality hooks
/plugin install python-code-quality@narumi-marketplace

# Install Peewee ORM skill
/plugin install python-peewee@narumi-marketplace
```

## Testing & Validation

Validate the marketplace structure:
```shell
/plugin validate .
```

Test locally before publishing:
```shell
/plugin marketplace add .
/plugin list
/plugin install python-peewee@narumi-marketplace
```

## Documentation

- **[GUIDE.md](GUIDE.md)** - Complete guide for creating and distributing Claude Code plugin marketplaces
- **[CLAUDE.md](CLAUDE.md)** - Developer guidance for working with this repository

## Learn More

This marketplace demonstrates:
- Hooks-based plugins (python-code-quality)
- Skill-based plugins (python-peewee)
- Using `strict: false` for inline plugin definitions
- Organizing plugins in `skills/` directory
- Marketplace validation and testing

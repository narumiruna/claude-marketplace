# narumi-marketplace

Narumi's plugin marketplace for Claude Code development tools.

## Available Plugins

### python-code-quality

Python code quality hooks that automatically run before Edit/Write operations:
- `uv run ruff format` - Auto-format code
- `uv run ruff check --fix` - Lint and auto-fix issues
- `uv run ty check` - Type checking

### python-peewee

Peewee ORM expert skill for Python database operations:
- Best practices for model definition and relationships
- Efficient query patterns and transaction handling
- Database-agnostic patterns and migration strategies

## Installation

### Add this marketplace

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

## Documentation

See [GUIDE.md](GUIDE.md) for comprehensive documentation on creating and distributing Claude Code plugin marketplaces.
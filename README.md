# narumi

A working example of a Claude Code plugin marketplace with development tools and comprehensive documentation.

## About This Repository

This repository serves two purposes:

1. **Working Marketplace**: Install plugins for Python development (code quality hooks, project workflow standards, and ORM patterns)
2. **Documentation & Examples**: Learn how to create your own plugin marketplace (see [GUIDE.md](GUIDE.md))

## Available Plugins

### python-code-quality

Python code quality hooks that automatically run before Edit/Write operations:
- `uv run ruff format` - Auto-format code
- `uv run ruff check --fix` - Lint and auto-fix issues
- `uv run ty check` - Type checking

**Type**: Hooks plugin (PreToolUse)

### python-skills

Comprehensive Python development toolkit combining project workflow standards and ORM patterns:

**Python Project Workflow** (`python-project` skill):
- Modern tooling: uv, ruff, pytest, ty, typer, loguru
- Project setup and dependency management
- Testing, type checking, and linting patterns
- CLI development with typer
- Logging best practices with loguru

**Peewee ORM Patterns** (`python-peewee` skill):
- DatabaseProxy setup patterns
- Connection context and atomic transaction examples
- Testing patterns with SQLite

**Type**: Skill plugin (provides Claude with Python development expertise)

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
/plugin install python-code-quality@narumi

# Install Python development skills (includes project workflow + Peewee ORM)
/plugin install python-skills@narumi
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
/plugin install python-skills@narumi
```

## Documentation

- **[GUIDE.md](GUIDE.md)** - Complete guide for creating and distributing Claude Code plugin marketplaces
- **[CLAUDE.md](CLAUDE.md)** - Developer guidance for working with this repository

## Learn More

This marketplace demonstrates:
- Hooks-based plugins (python-code-quality)
- Multi-skill plugins (python-skills with multiple skills)
- Using `strict: false` for inline plugin definitions
- Organizing skills in `skills/` directory
- Marketplace validation and testing

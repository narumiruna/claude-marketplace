---
name: python-project
description: Python project workflow and standards using Astral uv for environments/dependencies, ty for type checking, typer for CLI, ruff for lint/format, pytest and pytest-cov for tests/coverage, and loguru for logging. Use for Python 3.12+ project setup, dependency management, CLI/logging patterns, type checking, testing, linting/formatting, and packaging guidance.
---

# Python Project

## Overview

Build and maintain Python 3.12+ projects with modern tooling and best practices. This skill covers project setup, dependency management, quality tools, CLI patterns, and packaging workflows.

**Key Tools:**
- **uv**: Fast Python package installer and environment manager
- **ruff**: Lightning-fast linter and formatter
- **pytest**: Testing framework with coverage support
- **ty**: Static type checker
- **typer**: Modern CLI framework
- **loguru**: Simplified logging

For Python coding conventions, see the `python-conventions` skill.

## Quick Start (New Project)

**1. Initialize project with Python 3.12+:**

```bash
uv init my-project --python 3.12
cd my-project
```

**2. Add runtime dependencies:**

```bash
uv add loguru typer
```

**3. Add development dependencies:**

```bash
uv add --dev ruff pytest pytest-cov ty
```

**4. Verify setup:**

```bash
uv run python -V
# Should show Python 3.12+
```

## Project Layout

Use a `src/` layout for better import clarity and testing isolation:

```
my-project/
├── src/
│   └── my_project/
│       ├── __init__.py
│       ├── cli.py
│       └── core.py
├── tests/
│   ├── __init__.py
│   └── test_core.py
├── pyproject.toml
└── README.md
```

**Benefits of src/ layout:**
- Prevents accidentally importing from project directory
- Forces installation for testing
- Clearer separation between source and tests

## Dependency Management

**Basic Operations:**
- Add runtime dependency: `uv add <package>`
- Add dev dependency: `uv add --dev <package>`
- Add to named group: `uv add --group <name> <package>`
- Run commands: `uv run <command>`
- Sync dependencies: `uv sync`

**Key Principles:**
- Use `uv run <command>` instead of plain `python` or tool commands
- Keep `pyproject.toml` as single source of truth
- Use `--dev` for tools that aren't needed in production (ruff, pytest, ty, etc.)
- Pin versions in production, use ranges during development

**Script Execution:**
For detailed script patterns (inline metadata, `--no-project`, `--with` flags), see `references/uv-scripts.md`.

## Quality Tools and Workflows

**Linting and Formatting (ruff):**
```bash
uv run ruff check         # Check for issues
uv run ruff check --fix   # Auto-fix issues
uv run ruff format        # Format code
```

**Type Checking (ty):**
```bash
uv run ty check          # Type check all code
```

**Testing and Coverage (pytest):**
```bash
uv run pytest                                     # Run tests
uv run pytest --cov=src --cov-report=term-missing # With coverage
uv run pytest -v tests/test_specific.py           # Specific test file
```

**Pre-commit Quality Gate:**
```bash
uv run ruff check --fix
uv run ruff format
uv run ty check
uv run pytest
```

For detailed tool configuration and recommended settings, see `references/quality.md`.

## CLI and Logging Patterns

**CLI with typer:**
```python
import typer

app = typer.Typer()

@app.command()
def greet(name: str, count: int = 1) -> None:
    """Greet someone multiple times."""
    for _ in range(count):
        typer.echo(f"Hello, {name}!")

if __name__ == "__main__":
    app()
```

**Logging with loguru:**
```python
from loguru import logger

logger.info("Application started")
logger.warning("Low disk space: {free} MB", free=512)

try:
    # Some operation that might fail
    connect_to_service()
except Exception as err:
    logger.error("Failed to connect: {error}", error=err)
```

For complete examples and advanced patterns, see `references/cli-logging.md`.

## Packaging and Distribution

**Build distribution packages:**
```bash
uv build                 # Build wheel and sdist
uv build --no-sources    # Build wheel only (for publish checks)
```

Output in `dist/`:
- `*.whl` - Wheel package
- `*.tar.gz` - Source distribution

For publish workflows and checks, see `references/packaging.md`.

## When to Read References

- **Script execution patterns**: `references/uv-scripts.md` - inline metadata, `--no-project`, `--with` flags
- **Tool configuration**: `references/quality.md` - ruff/pytest/ty setup and pyproject.toml config
- **CLI and logging**: `references/cli-logging.md` - typer and loguru examples
- **Packaging details**: `references/packaging.md` - build outputs and publish workflows
- **Coding style**: Use `python-conventions` skill for Python code conventions

## References

- `references/uv-scripts.md` - Running scripts with uv
- `references/quality.md` - Ruff, pytest, and ty configuration
- `references/cli-logging.md` - Typer and loguru patterns
- `references/packaging.md` - Build and publish workflows

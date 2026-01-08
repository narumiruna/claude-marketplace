# Example Usage

## User Prompt
```
Create a 5-slide presentation about Python type checking
```

## Expected Output (Marpit Markdown)

```markdown
---
marp: true
theme: default
paginate: true
---

# Python Type Checking

**A Modern Development Practice**

Your Name · 2024

---

# Why Type Checking?

- Catch bugs before runtime
- Improve code documentation
- Enable better IDE support
- Facilitate refactoring

---

# Popular Tools

**mypy** - The original type checker
- Industry standard
- Comprehensive

**pyright** - Microsoft's solution
- Fast performance
- VS Code integration

**ty** - Modern alternative
- Built on pyright
- Streamlined CLI

---

# Basic Example

```python
def greet(name: str) -> str:
    return f"Hello, {name}!"

# Type checker catches this:
greet(123)  # Error: Expected str, got int
```

---

# Getting Started

1. **Install** - `uv tool install ty`
2. **Configure** - Create `pyproject.toml`
3. **Run** - `ty check`
4. **Integrate** - Add to CI/CD

**Resources:** python.org/typing
```

---

## Usage Tips

1. **Direct request:** "Write slides about X"
   - Skill outputs pure Marpit Markdown
   - No explanations

2. **Conversion:** "Convert this document to Marpit slides"
   - Skill restructures into slide format
   - Preserves key information

3. **Refinement:** "Add a comparison slide"
   - Skill adds properly formatted slide
   - Maintains consistency

4. **Theme selection:** "Use the gaia theme"
   - Changes `theme: gaia` in frontmatter
   - Adjusts styling as needed

---

## Installation

To use this skill in your marketplace:

```bash
# Add the marketplace
/plugin marketplace add https://github.com/yourusername/claude-marketplace

# Install the skill
/plugin install slide-skills@narumi
```

Then activate with:
```bash
/marpit-markdown
```

Or let Claude auto-detect when you mention slides/presentations.

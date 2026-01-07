# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a documentation repository for creating and distributing Claude Code plugin marketplaces. The main content is GUIDE.md, which provides comprehensive instructions for:

- Creating plugin marketplace structures
- Defining marketplace.json manifests
- Hosting and distributing marketplaces
- Configuring plugin sources (local paths, GitHub, Git URLs)
- Testing and validation

## Repository Structure

```
.
├── GUIDE.md          # Main documentation file (complete marketplace guide)
├── README.md         # Minimal project readme
├── LICENSE           # License file
└── .gitignore        # Git ignore patterns
```

## Key Concepts

### Marketplace Architecture

Plugin marketplaces enable centralized distribution of Claude Code extensions. The system follows this structure:

- **Marketplace file**: `.claude-plugin/marketplace.json` defines the catalog
- **Plugin entries**: Each entry specifies name, source, and metadata
- **Plugin sources**: Can be relative paths, GitHub repos, or Git URLs
- **Plugin manifest**: Individual plugins have their own `plugin.json` (unless `strict: false`)

### Important Variables

- `${CLAUDE_PLUGIN_ROOT}`: Used in plugin configs to reference files within the plugin's installation directory (since plugins are copied to cache)

### Reserved Marketplace Names

The following names are blocked for official Anthropic use:
- claude-code-marketplace
- claude-code-plugins
- claude-plugins-official
- anthropic-marketplace
- anthropic-plugins
- agent-skills
- life-sciences

## Documentation Guidelines

When editing GUIDE.md:

1. **Maintain the structure**: Steps, examples, schema tables, and troubleshooting sections follow a specific pattern
2. **Use theme={null}**: Code blocks use `theme={null}` attribute for documentation rendering
3. **Include working examples**: All JSON examples should be valid and complete
4. **Cross-reference related sections**: Use relative links to other sections
5. **Keep schema tables accurate**: Required/optional fields must match actual implementation
6. **Validation commands**: Reference both CLI (`claude plugin validate`) and in-app (`/plugin validate`) commands

## Technical Details

### Plugin Installation Flow

1. User adds marketplace: `/plugin marketplace add <source>`
2. Claude Code fetches `.claude-plugin/marketplace.json`
3. User installs plugin: `/plugin install <name>@<marketplace>`
4. Plugin files are **copied** to cache (not symlinked by default)
5. Files outside plugin directory won't be available unless using symlinks

This copying behavior is critical for understanding why `../` references don't work and why `${CLAUDE_PLUGIN_ROOT}` is necessary.

### Strict Mode

The `strict` field in plugin entries controls manifest requirements:
- `true` (default): Plugin must have its own `plugin.json`, marketplace entry merges with it
- `false`: Plugin doesn't need `plugin.json`, marketplace entry defines everything

This is key for simple plugin definitions vs. complex multi-component plugins.

## Validating Documentation Changes

After editing GUIDE.md, verify:
- All JSON examples are syntactically valid
- Code block attributes are consistent (```json, ```bash, ```shell with theme={null})
- Internal links work correctly
- Schema tables match the examples
- Step-by-step walkthroughs use `<Steps>` and `<Step>` blocks
- Notes use `<Note>` blocks for important callouts

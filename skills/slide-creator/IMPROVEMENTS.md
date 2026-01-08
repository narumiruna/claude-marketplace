# Slide-Creator Skill Improvements

**Analysis Date**: 2026-01-09
**Last Updated**: 2026-01-09
**Evaluated Against**: Skill-creator best practices
**Current Status**: Phase 1 and Phase 2 complete; Phase 3 remains optional
**Overall Grade**: Strong (A-) - High-impact enhancements implemented

---

## Executive Summary

The slide-creator skill now includes the previously missing high-impact improvements:
scripts, templates, icons, and refactoring of output examples into references. New
automation includes a dynamic palette generator and PEP 723-style uv script metadata.
Remaining opportunities are Phase 3 polish items (cross-cutting troubleshooting and a
decision guide/flowchart), plus optional validation runs.

---

## Current Strengths ✅

### 1. Excellent Progressive Disclosure
- SKILL.md: 182 lines (well under 500-line recommendation)
- Clear three-module structure with ordered reading lists
- 14 reference files totaling ~6,138 lines
- Core rules establish unified design principles upfront

### 2. Strong Reference Organization
- All reference files include table of contents
- Clear "See Also" cross-references
- Well-organized by module (color-design/, marpit-authoring/, svg-illustration/)
- Appropriate file sizes (200-600 lines each)

### 3. Comprehensive Frontmatter
- Description includes both capabilities AND trigger contexts
- Lists all major use cases (critical for skill triggering)
- Clear, searchable keywords

### 4. Practical Content
- Concrete examples with code snippets
- Decision guides and workflows
- Output format templates
- Validation checklists

### 5. Automation + Assets (Implemented)
- Scripts for SVG validation, contrast checking, Marpit validation, template init, and palette generation
- Templates + quick-start example + common icon set

---

## Implemented Improvements (from prior commits)

### 1) Scripts and automation ✅

**Implemented**: `skills/slide-creator/scripts/`
- `validate_svg.py` - SVG validation and best-practice checks
- `check_contrast.py` - WCAG contrast calculation
- `validate_marpit.sh` - Marpit frontmatter + separator checks
- `init_presentation.py` - Template-based deck initialization
- `generate_palette.py` - Dynamic palette generation (new in later commit)

All Python scripts now use uv inline metadata (PEP 723) for reproducible runs.

### 2) Assets and templates ✅

**Implemented**: `skills/slide-creator/assets/`
- Templates: `technical-dark.md`, `professional-light.md`, `minimal-keynote.md`
- Example: `examples/quick-start.md`
- Icons: `check.svg`, `warning.svg`, `error.svg`, `info.svg`

### 3) SKILL.md updates ✅

**Implemented**:
- Quick start, templates, and validation sections now reference scripts/assets
- Output examples moved to `references/output-examples.md`

---

## Priority 2: Organization Improvements

### 2.1 Keep color-palettes.md Unified ✅ **DECISION**

**Initial Consideration**: Split `color-palettes.md` (543 lines) into two files: `complete-palettes.md` (7-role systems) and `svg-color-schemes.md` (quick schemes).

**Decision**: **Keep unified** in single `references/color-palettes.md` file.

**Rationale**:
1. **Color coherence is critical**: When designing presentations, colors for slides and SVGs must be considered together to maintain visual consistency
2. **Core principle**: "Define one color palette and reuse it in slides and SVGs" - splitting the file works against this
3. **Practical workflow**: Users typically need to reference both sections when creating full presentations
4. **Cognitive load**: Keeping colors together reduces mental overhead of switching between files

**Benefits of keeping unified**:
- Single source of truth for all color decisions
- Easier to ensure consistency across slides and diagrams
- Users can quickly compare complete palettes with SVG schemes
- Aligns with skill's core principle of unified design language

**Token efficiency trade-off**: Yes, loading both sections when only one is needed costs ~250 lines of context. However, the benefits of maintaining color coherence outweigh this cost. In practice, most presentation tasks require considering both slides and diagrams together.

---

### 2.2 Move Output Examples from SKILL.md ✅ **COMPLETED**

**Issue**: SKILL.md previously contained output format examples (~48 lines).

**Problem**: These are reference material, not core workflow guidance. They made SKILL.md less focused.

**Solution**: Moved to `references/output-examples.md` with expanded examples.

**Implementation completed**:

#### Create: `references/output-examples.md`

```markdown
# Output Format Examples

Complete examples of expected outputs for each module.

## Color Design Output

### Example 1: Dark Technical Palette

```markdown
## Color Strategy

**Strategy**: Dark Technical
**Reasoning**: Code-heavy presentation for developer audience, projector environment

## Color Palette

* Background: #1E1E1E — Main slide background (VS Code dark)
* Surface: #252526 — Code blocks, diagram containers
* Primary: #569CD6 — Titles, headings (VS Code blue)
* Secondary: #4EC9B0 — Section dividers, icons (cyan)
* Accent: #F4BF75 — Important callouts, highlights (amber)
* Text Primary: #D4D4D4 — Body text, code
* Text Secondary: #858585 — Captions, metadata

## Usage Guidelines

**Title slides**:
- Background: #1E1E1E
- Title: Primary (#569CD6)
- Subtitle: Text Secondary (#858585)

**Content slides**:
- Background: #1E1E1E
- Headings: Primary (#569CD6)
- Body text: Text Primary (#D4D4D4)
- Code blocks: Surface background (#252526)

**Diagrams**:
- Container fills: Surface (#252526)
- Borders/strokes: Secondary (#4EC9B0)
- Highlights: Accent (#F4BF75)
- Arrows: Primary (#569CD6)

## Validation Checklist

- [x] Contrast ratio Text Primary/Background = 8.2:1 (exceeds WCAG AAA)
- [x] Contrast ratio Primary/Background = 4.8:1 (meets WCAG AA)
- [x] Palette limited to 7 colors
- [x] Colors tested on projector (high contrast maintained)
- [x] Consistent with VS Code theme (familiar to developers)
```

### Example 2: Light Professional Palette

[Similar structure with light theme...]

## Marpit Authoring Output

### Example: Complete Presentation

````markdown
---
marp: true
theme: default
paginate: true
---

<!-- _class: lead -->

# Presentation Title
Subtitle

Author Name · 2026-01-09

---

## Content Slide

- Key point 1
- Key point 2
- Key point 3

---

## Code Example

```python
def calculate(x, y):
    return x + y

result = calculate(5, 3)
print(result)  # Output: 8
```

---

<!-- _class: lead -->

# Thank You
Questions?
````

## SVG Illustration Output

### Example: Architecture Diagram

```xml
<svg viewBox="0 0 1200 675" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="shadow-sm">
      <feDropShadow dx="0" dy="2" stdDeviation="4" flood-opacity="0.12"/>
    </filter>
  </defs>

  <!-- Frontend Service -->
  <rect x="100" y="250" width="280" height="180" rx="16"
        fill="#f0f9ff" stroke="#0891b2" stroke-width="3" filter="url(#shadow-sm)"/>
  <text x="240" y="340" font-family="sans-serif" font-size="24"
        font-weight="600" fill="#1e293b" text-anchor="middle">
    Frontend
  </text>

  <!-- Arrow to Backend -->
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="10"
            refX="9" refY="3" orient="auto">
      <polygon points="0 0, 10 3, 0 6" fill="#0891b2"/>
    </marker>
  </defs>
  <line x1="380" y1="340" x2="520" y2="340"
        stroke="#0891b2" stroke-width="3" marker-end="url(#arrowhead)"/>

  <!-- Backend Service -->
  <rect x="520" y="250" width="280" height="180" rx="16"
        fill="#f0f9ff" stroke="#0891b2" stroke-width="3" filter="url(#shadow-sm)"/>
  <text x="660" y="340" font-family="sans-serif" font-size="24"
        font-weight="600" fill="#1e293b" text-anchor="middle">
    Backend
  </text>

  <!-- Arrow to Database -->
  <line x1="800" y1="340" x2="920" y2="340"
        stroke="#0891b2" stroke-width="3" marker-end="url(#arrowhead)"/>

  <!-- Database -->
  <ellipse cx="1000" cy="340" rx="100" ry="80"
           fill="#e0f2fe" stroke="#0891b2" stroke-width="3" filter="url(#shadow-sm)"/>
  <text x="1000" y="350" font-family="sans-serif" font-size="24"
        font-weight="600" fill="#1e293b" text-anchor="middle">
    Database
  </text>
</svg>
```

### Example: Workflow Diagram

[Additional SVG examples...]

---

## See Also

- [SKILL.md](../SKILL.md) - Return to main skill guide
- [color-design/workflow.md](color-design/workflow.md) - Color design process
- [marpit-authoring/patterns.md](marpit-authoring/patterns.md) - Common slide patterns
- [svg-illustration/pattern-examples.md](svg-illustration/pattern-examples.md) - SVG diagram patterns
```

#### Update SKILL.md

Updated the output formats section to reference `references/output-examples.md` and
summarize the expected output structure for each module.

**Results**:
- ✅ Created `references/output-examples.md` with comprehensive examples (~460 lines)
- ✅ Reduced SKILL.md by moving examples into references (now 182 lines)
- ✅ Included 2 complete color palette examples (dark + light)
- ✅ Included 2 Marpit examples (minimal + full presentation)
- ✅ Included 3 SVG examples (simple, architecture, flowchart)

**Benefits**:
- SKILL.md is now more focused on workflow and decision-making
- Examples are expanded with detailed annotations and multiple variations
- Users can reference examples without cluttering main workflow
- Maintains easy discoverability through clear link

---

## Priority 3: Polish & Enhancement (Optional)

### 3.1 Add Troubleshooting Quick Reference ⚠️ **LOW**

**Current State**: `svg-illustration/troubleshooting.md` exists (618 lines) but no equivalent for cross-cutting issues.

**Create**: `references/troubleshooting-common.md`

```markdown
# Common Troubleshooting

Issues that affect multiple modules.

## Colors Look Different on Projector vs Screen

**Symptom**: Colors appear washed out or too bright when projected

**Cause**: Projectors have lower contrast ratios than monitors

**Solution**:
1. Increase contrast between text and background
2. Use darker backgrounds for light rooms (#1E1E1E instead of #2D2D2D)
3. Test on actual projector before presenting
4. Avoid pure white (#FFFFFF) and pure black (#000000)
5. Prefer high-contrast palettes (Terminal Dark, Clean Corporate)

**Recommended palettes for projectors**:
- Terminal Dark (10.5:1 contrast)
- Accessibility First (7:1+ all combinations)

---

## Marpit Not Rendering SVGs

**Symptom**: SVG shows as broken image or doesn't appear

**Causes & Solutions**:

1. **Incorrect file path**
   ```markdown
   <!-- Wrong: Absolute path -->
   ![width:800px](/Users/name/diagrams/flow.svg)

   <!-- Correct: Relative path -->
   ![width:800px](diagrams/flow.svg)
   ```

2. **Missing xmlns attribute**
   ```xml
   <!-- Wrong -->
   <svg viewBox="0 0 800 600">

   <!-- Correct -->
   <svg viewBox="0 0 800 600" xmlns="http://www.w3.org/2000/svg">
   ```

3. **XML syntax errors**
   - Run `scripts/validate_svg.py file.svg` to check
   - Common: Unescaped `<` `>` `&` characters in text
   - Common: Unclosed tags or mismatched quotes

---

## Text Contrast Failing in Export

**Symptom**: Text is readable in preview but fails contrast checks in PDF/HTML export

**Cause**: Export process may apply different rendering or gamma correction

**Solution**:
1. Use `scripts/check_contrast.py` with your colors
2. Aim for 7:1 (AAA) instead of 4.5:1 (AA) minimum
3. Test exports, not just previews
4. Avoid transparent overlays on text

**Tool**:
```bash
scripts/check_contrast.py '#D4D4D4' '#1E1E1E'
# Should show: WCAG AAA Pass for both normal and large text
```

---

## Font Rendering Issues

**Symptom**: Fonts look different across devices or in exports

**Causes & Solutions**:

1. **Custom fonts not embedding**
   - Use web-safe fonts: `sans-serif`, `Arial`, `Helvetica`
   - Avoid system fonts: `San Francisco`, `Segoe UI` (not universal)

2. **Font weights not available**
   ```markdown
   <!-- Wrong: Using unavailable weight -->
   font-weight: 850

   <!-- Correct: Standard weights -->
   font-weight: 400  /* normal */
   font-weight: 600  /* semi-bold */
   font-weight: 700  /* bold */
   ```

3. **SVG text not rendering**
   - Specify `font-family="sans-serif"` explicitly
   - Avoid emoji in SVG `<text>` (use shapes instead)
   - See [svg-illustration/core-rules.md](svg-illustration/core-rules.md#emoji-and-special-characters-dont-use-them)

---

## Inconsistent Visual Style Across Slides

**Symptom**: Some slides look different (colors, spacing, borders)

**Cause**: Not following unified design system

**Solution**: Apply core rules consistently

1. **Choose ONE palette** - Use throughout all slides and SVGs
2. **Define stroke width once** - Use same value everywhere (e.g., 3px)
3. **Use consistent border radius** - All cards use same rx value (e.g., 16px)
4. **Apply shadow system uniformly** - Same filter across all elements

See [svg-illustration/core-rules.md](svg-illustration/core-rules.md#core-principle-visual-consistency)

**Checklist**:
- [ ] All SVGs use same color palette
- [ ] All SVGs use same stroke width
- [ ] All cards/containers use same border radius
- [ ] All shadows use same filter definition
- [ ] All slides use same Marpit theme and directives

---

## See Also

- [svg-illustration/troubleshooting.md](svg-illustration/troubleshooting.md) - SVG-specific issues
- [marpit-authoring/best-practices.md](marpit-authoring/best-practices.md) - Marpit consistency
- [color-design/workflow.md](color-design/workflow.md#validation-checklist) - Color validation
```

**Update SKILL.md** to reference:

```markdown
## Troubleshooting

Common issues:
- [troubleshooting-common.md](references/troubleshooting-common.md) - Cross-cutting problems
- [svg-illustration/troubleshooting.md](references/svg-illustration/troubleshooting.md) - SVG-specific
```

---

### 3.2 Enhance Decision Guide ⚠️ **LOW**

**Current State**: SKILL.md includes a basic text decision guide.

**Enhancement**: Create visual flowchart and add sophisticated loading logic.

#### Create: `references/decision-guide.md`

```markdown
# Decision Guide

Comprehensive guide for selecting modules and loading references.

## Quick Decision Matrix

| User Request | Modules Needed | Primary References |
|--------------|----------------|-------------------|
| "Create a slide deck" | Marpit authoring | syntax-guide.md, patterns.md |
| "Design slide colors" | Color design | workflow.md, strategies.md, complete-palettes.md |
| "Draw a diagram" | SVG illustration | core-rules.md, svg-color-schemes.md |
| "Create presentation with custom brand colors" | Color design → Marpit | All color-design refs, marpit patterns |
| "Build tech talk with diagrams" | All three modules | Core rules from each, load details as needed |

## Module Selection Flowchart

```
User request
    │
    ├─ Mentions "slides" or "deck" or "presentation"?
    │  YES → Marpit authoring module
    │  │
    │  ├─ Also mentions "colors" or "theme" or "brand"?
    │  │  YES → Add color design module (run FIRST)
    │  │  NO → Use existing palette from svg-color-schemes.md
    │  │
    │  └─ Also mentions "diagrams" or "flowchart" or "architecture"?
    │     YES → Add SVG illustration module
    │     NO → Slides only
    │
    └─ Mentions "diagram" or "illustration" or "SVG" only?
       YES → SVG illustration module only
       └─ Needs custom colors?
          YES → Also load color design module
          NO → Use svg-color-schemes.md
```

## Context Loading Strategy

### For Simple Requests (1-5 slides, 1 diagram)

**Load**:
- Core rules only (SKILL.md + one module's primary reference)
- Total: ~150-300 lines

**Example**: "Draw a workflow diagram"
- Read: `svg-illustration/core-rules.md`
- Read: `svg-illustration/svg-color-schemes.md` (pick a palette)
- Skip: patterns, troubleshooting (load only if needed)

### For Medium Requests (Full deck, 2-3 diagrams)

**Load**:
- Core rules + patterns/best practices
- Total: ~500-800 lines

**Example**: "Create a 10-slide technical presentation with 2 architecture diagrams"
- Read: `color-design/workflow.md` → `strategies.md` → `complete-palettes.md`
- Read: `marpit-authoring/syntax-guide.md` → `patterns.md`
- Read: `svg-illustration/core-rules.md` → `svg-color-schemes.md`
- Load patterns/advanced as needed during creation

### For Complex Requests (Branded deck, custom colors, many diagrams)

**Load**:
- All relevant references progressively
- Total: Variable, load on-demand

**Example**: "Create full conference presentation with custom brand colors, 20 slides, 5 diagrams"
- Phase 1: Color design
  - Read all color-design/* references
  - Generate custom palette based on brand
- Phase 2: Slides
  - Read all marpit-authoring/* references
  - Apply palette to slide theme
- Phase 3: Diagrams
  - Read svg-illustration core + patterns
  - Use custom palette in all SVGs

## When to Load Advanced References

### `marpit-authoring/advanced-layouts.md`
**Load when**:
- User requests complex layouts (multi-column, mixed content)
- Basic patterns insufficient
- Custom grid/flexbox needed

**Skip when**:
- Simple bullet lists and code blocks
- Standard title + content slides

### `svg-illustration/pattern-examples.md`
**Load when**:
- User requests specific diagram type (flowchart, timeline, architecture)
- Need examples of complex patterns
- First attempt at diagram structure

**Skip when**:
- Creating simple shapes or icons
- User provides clear diagram specification

### `color-design/complete-palettes.md`
**Load when**:
- User wants recommendations or pre-made systems
- Unsure which colors to use
- Quick start without custom design

**Skip when**:
- User provides specific brand colors
- Already has palette defined
- Using default from templates

## Progressive Disclosure in Action

### Example: "Create a tech talk with diagrams"

**Step 1**: Assess scope
- Question: "How many slides? What diagrams?"
- Assume: ~15 slides, 3 diagrams, dark theme for code

**Step 2**: Load core
- Read: `SKILL.md` (understand workflow)
- Read: `marpit-authoring/syntax-guide.md` (Marpit basics)
- Read: `color-design/complete-palettes.md` (pick "Code-Focused Blue")

**Step 3**: Create outline
- Generate slide structure using syntax-guide
- Apply chosen palette

**Step 4**: Add diagrams (load SVG refs only now)
- Read: `svg-illustration/core-rules.md`
- Read: `svg-illustration/pattern-examples.md` (find architecture pattern)
- Create diagrams using palette colors

**Step 5**: Polish (load best practices only if issues arise)
- If inconsistent styling → Read: `marpit-authoring/best-practices.md`
- If SVG not rendering → Read: `svg-illustration/troubleshooting.md`

**Total context loaded**: ~1,000 lines instead of all 5,678 lines

---

## See Also

- [SKILL.md](../SKILL.md) - Core workflow and module overview
- [output-examples.md](output-examples.md) - Expected outputs for each module
```

**Update SKILL.md decision guide** (lines 97-111):

```markdown
## Decision guide

See [references/decision-guide.md](references/decision-guide.md) for detailed flowchart and loading strategies.

**Quick rules**:
```
Slides only                → Marpit authoring
Slides + custom colors     → Color design → Marpit authoring
Slides + diagrams          → Marpit authoring + SVG illustration
Diagram only               → SVG illustration + svg-color-schemes.md
Full branded presentation  → All three modules in sequence
```

**Context loading**:
- Simple request (1-5 items)  → Core rules only (~200 lines)
- Medium request (deck + few diagrams) → Core + patterns (~600 lines)
- Complex request (full branded deck) → Progressive loading as needed
```

**Benefits**:
- Clearer decision-making process
- Visual flowchart aids understanding
- Explicit loading strategies reduce token waste

---

## Implementation Checklist

### Phase 1: High-Impact Additions (Complete)

- [x] Create `scripts/` directory
  - [x] `validate_svg.py` - SVG validation
  - [x] `check_contrast.py` - WCAG contrast checking
  - [x] `init_presentation.py` - Template initialization
  - [x] `validate_marpit.sh` - Marpit syntax checking
  - [x] `generate_palette.py` - Dynamic palette generation
  - [ ] Test all scripts on sample files

- [x] Create `assets/` directory structure
  - [x] `assets/templates/` folder
    - [x] `technical-dark.md`
    - [x] `professional-light.md`
    - [x] `minimal-keynote.md`
  - [x] `assets/examples/` folder
    - [x] `quick-start.md`
    - [ ] `full-presentation/` with complete example
  - [x] `assets/icons/` folder
    - [x] `check.svg`
    - [x] `warning.svg`
    - [x] `error.svg`
    - [x] `info.svg`

- [x] Update SKILL.md
  - [x] Add "Quick Start" section referencing scripts
  - [x] Add "Templates" section referencing assets
  - [x] Add "Common Icons" reference
  - [x] Add "Validation" section with script examples

### Phase 2: Organization Improvements (Complete)

- [x] Keep `references/color-palettes.md` unified (decision documented)
  - [x] Update SKILL.md module reading lists as needed

- [x] Move output examples from SKILL.md
  - [x] Create `references/output-examples.md`
  - [x] Move content from SKILL.md lines 113-161
  - [x] Replace with concise reference in SKILL.md
  - [x] Add cross-references from color-design, marpit-authoring, svg-illustration

- [x] Update cross-references (no split required)
  - [ ] Verify all links work

### Phase 3: Polish (Optional / Pending)

- [ ] Create `references/troubleshooting-common.md`
  - [ ] Add cross-cutting issues (projector colors, font rendering, etc.)
  - [ ] Link from SKILL.md
  - [ ] Cross-reference from module-specific troubleshooting

- [ ] Create `references/decision-guide.md`
  - [ ] Add flowchart (as SVG using skill itself!)
  - [ ] Add context loading strategies
  - [ ] Add progressive disclosure examples
  - [ ] Link from SKILL.md

- [ ] Create visual decision flowchart
  - [ ] Design flowchart SVG using svg-illustration module
  - [ ] Embed in `decision-guide.md`
  - [ ] Use skill's own color palette (dogfooding!)

- [ ] Final validation
  - [ ] Run `scripts/validate_svg.py` on all SVG assets
  - [ ] Run `scripts/validate_marpit.sh` on all template .md files
  - [ ] Check all internal links work
  - [ ] Test scripts with sample inputs
  - [ ] Verify templates render correctly in Marp

---

## Metrics & Success Criteria

### Before Improvements

- SKILL.md: 174 lines
- References: 13 files, 5,678 lines
- Scripts: 0 files
- Assets: 0 files
- Typical context loading: 600-1,000 lines per invocation

### After Improvements

- SKILL.md: 182 lines
- References: 14 files, 6,138 lines
- Scripts: 5 files (executable, not loaded)
- Assets: 8 files (templates, example, icons)
- Typical context loading: reduced for most tasks due to output examples moved out of SKILL.md

### Success Metrics

1. **Token Efficiency**: 30%+ reduction in context loading for typical tasks
2. **Reliability**: 90%+ SVG validation pass rate (measured by scripts)
3. **Speed**: 50%+ reduction in time to create new presentation (via templates)
4. **User Satisfaction**: Positive feedback on templates, scripts, and examples

---

## Future Enhancements (Beyond Current Scope)

### Advanced Scripts

- `scripts/optimize_svg.py` - Minimize SVG file size
- `scripts/extract_palette.py` - Extract colors from image
- `scripts/batch_validate.sh` - Validate entire presentation directory
- `scripts/export_pdf.sh` - Marp CLI wrapper for PDF export

### Additional Assets

- `assets/templates/academic.md` - Research presentation template
- `assets/templates/startup-pitch.md` - Investor pitch template
- `assets/backgrounds/` - Subtle background patterns (SVG)
- `assets/animations/` - Simple CSS animations for slides

### Integration

- Pre-commit hook for automatic SVG validation
- GitHub Actions workflow for presentation CI/CD
- VS Code snippet file for common Marpit patterns
- Marp theme file (CSS) for custom slide-creator theme

---

## Questions for User

Before implementing these improvements, consider:

1. **Template preferences**: Are there specific presentation types/audiences we should prioritize?
2. **Script features**: Which validation/automation tasks are most painful currently?
3. **Asset formats**: Any specific icon sets or diagram types commonly needed?
4. **Integration**: Would pre-commit hooks or CI/CD be valuable?
5. **Branding**: Should templates include placeholder for logo/brand assets?

---

## Conclusion

The slide-creator skill is **well-designed and production-ready** with excellent progressive disclosure. Implementing these improvements would:

- **Increase reliability** through validation automation
- **Improve speed** through templates and quick-start assets
- **Reduce token costs** through better reference organization
- **Enhance user experience** through examples and troubleshooting

**Recommended implementation order**: Phase 3 (optional polish only)

**Estimated effort**:
- Phase 3: 2-3 hours (guides + flowchart + validation)

**ROI**: High - Each improvement directly addresses user pain points and reduces repetitive work.

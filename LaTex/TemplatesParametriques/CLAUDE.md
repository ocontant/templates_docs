# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **parametric LaTeX template system** for creating professional Dollarama business documents. The system separates style from content using LaTeX classes and packages, allowing document creation without modifying templates.

## Build Commands

### Compiling Documents
```bash
# Standard compilation (required for SVG graphics)
pdflatex -shell-escape document.tex

# For documents with complex references or bibliographies
pdflatex -shell-escape document.tex
pdflatex -shell-escape document.tex
```

### Testing Templates
```bash
# Compile example documents to verify templates work
pdflatex -shell-escape exemple_systeme_parametrique.tex
pdflatex -shell-escape exemple_pmp_risks_simple.tex
pdflatex -shell-escape exemple_table_headers.tex
```

## Architecture

### Core Components

1. **dollarama.cls** - Main document class with:
   - Dollarama branding and colors
   - Parametric title page generation
   - Header/footer with logo integration
   - Lexique/footnote system

2. **dollarama-business.sty** - Business document components:
   - Executive summary commands
   - Financial metrics displays
   - Standardized table headers
   - Information boxes (highlight, info, warning)
   - Cost/cashflow table environments

3. **dollarama-layouts.sty** - Advanced layout environments:
   - Structured sections and comparisons
   - Process workflows and timelines
   - Risk assessment displays
   - Project management tables

### Document Structure Pattern

All documents follow this parametric pattern:
```latex
\documentclass{TemplatesParametriques/dollarama}
\usepackage{TemplatesParametriques/dollarama-business}
\usepackage{TemplatesParametriques/dollarama-layouts} % optional

% Configure metadata via parameters
\title{Document Title}
\subtitle{Optional Subtitle}
\author{Author Name}
\department{Department}
\status{Draft/Review/Final}
\version{1.0}
\classification{Confidentiality Level}

\begin{document}
\maketitle
% Content using parametric commands
\end{document}
```

### Key Parametric Commands

- `\executivesummary{problem}{solution}{benefits}{financial}{recommendation}`
- `\keyfinancialmetrics{VAN}{TRI}{Payback}{ROI}`
- `\projectdashboard{duration}{budget}{milestones}{teams}`
- Table environments: `dollaramacosttable`, `dollaramacashflowtable`
- Information boxes: `\highlightbox{}`, `\infobox{}`, `\warningbox{}`

### Color System

The templates use a comprehensive Dollarama color palette:
- **DollaramaGreen** (primary): RGB(0,123,67)
- **DollaramaYellow** (accent): RGB(255,198,0) 
- **DollaramaGray** (text): RGB(88,89,91)
- Multiple variations for each color

## File Organization

- `*.cls` - LaTeX document classes (main templates)
- `*.sty` - LaTeX packages (component libraries)
- `exemple_*.tex` - Example documents demonstrating features
- `*.pdf` - Compiled examples and assets
- `dollarama-official-logo.*` - Corporate logo assets

## Development Workflow

1. **Never modify template files directly** - all customization happens via parameters
2. **Test changes** by compiling example documents
3. **Follow parametric approach** - create commands that accept parameters rather than hardcoded content
4. **Maintain branding consistency** using defined color palette and corporate standards

## Dependencies

- **pdflatex** with `-shell-escape` flag (required for SVG graphics)
- **French babel** support for localization
- **TikZ** for graphics and decorative elements
- **tcolorbox** for styled information boxes
- **SVG package** for logo integration
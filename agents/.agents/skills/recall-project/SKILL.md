---
name: recall-project
description: 'Look up past work in the vault before answering questions about old projects. Use when the user asks about a past project, or how or why something was done, decided, or implemented before.'
argument-hint: 'The project or decision being asked about'
---

# Recall Project

Answer questions about past work from the vault instead of guessing. Read-only: do not modify any notes.

1. **Search.** The vault Projects directory is the one `dot g` uses (its `PROJECTS_DIR_DEFAULT`); past work lives in the sibling `Archive/` directory. Check the distilled `Archive/*.md` notes first, then `Archive/raw/*.md` and `Projects/*.md` for detail the summary lacks.
2. **Answer from the notes.** Cite which note each claim comes from and quote decisive lines (especially from Decisions and Gotchas sections). Follow PR/ADR links in the raw notes via `gh` or fetching when the question needs detail the vault doesn't hold.
3. **Say when the vault is silent.** If the notes don't answer the question, say so plainly rather than inferring; offer to dig into session history or the linked PRs instead.

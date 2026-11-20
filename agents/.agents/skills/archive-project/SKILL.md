---
name: archive-project
description: 'Distill a finished vault Project note into an Archive note and move the original out of Projects. Use when the user says a project is done or finished, or asks to archive it.'
argument-hint: 'The project to archive'
---

# Archive Project

Turn a finished working note from the vault Projects directory (the one `dot g` uses — its `PROJECTS_DIR_DEFAULT`) into a distilled note in the sibling `Archive/` directory, so future sessions can answer questions about the project long after the todos stop making sense. Nothing is deleted: the raw note is moved, not destroyed.

1. **Locate.** Find the project's note in the Projects directory, or — when re-archiving — in `Archive/raw/`. If the name is ambiguous or no note matches, list the candidates and ask.
2. **Check it's done.** If the note still has unchecked todos, show them and ask whether to archive anyway.
3. **Distill.** Write `Archive/<same name>.md` with:
   - frontmatter: `archived: <today>`, plus `date`, `jira`, and `status` carried over if present
   - **What & why** — the problem and the outcome, a short paragraph
   - **How it works** — key repos, services, files, endpoints, pipelines, data tables
   - **Decisions** — each significant choice, the rejected alternatives, and why
   - **Gotchas** — surprises, constraints, and anything that bit us
   Pull from the note itself and, when the project was built in the current session, from that context too. Do not copy the Links section — the raw note keeps the PR/ADR links and `dot g pr list` also scans the Archive directory.
   If `Archive/<same name>.md` already exists (the project was archived from an earlier session), enrich it instead of recreating it: merge in only the decisions, gotchas, and how-it-works detail this session adds, and update `archived:` to today.
4. **Move the raw note** to `Archive/raw/<same name>.md` (create the folder if needed), leaving Projects/ with only active work. Skip this when it was already moved by an earlier archiving.
5. **Confirm.** Show the distilled note and report both new paths in one line each.

---
name: track-my-prs
description: 'Match untracked pull requests to the right vault Project note and link them there. Use when the user asks to file, sort, track, or organize their PRs into vault projects.'
argument-hint: 'Optionally, specific PRs or a project to focus on'
---

# File My PRs

Take the PRs that `dot g pr list` reports as untracked and link each one from the vault Project note it belongs to. Do not push, comment on PRs, or change anything other than the Project notes.

1. **Gather.** Run `dot g pr list` and parse the "Untracked PRs" section. If there are none, say so and stop. The Projects directory is the one `dot g` uses (its `PROJECTS_DIR_DEFAULT`).
2. **Understand the projects.** Read every `*.md` in the Projects directory: frontmatter (`jira`, `status`, `date`), Context/Todo sections, ticket IDs, repo names, and file paths mentioned in the note.
3. **Match.** For each untracked PR, fetch its title, body, and head branch with `gh pr view <url> --json title,body,headRefName`. Match it to a project by, in order of strength: ticket ID (e.g. `ABC-123` in the branch or title appearing in the note), explicit mentions of the same feature or ticket, overlap between the PR's changed areas and the repo/file paths in the note, and topic similarity. Prefer notes whose `status` is not `done`.
4. **Confirm.** Present the full mapping before changing anything: a table of PR, proposed project, evidence (quote the matching line), and confidence. PRs with no plausible project go in a "no match" group. Wait for the user to confirm, reassign, or drop rows; for a no-match PR, offer to skip it or create a new project note (frontmatter with today's `date`, a `## Todo`, and a `## Links` section).
5. **Link.** For each confirmed row, append `- [PR](<url>) - <title>` to the end of the note's `## Links` section, creating the section at the end of the file if missing. Match the exact heading `## Links`; if a note uses a variant (e.g. `### Links`), normalize it to `## Links` rather than adding a duplicate section. Do not add a PR whose URL already appears in the note.
6. **Verify.** Run `dot g pr list` again and confirm the filed PRs now show as tracked. Report what was linked where, one line per PR.

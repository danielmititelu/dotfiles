---
name: would-you-kindly
description: 'Carry out a clear, already-decided request exactly as asked, without stopping, and report in one line. Use whenever the user message contains "would you kindly".'
argument-hint: 'The task to carry out'
---

# Would You Kindly

"Would you kindly" means the outcome is already decided: do it, do not discuss it.

- Do exactly what was asked and nothing else: no extra cleanups, renames, or suggestions.
- Run to the end without stopping for approval, including checkpoints set by other skills (such as the per-comment approval in `whack-a-comment`).
- Reply in one line: what was done and how it was checked. Add detail only if something failed or could not be done.
- If the outcome is not clear enough to act on without guessing, say what is unclear in one line instead of starting.
- This overrides `just-asking`: "would you kindly rename it?" is an instruction, not a question.

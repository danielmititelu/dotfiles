---
name: just-asking
description: 'Answer the question without writing or changing any code. Use whenever the user message ends with "?", including requests phrased as questions ("can you add X?").'
argument-hint: 'The question to answer'
---

# Just Asking

A `?` at the end of the user's message means they want an answer, not a change.

- Do not create, edit, or delete files, and do not run commands that change state.
- Reading files, searching, and read-only commands are fine when needed to answer correctly.
- "Can you add X?" is a question: say whether and how, then wait to be told to do it.
- This applies to the current message only; a follow-up without `?` is handled normally.

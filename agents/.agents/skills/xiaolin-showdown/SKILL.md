---
name: xiaolin-showdown
description: 'Pit two (or a few) competing design options against each other: one advocate subagent per option, then judge and present the verdict. Use when the user asks to compare approaches, weigh alternatives, "argue for A vs B", "spawn two agents", debate a design choice, call a showdown, or when a task has two viable implementations and the user wants a reasoned pick rather than a default.'
argument-hint: 'The options to compare and the questions the verdict must answer'
---

# Xiaolin Showdown

The options have all grabbed the same Shen Gong Wu (the decision). One read-only subagent fights for each, the main agent judges, and nothing is implemented until the user picks. Not for trivial choices; just pick and move on.

1. **The challenge.** Name the Shen Gong Wu, the contenders (each option in one line), the rules both must satisfy, the questions the verdict must answer (the user's verbatim, plus the ones they would ask next), and the files each advocate must read. With more than three options, eliminate down to two or three first.
2. **"Gong Yi Tanpai!"** Announce it, then spawn one advocate per option, in parallel and read-only. Give every advocate the same plain prompt apart from the option it defends, with none of the show's vocabulary in it. Each returns a concrete design, an answer to every judging question, the strongest objection to its own option (its wager), and the files and tests that would change. Claims about current behaviour need a file path and line number; "unknown" beats a guess.
3. **Judge.** For each question, say which option wins and why, citing the advocates' evidence; do not average. Check in the code anything both advocates missed. If the answer is "it depends", say on what and give a default.
4. **Present** a case readable in a minute: open with "<winner> wins the showdown and takes the Shen Gong Wu" and the decisive reason, then a plain scorecard table (question, A, B, winner), a few lines showing the shape of each design, the risks of the recommendation, and "Go with <winner>?". Wait for the user to confirm before implementing.

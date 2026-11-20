---
name: whack-a-comment
description: 'Address pull request review comments one at a time with a human checkpoint after each. Use when the user shares a PR or review URL and asks to address, resolve, look into, or fix review comments or reviewer feedback. Works with GitHub via the gh CLI; repo-agnostic.'
argument-hint: 'PR or review URL (e.g. https://github.com/org/repo/pull/123#pullrequestreview-456)'
---

# Whack-a-Comment

Resolve reviewer comments one at a time: implement, verify, show what changed for that comment, and wait for approval before the next. Never batch several comments into one change set; the user must be able to map every diff hunk to the comment that caused it. Leave all changes uncommitted, and do not push, comment on the PR, or resolve threads unless asked.

Parse `owner`, `repo`, the PR number and any `pullrequestreview-<id>` anchor from the URL, then fetch the comments:

```bash
# Review summary
gh api repos/{owner}/{repo}/pulls/{pr}/reviews/{review_id} --jq '{state, body, user: .user.login}'
# Inline comments of that review (drop the select to get every inline comment on the PR)
gh api repos/{owner}/{repo}/pulls/{pr}/comments --paginate --jq '.[] | select(.pull_request_review_id == {review_id}) | {id, path, line, user: .user.login, in_reply_to_id, body}'
# PR-level comments
gh api repos/{owner}/{repo}/issues/{pr}/comments --jq '.[] | {user: .user.login, body}'
```

Ignore bot comments and replies that are not new requests (`in_reply_to_id` set, or a bare "done" / "ok"). `line` can be `null` for outdated positions; fall back to `diff_hunk`.

1. **Confirm scope.** Check that the checked-out branch is the PR's head branch (stacked branches are common) and ask before starting if the working tree has unrelated uncommitted changes. Show the comments as a numbered list (path:line, one-line gist) and ask about order, anything to drop, and anything ambiguous.
2. **For each comment:** quote it, re-read the code at that location (earlier fixes change it), make the smallest change that resolves it, update the affected tests, and verify with the repository's own tooling (lint, build, affected tests, regenerating derived files). Report for that comment only: what changed and why, the files touched, the verification results, and a one-line reply the user could post. Then stop and wait for approval before the next comment.
3. **Comments that are not plain requests.** A "should we…?" question gets an answer first and a change only if the user agrees. For a design disagreement, present the trade-off and let the user decide. If a later commit already addressed a comment, show the evidence and ask whether to skip it. If two comments need the same change, say so and handle them as one step.
4. **Wrap up.** Recap as a table (comment, resolution, files), run the full relevant test suites if only subsets ran, and point out anything that affects other branches, such as a stacked PR that now needs a rebase.

---
name: bms:draft-pr
description: Create a draft pull request for the current branch. Summarises the diff, fills in any PR templates, and opens the PR via the gh CLI.
---

# Draft Pull Request

Create a draft pull request for the current branch with a well-written summary and completed PR template.

## Instructions

### 1. Verify prerequisites

- Confirm the current branch is not `main`/`master`. If it is, stop and tell the user.
- Identify the base branch (`main` or `master`).
- Confirm there's at least one commit ahead of it: `git log <base>..HEAD --oneline`. If empty, stop and tell the user.
- Warn the user if there are uncommitted changes in the working tree - the PR should represent the committed state.

### 2. Gather context

```
git log <base>..HEAD --pretty=format:"%h %s"
git diff <base>..HEAD --stat
git diff <base>..HEAD
```

Read the full diff carefully. Understand what changed and why.

### 3. Find a PR template

Check, in order: `.github/pull_request_template.md`, `.github/PULL_REQUEST_TEMPLATE.md`, `docs/pull_request_template.md`, `pull_request_template.md`, `.github/PULL_REQUEST_TEMPLATE/*.md`.

If found, fill in every section based on the diff - never leave one empty (write "N/A" with a reason if not applicable). If not found, use the default format below.

### 4. Write the title

Concise, imperative mood ("Add user authentication", not "Added..."), under 72 characters.

### 5. Write the body

Default format if no template exists:

```markdown
## Summary

<2-5 sentences describing what this PR does and why>

## Changes

<Bulleted list of the key changes, grouped logically>

## Notes

<Migration steps, breaking changes, or things reviewers should pay attention to. Remove if not needed.>
```

Be specific, name files/components where it aids clarity, and highlight breaking changes prominently. Keep the tone factual and concise.

### 6. Push and create the PR

```
git status                    # check if branch needs pushing
git push -u origin HEAD       # if unpushed or behind
gh pr create --draft --title "<title>" --body "$(cat <<'EOF'
<body>
EOF
)"
```

### 7. Report back

Give the user the PR URL and confirm the title and draft status.

## Guidelines

- Always create the PR as a **draft** — the user marks it ready for review themselves.
- Never force-push or rebase; only push the current branch state.
- If `gh` is missing or unauthenticated, tell the user and give them the title/body to create the PR manually.

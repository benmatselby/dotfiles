---
name: draft-pr
description: Create a draft pull request for the current branch. Summarises the diff, fills in any PR templates, and opens the PR via the gh CLI.
---

# Draft Pull Request

Create a draft pull request for the current branch with a well-written summary and completed PR template.

## Instructions

### 1. Verify prerequisites

- Confirm the current branch is not `main` or `master`. If it is, stop and tell the user they need to be on a feature branch.
- Confirm there is at least one commit ahead of the base branch. Use `git log main..HEAD --oneline` (try `master` if `main` does not exist) to check. If there are no commits, stop and tell the user.
- Identify the base branch (`main` or `master`) for later use.

### 2. Gather context

Run the following commands to understand the changes:

```
git log <base>..HEAD --pretty=format:"%h %s"
git diff <base>..HEAD --stat
git diff <base>..HEAD
```

Read through the full diff carefully. Understand **what** changed and, where possible, **why** it changed.

### 3. Check for a PR template

Look for a pull request template in the repository. Search for files in these locations (in order of priority):

1. `.github/pull_request_template.md`
2. `.github/PULL_REQUEST_TEMPLATE.md`
3. `docs/pull_request_template.md`
4. `pull_request_template.md`
5. `.github/PULL_REQUEST_TEMPLATE/*.md` (multiple templates directory)

If a template is found, use it as the structure for the PR body and fill in each section thoughtfully based on the diff analysis. Do not leave template sections empty; if a section is not applicable, write "N/A" with a brief reason.

If no template is found, use the default format described below.

### 4. Write the PR title

- Use a concise, descriptive title that summarises the overall change.
- Use imperative mood (e.g. "Add user authentication" not "Added user authentication").
- Keep it under 72 characters.

### 5. Write the PR body

If no template was found, use this structure:

```markdown
## Summary

<2-5 sentences describing what this PR does and why>

## Changes

<Bulleted list of the key changes, grouped logically>

## Notes

<Any additional context, migration steps, or things reviewers should pay attention to. Remove this section if not needed.>
```

When writing the body:

- Be specific about what changed and why.
- Mention files or components by name when it aids clarity.
- Call out anything that needs special attention from reviewers.
- If there are breaking changes, highlight them prominently.
- Keep the tone factual and concise.

### 6. Push the branch

Check if the branch has been pushed to the remote:

```
git status
```

If the branch has not been pushed or is behind, push it:

```
git push -u origin HEAD
```

### 7. Create the draft PR

Use the `gh` CLI to create the PR as a draft. Use a heredoc for the body to preserve formatting:

```
gh pr create --draft --title "<title>" --body "$(cat <<'EOF'
<body>
EOF
)"
```

### 8. Report back

Provide the user with:

- The PR URL returned by `gh pr create`.
- A brief confirmation of the title and that it was created as a draft.

## Guidelines

- Always create the PR as a **draft**. The user will mark it ready for review themselves.
- Do not force-push or rebase. Only push the current branch state.
- If `gh` is not installed or not authenticated, tell the user and provide the PR title and body so they can create it manually.
- If there are uncommitted changes in the working tree, warn the user before proceeding. The PR should represent the committed state.

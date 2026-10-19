---
name: bms:draft-pr
description: Create a draft pull request for the current branch. Summarises the diff, fills in any PR templates, and opens the PR via the gh CLI.
---

# Draft Pull Request

Create a draft pull request for the current branch with a well-written _and concise_ summary.

- Confirm the current branch is not `main`. If it is, stop and tell the user.
- Identify the base branch.
- Confirm there's at least one commit ahead of it: `git log <base>..HEAD --oneline`. If empty, stop and tell the user.
- Warn the user if there are uncommitted changes in the working tree - the PR should represent the committed state.
- Gather context using `git log` and `git diff`.
- Understand the full diff carefully. Understand what changed and why.
- Check for a PR template.
  - Check, in order: `.github/pull_request_template.md`, `.github/PULL_REQUEST_TEMPLATE.md`, `docs/pull_request_template.md`, `pull_request_template.md`, `.github/PULL_REQUEST_TEMPLATE/*.md`.
  - If found, fill in every section based on the diff - never leave one empty (write "N/A" with a reason if not applicable). If not found, use the default format below.
  - If not, complete the headings: "Summary", "Changes", and "Notes" (if applicable).
- The title should be concise, imperative mood ("Add user authentication", not "Added..."), under 72 characters.
  - Check if conventional commits are used, if so, follow that convention for the title.
- Please make it clear on the PR what the prompts were (if any), with any questions answered.
- Raise the PR in draft mode using the `gh` CLI.
- Request that Copilot for a review.
- Give the user the PR URL and confirm the title and draft status.

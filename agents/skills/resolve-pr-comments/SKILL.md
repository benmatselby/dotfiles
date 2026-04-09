---
name: bms:resolve-pr-comments
description: Review open review comments on a GitHub PR, agree a fix with the user, apply the change, commit, push, and mark the thread resolved.
---

# Resolve PR Review Comments

Review open review comments on a GitHub PR one at a time, agree a fix with the user, apply the change to the branch, commit, push to GitHub, and mark the comment thread as resolved.

## Arguments

- `<PR-URL>`: The GitHub PR URL to inspect (e.g., <https://github.com/org/repo/pull/123>)

If no PR URL is provided, prompt the user to provide one.

## Prerequisites

- `gh` CLI installed and authenticated

## Workflow

### 1. Fetch open review comments

Use the `gh` CLI to fetch all review comments for the PR:

```bash
gh api repos/<owner>/<repo>/pulls/<number>/reviews/<review-id>/comments
```

Or fetch all review comments across all reviews:

```bash
gh api repos/<owner>/<repo>/pulls/<number>/comments
```

Only surface comments that are **not yet resolved**. To check resolution status, fetch the review threads via GraphQL:

```bash
gh api graphql -f query='
{
  repository(owner: "<owner>", name: "<repo>") {
    pullRequest(number: <number>) {
      reviewThreads(first: 20) {
        nodes {
          id
          isResolved
          comments(first: 1) {
            nodes {
              databaseId
              body
            }
          }
        }
      }
    }
  }
}'
```

Filter to threads where `isResolved: false`.

If no unresolved comments are found, report "No open review comments" and exit.

### 2. Present comments to the user

Summarise each unresolved comment clearly:

- Which file and what the concern is
- The reviewer's suggestion (if any)
- Your recommended solution

Ask the user to confirm the approach before making any changes. Work through comments **one at a time** unless the user asks to handle multiple at once.

### 3. Check out the PR branch

```bash
gh pr checkout <PR-URL>
```

Note: `gh pr checkout` may leave you in a detached HEAD state if the branch is from a fork. Check with `git status` and identify the correct remote and branch name for pushing later.

### 4. Apply the fix

Make the agreed code change. Do not commit yet — let the user verify if needed.

### 5. Commit and push

```bash
git add <changed files>
git commit -m "<message>"
```

After committing, check `git status` for the push target. If in detached HEAD state, push explicitly:

```bash
git push <remote> HEAD:refs/heads/<branch-name>
```

Identify the correct remote by running `git remote -v` — push to the upstream org remote (not a personal fork) unless the PR originates from a fork.

### 6. Resolve the thread

Use the GraphQL `resolveReviewThread` mutation with the thread's node ID (obtained in step 1):

```bash
gh api graphql -f query='
mutation {
  resolveReviewThread(input: {threadId: "<thread-node-id>"}) {
    thread {
      isResolved
    }
  }
}'
```

Confirm the response shows `"isResolved": true`.

### 7. Report back

Tell the user:

- Which comment was addressed and how
- The commit message used
- That the thread has been marked resolved

Then move on to the next unresolved comment (if any), repeating from step 2.

## Notes

- Always agree the solution with the user **before** applying it — do not make changes speculatively.
- Only resolve a thread **after** the fix has been committed and pushed successfully.
- If the push fails due to remote mismatch (e.g., fork vs upstream), use `git remote -v` to identify the correct remote and push target explicitly.

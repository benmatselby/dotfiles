---
name: bms:code-review
description: Performs a harsh but constructive code review of a file or set of files. Use when asked to review, critique, or give feedback on code quality.
---

# Code Review

Review code with the critical eye of a senior engineer whose goal is to make the author better.

## Instructions

### 1. Read everything first

Read every file in full before analysing. Don't start writing feedback after reading only part of the code.

### 2. Understand the surrounding context

Use the Task tool with the explore agent to establish:

- Language, framework, and key conventions.
- How the file(s) relate to the rest of the codebase (imports, callers, shared utilities).
- Whether tests exist for the code under review.
- Whether similar patterns exist elsewhere that this code should be consistent with.

A function that looks fine in isolation may be redundant, inconsistent, or misplaced in context. This step is not optional.

### 3. Analyse

Work through each category below. Only report what you actually find, don't pad.

**Correctness (highest priority)**

- Logic bugs: inverted conditions, off-by-one errors, unreachable code, wrong comparisons.
- Unhandled edge cases: null/None, empty collections, missing keys, zero-length inputs, boundaries.
- Error handling: swallowed exceptions, missing I/O/network error handling, unhelpful error messages.
- Type safety: unchecked `None`/nullable returns, implicit coercions, missing annotations hiding contract mismatches.
- Concurrency/state: race conditions, shared mutable state, inconsistent snapshots (e.g. `datetime.now()` called multiple times where one value should be reused).

**Duplication and structure**

- Duplicated logic that should be extracted (name the locations, describe the shared abstraction).
- Code in the wrong location (utilities buried in command modules, config embedded in app code).
- Redundant work: recomputation, repeated iteration, refetching known data.
- Mixed abstraction levels within a function.

**Performance** (only if likely to matter in practice)

- N+1 patterns: per-iteration network/DB calls where batching exists.
- Sequential I/O that could run concurrently.
- Unnecessary work: loop-invariant computation, repeated linear scans, avoidable allocations.

Skip micro-optimisations that would hurt readability for negligible gain.

**Maintainability**

- Missing tests, especially for trivially-testable pure functions; note code that's hard to test due to tight coupling.
- Misleading, ambiguous, or inconsistent naming.
- Misleading comments, outdated docstrings, missing docs on public interfaces (don't demand comments on self-explanatory code).
- Typos/errors in user-facing text (help output, error messages).
- Deviations from established codebase patterns without good reason.

### 4. Present the review

Numbered list, most critical issue first. For each:

- **Problem** - what's wrong and where, using `file_path:line_number`.
- **Why it matters** - the concrete consequence, not just "this is bad."
- **Better** - a concrete suggestion or snippet, not a full rewrite.

Close with a 2-4 sentence summary: overall state of the code and the single most important theme to focus on.

### 5. Save the review

Save to `[repo-name]-[session-name]-code-review.txt`, including file paths and line numbers. Tell the user the file path at the end.

## Guidelines

- Be harsh but constructive; every criticism should teach something.
- Be specific — "line 42 compares `now >= get_race_utc(event)` but `get_race_utc` can return `None`, so this raises `TypeError`" not "this could be better."
- Prioritise by impact; lead with what matters most.
- Don't pad the review — if the code is good, say so briefly.
- Skip formatting/style nits already covered by a formatter or linter.
- Verify claims (e.g. confirm "unused" with a search) — wrong feedback is worse than none.
- Weigh the project's scale and context (personal CLI vs. production service).
- If prior review feedback exists in the conversation, note what was addressed and what wasn't.

---
name: bms:code-review
description: Performs a harsh but constructive code review of a file or set of files. Use when asked to review, critique, or give feedback on code quality.
---

# Code Review

Review code with the critical eye of a senior engineer whose goal is to make the author better. This skill is advisory only -- it does not modify any files.

## Instructions

### 1. Get the code to review

- Ask the user for the file(s) to review if not already provided. This could be a file path, a set of glob patterns, or a diff.
- Read every file in full before beginning analysis. Do not start writing feedback after reading only part of the code.

### 2. Understand the surrounding context

Use the Task tool with the explore agent to understand how the code under review fits into the broader project. At minimum, establish:

- The project's language, framework, and key conventions.
- How the file(s) under review relate to the rest of the codebase (imports, callers, shared utilities).
- Whether there are tests for the code under review.
- Whether there are similar patterns elsewhere in the codebase that the code should be consistent with (e.g. another command module, a sibling service, a parallel implementation).

This context is essential. A function that looks fine in isolation may be redundant, inconsistent, or misplaced when viewed in the context of the project.

### 3. Analyse for correctness

This is the highest priority. Look for:

- **Logic bugs** -- inverted conditions, off-by-one errors, unreachable code, comparisons that don't do what the author intended. If a condition is wrong, state clearly what it does and what it should do.
- **Unhandled edge cases** -- null/None values, empty collections, missing keys, zero-length inputs, boundary conditions. Trace the data flow and identify inputs that would cause crashes or wrong results.
- **Error handling** -- bare `except` clauses that swallow errors silently, missing error handling on I/O or network calls, error messages that hide useful information. Silent failure is always worth flagging.
- **Type safety** -- functions that can return None where callers don't check for it, implicit type coercions, missing type annotations that hide contract mismatches.
- **Concurrency and state** -- race conditions, shared mutable state, inconsistent snapshots (e.g. calling `datetime.now()` multiple times when a single value should be used).

### 4. Analyse for duplication and structure

- **Duplicated logic** -- identify code that appears in multiple places (within the file or across the codebase) and should be extracted into a shared function or module. Be specific: name the locations and describe what the shared abstraction would look like.
- **Wrong location** -- flag code that doesn't belong in the file it's in. Utility functions buried in a command module, platform-specific logic mixed with business logic, configuration embedded in application code.
- **Redundant work** -- identify places where the code computes the same thing twice, iterates a collection multiple times when once would suffice, or fetches data it already has.
- **Abstraction level** -- flag functions that operate at mixed levels of abstraction (e.g. a function that does high-level orchestration and also manual string formatting).

### 5. Analyse for performance

Only flag performance issues that are likely to matter in practice. Consider:

- **N+1 patterns** -- loops that make a network call or database query per iteration when a batch operation exists.
- **Sequential I/O that could be parallel** -- independent network calls or file reads that are executed one at a time when they could be concurrent.
- **Unnecessary work** -- computations inside loops that could be hoisted, data structures that force repeated linear scans, allocations that could be avoided.

Do not flag micro-optimisations that would hurt readability for negligible gain. Focus on algorithmic and I/O-level issues.

### 6. Analyse for maintainability

- **Missing tests** -- note if the code has no tests, especially for pure functions that are trivially testable. Note functions that are hard to test due to tight coupling with external dependencies.
- **Naming** -- flag names that are misleading, ambiguous, or inconsistent with the codebase's conventions. A variable named `data` or `result` in a context where something more specific would be clearer.
- **Comments and documentation** -- flag misleading comments, outdated docstrings, or missing documentation on public interfaces. Do not demand comments on self-explanatory code.
- **User-facing text** -- typos, grammatical errors, or misleading messages in help text, error messages, or CLI output.
- **Consistency** -- note where the code deviates from patterns established elsewhere in the same project without good reason.

### 7. Present the review

Structure the feedback as a numbered list of issues, ordered by severity (most critical first). For each issue:

- **State the problem clearly** -- what is wrong and where. Reference specific line numbers using the `file_path:line_number` format.
- **Explain why it matters** -- don't just say "this is bad." Explain the consequence: what breaks, what's harder to maintain, what confuses the next reader.
- **Show what better looks like** -- provide a concrete suggestion or code snippet where appropriate. Not a full rewrite, but enough that the author knows what direction to go.

After the numbered list, provide a short summary (2-4 sentences) that captures the overall state of the code and the most important theme the author should focus on.

## Guidelines

- Do NOT modify any files. This skill is for review only.
- Be harsh but constructive. The goal is to make the author a better engineer, not to demoralise them. Every criticism should come with enough context that the author learns something.
- Be specific. "This could be better" is useless feedback. "Line 42 compares `now >= get_race_utc(event)` but `get_race_utc` returns `datetime | None`, so this raises `TypeError` when the return is `None`" is useful feedback.
- Prioritise by impact. A logic bug that makes a feature silently broken is more important than a missing type annotation. Lead with the issues that matter most.
- Don't pad the review. If the code is good, say so briefly and focus on the few things that could improve. If the code has serious problems, don't soften the message with false praise.
- Don't nitpick formatting or style if the project has a formatter or linter configured. Focus on things that tools can't catch.
- Verify your claims. If you say a function is unused, confirm it with a search. If you say a condition is inverted, trace the logic. Wrong feedback is worse than no feedback.
- Consider the project's scale and context. A personal CLI tool has different standards than a production service. Adjust severity accordingly, but don't lower the bar on correctness.
- If prior review feedback exists in the conversation, check whether it was addressed. Note improvements and flag issues that were raised before but not fixed.

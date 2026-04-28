---
name: bms:poc
description: Creates a proof of concept implementation. Provides the smallest working solution to validate an idea, with no tests and minimal production concerns.
---

# Proof of Concept

Implement the smallest possible working solution to prove a concept. This skill is about speed and signal -- not production readiness.

## Principles

- **No tests.** Do not write unit tests, integration tests, or test scaffolding of any kind.
- **Minimal code.** Implement only what is required to demonstrate that the idea works. Cut every abstraction, layer, and wrapper that is not essential to the proof.
- **No over-engineering.** No dependency injection, no plugin systems, no config abstractions, no interfaces for their own sake. Solve the exact problem in front of you.
- **Hard-code where sensible.** If a value needs to exist to prove the concept, hard-code it. The goal is to answer the question "does this work?", not to build something configurable.
- **Prefer the standard library.** Reach for external dependencies only if the concept fundamentally requires them. If the standard library can do it, use the standard library.

## Instructions

### 1. Explore the existing codebase (if applicable)

If the PoC is intended to fit within an existing project, use the Task tool with the explore agent to understand the relevant context:

- The project's primary language and runtime.
- Any existing patterns or entry points the PoC should hook into or mimic.
- Any existing utilities or helpers that would reduce the amount of new code needed.

Skip this step if the PoC is a standalone script or has no relation to an existing codebase.

### 2. Plan the minimal implementation

Before writing any code, state clearly:

- What you will build (one or two sentences).
- What you will deliberately leave out and why.
- The expected output or behaviour that confirms the concept works.
- State the proof of concept.
- Write this to a file in them current folder e.g. `poc-[subject]-plan.txt`

### 3. Implement

Write the code. Adhere strictly to the principles above:

- One file if possible. Two files if the concept genuinely requires separation.
- No test files, no CI configuration, no linting setup, no Makefile unless the concept is specifically about those things.
- No README unless the user explicitly asks for one.
- Comments only where the intent would otherwise be unclear.

### 4. Show how to run it

After writing the code, provide the exact command(s) needed to run the PoC and observe the result. If there are prerequisites (install a dependency, set an env var, have a file present), state them plainly.

Do not describe what the code does line by line. Show the command and the expected output. Let the code speak.

## Guidelines

- If you find yourself writing more than ~100 lines for a PoC, stop and ask whether the scope has grown beyond what is needed to prove the concept. Cut mercilessly.
- If the concept cannot be proven without a significant amount of code, flag that to the user. A PoC that requires hundreds of lines before it can run is a warning sign about the approach.
- Do not add error handling beyond what is needed to prevent a confusing crash. A PoC that fails loudly on bad input is fine.
- Do not add logging frameworks, structured logging, or log levels. A `print` statement is sufficient.
- Do not create abstractions in anticipation of future needs. The PoC will either be thrown away or rewritten properly. Build for now, not for later.
- If the user asks for a feature that goes beyond proving the concept (e.g. "make it configurable", "add retries", "handle all edge cases"), push back and ask if that is needed to answer the core question. If it is, update the plan and note that the scope has grown.

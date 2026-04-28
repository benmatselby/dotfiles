---
name: bms:dependency-evaluator
description: Evaluates whether a GitHub repository (tool, library, or framework) is worth adopting for the current project. Use when given a GitHub repo URL to assess as a potential dependency or tool.
---

# Dependency Evaluator

Evaluate whether an external GitHub repository is worth adopting for the current project.

## Instructions

### 1. Fetch the dependency details

Gather information about the dependency from two sources:

**README and docs** -- Use WebFetch to retrieve the repository's README. Read it thoroughly to understand what the tool does, how it works, and what problems it solves.

**Repository metadata** -- Use the `gh` CLI to fetch structured metadata:

```
gh repo view <owner>/<repo> --json name,description,primaryLanguage,stargazerCount,forkCount,licenseInfo,latestRelease,pushedAt,createdAt,isArchived
```

From these sources, establish:

- What the tool/library does in concrete terms.
- Its primary language and tech stack.
- Its maturity: age, stars, release history, recent commit activity.
- Its maintenance status: is it actively developed, archived, or abandoned?
- Its license and any constraints that implies.
- Its dependencies and operational requirements (e.g. requires dnsmasq, needs root access, macOS-only).

### 2. Explore the current project

Use the Task tool with the explore agent to understand the current project. The exploration should focus on aspects relevant to the dependency being evaluated. At minimum, establish:

- The project's primary language(s) and framework(s).
- The dependency management approach (package.json, pyproject.toml, go.mod, etc.).
- The deployment model (Docker, Kubernetes, bare metal, serverless, etc.).
- The development workflow (dev servers, build tools, test frameworks).
- Any existing solutions in the codebase that overlap with what the dependency provides (e.g. if evaluating a proxy tool, look for existing proxy or networking configuration).

Tailor the exploration to the dependency. If the dependency is a testing library, focus on the project's test setup. If it is a deployment tool, focus on the project's deployment configuration.

### 3. Assess applicability

Compare the dependency against the current project across these dimensions:

- **Problem fit** -- Does this dependency solve a problem the project actually has? Is the problem significant enough to warrant a new dependency, or is it a minor inconvenience with a simpler fix?
- **Tech stack compatibility** -- Does it align with the project's language, framework, and runtime? Would adoption require introducing a new language or toolchain?
- **Complexity trade-off** -- What does adoption cost in terms of configuration, learning curve, and ongoing maintenance? What does it save? Is the trade-off favourable?
- **Maturity and maintenance** -- Is the project mature enough to rely on? Consider stars, commit frequency, number of contributors, issue response times, and whether it has reached a stable release.
- **Operational fit** -- Does it work with the project's deployment model? Are there platform restrictions (e.g. macOS-only, requires specific infrastructure)?
- **Alternatives** -- Are there simpler ways to achieve the same result? Could a small amount of custom code, a configuration change, or an already-installed dependency solve the problem?

### 4. Present the report

Structure the output as follows:

**Dependency Summary** -- What the tool/library is, what it does, its current status (maturity, maintenance, platform support). Keep this factual and concise.

**Current Project Context** -- The relevant aspects of the current project's architecture, tech stack, and existing patterns that relate to the dependency. Reference specific files using the `file_path:line_number` format.

**Applicability Assessment** -- A detailed evaluation covering each dimension from step 4. Be specific: reference concrete aspects of both the dependency and the current project. Present this as prose, not a checklist.

**Recommendation** -- A clear verdict: adopt, do not adopt, or conditionally adopt. State the reasoning plainly. If the recommendation is conditional, specify what conditions would need to be true (e.g. "adopt if you plan to run multiple Docker Compose stacks simultaneously").

## Guidelines

- Be honest and direct. If it is not a good fit, say so clearly. A dependency that adds complexity without solving a real problem is a net negative.
- Ground the assessment in specifics. Reference files, configurations, and architecture decisions in the current project.
- Evaluate the dependency as it is today, not as it might be in the future. Roadmap promises do not count.
- Flag early-stage tools (few commits, no releases, single contributor) as a risk factor.
- Consider the project's scale. A tool for large teams may be overkill for a small personal project.
- If you cannot make a confident assessment, say so and list what additional information would help.

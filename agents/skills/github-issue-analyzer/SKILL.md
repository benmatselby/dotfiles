---
name: github-issue-analyzer
description: Analyzes a GitHub issue by fetching its details and exploring the relevant codebase to identify the root cause and suggest solutions. Use when given a GitHub issue URL to investigate.
---

# GitHub Issue Analyzer

Analyze a GitHub issue to understand the problem and suggest solutions. This skill operates in a read-only, diagnostic capacity.

## Instructions

### 1. Get the GitHub issue URL

Ask the user for the GitHub issue URL if one has not already been provided. The URL should be in the format `https://github.com/<owner>/<repo>/issues/<number>`.

### 2. Parse the URL

Extract the owner, repo, and issue number from the URL.

### 3. Fetch the issue

Use the `gh` CLI to fetch the issue details:

```
gh issue view <number> --repo <owner>/<repo> --json title,body,labels,state,comments
```

If the issue has comments, read through all of them as they often contain crucial debugging information, workarounds, or clarifications from the reporter.

### 4. Explore the codebase

Based on the issue description:

- Identify the areas of the codebase that are likely relevant to the problem.
- Use search and file reading tools to explore those areas.
- Look for the specific code paths, configurations, or logic mentioned or implied by the issue.
- If the issue mentions error messages, search the codebase for where those messages originate.
- If the issue mentions specific features or commands, trace the execution flow.

### 5. Provide analysis

Structure your response as follows:

**Summary** — A concise summary of what the reporter is experiencing.

**Root Cause Analysis** — Your assessment of what is likely causing the issue. List the most probable causes in order of likelihood. Reference specific code locations using the `file_path:line_number` format.

**Relevant Code** — The key files and code sections involved, with brief explanations of their role in the issue.

**Suggested Solutions** — Concrete, actionable suggestions to fix or work around the issue. Where possible, describe the specific code changes needed. If there are multiple approaches, list them with trade-offs.

## Guidelines

- Do NOT make any changes to the codebase. This skill is for analysis only.
- Be precise about code locations. Always reference files and line numbers.
- If the issue lacks enough information to diagnose confidently, say so and list what additional information would help.
- Consider environment differences (OS, versions, PATH, configuration) as potential causes.
- Check for related issues or patterns in the codebase that might explain the behaviour.

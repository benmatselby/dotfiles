---
name: summarise-diary
description: Summarize diary entries for a given time period
---

Summarise diary entries for a monthly performance review.

## Instructions

1. Parse the arguments: $ARGUMENTS should be in format YYYY/MM (e.g., 2025/01). If not fully specified, default to the current year and/or month.

2. Read all files in `diary/YYYY/MM/` EXCEPT for `mpc-MM-YYYY.md` (e.g., `mpc-01-2025.md` for January 2025). That file is the output target.

3. Generate a summary under these headings:
   - **Projects**: What I worked on, progress made, blockers encountered
   - **Team**: Collaboration, support given/received, team interactions
   - **Tech Leads**: Work with/for tech leads, technical decisions, architecture discussions
   - **Department**: Broader department initiatives, cross-team work, process improvements

4. Be concise but specific. Include concrete examples and names where they appear in the entries.

5. Save the summary to `diary/YYYY/MM/mpc-MM-YYYY.md` (e.g., `diary/2025/01/mpc-01-2025.md`). If the file exists, overwrite it.

## Output format

Use markdown. Start with a heading lik.

---
name: bms:log-session
description: Log a one-line summary of the current OpenCode session to today's work diary under the Completed section
---

Log a summary of the current OpenCode session to today's work diary.

## Instructions

1. Determine today's date and derive the diary file path:
   - Format: `~/git/github/benmatselby/life/diary/YYYY/MM/DD-MM-YYYY.md`
   - Example: for 27 March 2026, the path is `~/git/github/benmatselby/life/diary/2026/03/27-03-2026.md`

2. Review the current conversation to understand what was achieved in this session.

3. Write a single, plain-English sentence summarising what was accomplished. It should be specific enough that in weeks or months it will be clear what work was done. Start with a verb (e.g. "Added...", "Fixed...", "Refactored...").

4. Read today's diary file and append the sentence as a new bullet point under the `## Completed` section, before any existing content in that section (or after it if entries already exist — always at the bottom of the section).
   - Format: `- <sentence>`

5. Do not modify any other section of the file.

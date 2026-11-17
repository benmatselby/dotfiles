---
name: bms:linear-ticket-from-pr
description: Create a Linear ticket from the referenced pull request.
---

# Create ticket

- Create a Linear ticket from the referenced pull request.
- Summarise the diff as a business statement for the ticket.
- Once you have the linear ticket, update the pull request title with the ticket number.
- The ticket should be put into the team identified by the environment variable: `${LINEAR_TEAM_ID}`
- It should be assigned to me.
- It should be marked in progress.

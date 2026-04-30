---
name: morning-briefing
description: Generate daily brief every morning
---

Pull data from all connected sources (Google Calendar, Gmail, and any other
available connectors) and produce a concise daily briefing as a markdown file.

## What to gather
- **Calendar:** All events for today (use Asia/Seoul timezone)
- **Email:** Unread messages from the last 24 hours (on Mondays, cover the
  full weekend back to Friday)

## How to prioritize
Present the **top 5 items I need to focus on today**, ranked by:
1. Time-sensitive actions with deadlines or penalties
2. Items requiring my direct response or review
3. Important updates from teammates or collaborators
4. Notable industry news or reading

## Filtering rules
- Skip automated security alerts and account notifications
- Deduplicate newsletters sent to multiple addresses
- Ignore marketing, social media invitations, and spam

## Output format
- Save as markdown to the workspace folder
- Include direct links (GitHub PRs, email threads, etc.) where possible
- If there are no calendar events, note it as a "focus day"
- Write in English; preserve Korean for Korean-only context (e.g., payment
  notices) and add a brief English summary beside it

## Tone
Brief and actionable — like a chief of staff's morning memo.

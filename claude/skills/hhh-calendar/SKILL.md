---
name: hhh-calendar
description: Convert a calendar screenshot to actual calendar events and register them to Google Calendar with gog command
---

- You should expect a screenshot of a calendar. If anything else is given, just report an error.
- Given a screenshot of a work schedule, your job is to extract a few important information.
- Extract dates of day off
    - 'RO' means regualar off
    - 'AL' means anuual leave
    - 'HOL' - not sure what it means but it's a day off anyway
- Mark these dates to my Google Calendar (Personal) with `gog` command
    - Event title is '혠 쉬는 날' and it is an all-day event
    - If you have trouble with the command, report an error and halt.
    - Make sure there is no duplicate

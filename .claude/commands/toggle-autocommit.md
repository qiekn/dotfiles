Toggle auto-commit on/off.

## Instructions

Check if `.claude/.no-autocommit` exists:

- **If it exists**: delete it. Tell the user: "Auto-commit: **ON**"
- **If it does NOT exist**: create it (empty file). Tell the user: "Auto-commit: **OFF** (use `/commit` to commit manually)"

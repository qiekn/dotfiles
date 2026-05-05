# Git Workflow

## Auto Commit

Check if `.claude/.no-autocommit` file exists:
- **If it does NOT exist**: after completing code changes, ALWAYS commit automatically without waiting for user to ask. Each logical change should be a separate commit.
- **If it exists**: do NOT commit automatically. Wait for the user to explicitly ask (e.g. `/commit`).

## Commit Message Format

see: git-commit-message skill

# Git Workflow

## Auto Commit

Check if `.claude/.no-autocommit` file exists:
- **If it does NOT exist**: after completing code changes, ALWAYS commit automatically without waiting for user to ask. Each logical change should be a separate commit.
- **If it exists**: do NOT commit automatically. Wait for the user to explicitly ask (e.g. `/commit`).

## Commit Message Format

```
<type>: <short description>
```

If additional context is needed, add a numbered list after a blank line:

```
refactor: split render pipeline into multiple passes

1. Split monolithic render() into per-pass functions
2. Add DepthPrePass and ShadowPass stages
3. Move post-processing to a dedicated compositing step
```

## Types

| Type | Usage |
|------|-------|
| init | Project initialization |
| add | Add third party library |
| llm | Claude Code config file changes |
| ep | Episode (milestone / checkpoint) |
| feat | New feature |
| update | Make some progress |
| fix | Fix a bug |
| docs | Documents (readme or comments) |
| refactor | Refactor code |
| chores | Some little changes |

## Rules

- First line: concise, imperative mood, no period at the end
- Keep the first line under 72 characters
- Only add numbered details when the change is non-obvious or touches multiple areas
- Do NOT add `Co-Authored-By` lines

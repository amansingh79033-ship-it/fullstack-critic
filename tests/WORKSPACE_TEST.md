# Automated Workspace Test

This test validates the local project setup and prepares a deterministic semantic-chunking test for the Composio workspace agent.

## What it checks automatically

- The target path exists.
- The target is a Git repository.
- `CRITIC.md` and `AGENTS.md` are present.
- `.critic-memory/` exists.
- Required memory files exist.
- A test request is written to `.critic-workflow-test.md`.

## What the Composio agent must validate

The generated request asks the Composio agent to:

1. Use only the discovery layer first.
2. Import only the smallest discovery chunks.
3. Summarize and discard discovery context.
4. Import the API layer only if evidence requires it.
5. Record active layers and excluded chunks.
6. Avoid modifying application files.

Run from PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\fullstack-critic\scripts\test-workspace.ps1 -Workspace C:\Users\Dell\woxy\myproject
```

Run from WSL:

```bash
bash fullstack-critic/scripts/test-workspace.sh /mnt/c/Users/Dell/woxy/myproject
```

The scripts validate setup locally. The actual AI behavior must run in the Composio workspace using the generated `.critic-workflow-test.md` request.

# Operating-System Guide

The agent rules are OS-independent. Only repository setup and local tool commands differ.

## Windows PowerShell

Use Windows paths:

```powershell
cd C:\Users\Dell\project
```

Clone the critic:

```powershell
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git $HOME\fullstack-critic
```

Copy instructions:

```powershell
Copy-Item "$HOME\fullstack-critic\{AGENTS.md,CLAUDE.md,GEMINI.md,CRITIC.md}" .
```

Create memory:

```powershell
New-Item -ItemType Directory -Force .critic-memory
```

Run local checks if the project supports them:

```powershell
Get-ChildItem
Get-Content .\CRITIC.md
```

## WSL2

Use Linux paths inside Ubuntu/WSL:

```bash
cd /mnt/c/Users/Dell/project
```

Clone:

```bash
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git ~/fullstack-critic
```

Copy instructions:

```bash
cp ~/fullstack-critic/{AGENTS.md,CLAUDE.md,GEMINI.md,CRITIC.md} .
mkdir -p .critic-memory
```

Do not use `/mnt/c/...` in a normal PowerShell prompt. Use `C:\Users\Dell\...` there.

## macOS

```bash
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git ~/fullstack-critic
cd ~/project
cp ~/fullstack-critic/{AGENTS.md,CLAUDE.md,GEMINI.md,CRITIC.md} .
mkdir -p .critic-memory
```

## Linux

```bash
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git ~/fullstack-critic
cd ~/project
cp ~/fullstack-critic/{AGENTS.md,CLAUDE.md,GEMINI.md,CRITIC.md} .
mkdir -p .critic-memory
```

## Native Composio workspace

The actual agent execution should happen in Composio. The operating system is relevant only when the agent needs to inspect a locally mounted workspace or when project checks are run locally.

## Common problems

| Problem | Fix |
|---|---|
| `/mnt/c/...` fails in PowerShell | Use `C:\Users\...` or open WSL2 |
| Files are missing | Confirm the repository root and copy the instruction files |
| Agent cannot inspect repository | Connect GitHub or workspace tools in Composio |
| Agent changes files too early | Disable writes and start in Review mode |
| Memory contains secrets | Remove secrets and rotate them if exposed |
| Performance claim has no evidence | Require a benchmark or representative load test |

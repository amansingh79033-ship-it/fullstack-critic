# Getting Started

## What this repository provides

`fullstack-critic` provides a Composio-native agent definition and operating protocol. It is not a standalone model server and does not require a separate AI CLI.

Use it inside a Composio workspace with repository access enabled.

## 1. Install the repository

### Windows PowerShell

```powershell
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git $HOME\fullstack-critic
cd $HOME\fullstack-critic
```

### WSL2, Linux, or macOS Bash

```bash
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git ~/fullstack-critic
cd ~/fullstack-critic
```

## 2. Prepare a project

Copy the instruction files into the project being reviewed.

PowerShell:

```powershell
Copy-Item "$HOME\fullstack-critic\{AGENTS.md,CLAUDE.md,GEMINI.md,CRITIC.md}" .
New-Item -ItemType Directory -Force .critic-memory
```

Bash, WSL2, Linux, or macOS:

```bash
cp ~/fullstack-critic/{AGENTS.md,CLAUDE.md,GEMINI.md,CRITIC.md} .
mkdir -p .critic-memory
```

The `CLAUDE.md` and `GEMINI.md` files are compatibility instruction files for repositories that already use those conventions. They do not require those products. The execution runtime remains Composio.

## 3. Create safe project memory

Create these files in `.critic-memory/`:

```text
PROJECT_PROFILE.md
DECISIONS.md
REVIEW_HISTORY.md
RUN_STATE.md
```

Use [`docs/ARCHITECTURE.md`](ARCHITECTURE.md) for the memory rules. Do not store secrets or private production data.

## 4. Configure the Composio workspace

1. Open Composio.
2. Create or select a workspace.
3. Add the contents of `agent/fullstack-critic-agent.md` as the agent instructions.
4. Make `CRITIC.md` available to the agent.
5. Connect GitHub or the relevant repository tools.
6. Give access to the target project repository.
7. Confirm the agent can read files and inspect diffs.
8. Keep write operations disabled for the initial review.

## 5. Run a review

Use this request:

```text
Review this repository using CRITIC.md and the Full-Stack Critic Agent contract. Start in discovery mode, select the smallest relevant semantic layer, load only direct dependencies, and do not modify files. Summarize and discard each layer before switching. Report exact file references, evidence, severity, performance impact, verification commands, excluded chunks, and remaining risks.
```

## 6. Plan and implement

After reviewing the findings:

```text
Create a prioritized implementation plan for the approved findings. Do not modify files. Include dependencies, rollback, compatibility risks, tests, and verification commands.
```

After approval:

```text
Implement the approved plan. Modify only required files, preserve public APIs, run focused checks, inspect the final diff, update non-sensitive memory, and report all results exactly.
```

## 7. Verify

```text
Verify the implementation. Run available tests, lint, type checks, security checks, benchmarks, and load-test checks. Do not invent results. Report passed, failed, skipped, and unavailable checks.
```

## 8. Operating modes

- **Review:** read-only evidence and findings.
- **Plan:** ordered implementation plan without edits.
- **Implement:** approved changes only.
- **Optimize:** baseline, hypothesis, measured change, comparison.
- **Verify:** tests, checks, diff, and remaining risks.

## 9. Safety

The default mode is read-only. Require explicit approval for code changes, migrations, security-policy changes, secrets, infrastructure, or public API changes. Use a branch for implementation and inspect the diff before merging.

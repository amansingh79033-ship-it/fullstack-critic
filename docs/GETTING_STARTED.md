# Getting Started

## 1. Install once

```bash
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git ~/fullstack-critic
mkdir -p ~/bin
ln -sf ~/fullstack-critic/scripts/critic ~/bin/critic
chmod +x ~/fullstack-critic/scripts/critic
```

If `critic` is not found, use `~/bin/critic` directly or add `~/bin` to your shell PATH.

## 2. Prepare a project

From the project root:

```bash
cp ~/fullstack-critic/{AGENTS.md,CLAUDE.md,GEMINI.md,CRITIC.md} .
mkdir -p .critic-memory
```

Add optional `PROJECT_REVIEW.md` with the stack, deployment, SLOs, traffic target, and constraints.

## 3. Initialize memory

Create `.critic-memory/PROJECT_PROFILE.md`:

```md
# Project Profile

- Backend:
- Frontend:
- Database:
- Cache:
- Deployment:
- API compatibility:
- Availability target:
- p95 latency target:
- Traffic target:
- Last verified:
```

Create `.critic-memory/DECISIONS.md`:

```md
# Architecture Decisions

Append verified decisions, alternatives, trade-offs, and dates here.
```

Create `.critic-memory/REVIEW_HISTORY.md`:

```md
# Review History

Append durable findings and status: open, fixed, verified, or accepted risk.
```

Create `.critic-memory/RUN_STATE.md`:

```md
# Current Run

- Task:
- Files inspected:
- Files changed:
- Checks run:
- Unresolved questions:
- Last updated:
```

Do not put secrets or sensitive production data in these files. Add `.critic-memory/` to `.gitignore` unless the team wants to version its non-sensitive memory.

## 4. Run the agent

Review:

```bash
~/bin/critic | claude
```

Plan:

```bash
~/bin/critic | claude "Create a prioritized plan. Do not modify files."
```

Implement an approved plan:

```bash
~/bin/critic | claude "Implement the approved plan, then run focused verification."
```

Verify:

```bash
~/bin/critic | claude "Verify correctness, security, tests, performance, and scalability."
```

Replace `claude` with the CLI you use.

## 5. Safe workflow

1. Start in review mode.
2. Read and approve the plan.
3. Run implementation mode on a branch.
4. Inspect the diff.
5. Run tests, lint, type checks, and security checks.
6. Run a representative benchmark or load test for performance work.
7. Ask the agent to verify.
8. Review memory updates before committing.

## 6. Pull requests

Attach the generated review to the pull request. Require human approval for security changes, migrations, API changes, and production configuration. Treat the 100,000 requests/minute target as a capacity-testing requirement, not a static-review conclusion.

# Full-Stack Critic Agent

A portable senior full-stack engineering agent for Claude Code, Gemini CLI, QoderCLI, Antigravity, and IDE terminals.

It reviews, plans, improves, optimizes, and verifies software across frontend, backend, APIs, databases, infrastructure, security, testing, and observability.

## Why do we need this?

Fast code review often misses system-level problems. A feature can pass unit tests and still fail in production because of an unindexed query, an unbounded API response, a retry storm, a memory leak, a frontend request waterfall, missing authorization, or a connection pool that cannot support peak traffic.

This agent provides a repeatable engineering gate. It:

- Reviews the full request path instead of isolated files.
- Finds correctness, security, reliability, and performance risks.
- Optimizes code only after understanding behavior and constraints.
- Preserves API contracts and backward compatibility by default.
- Uses memory to avoid repeating known project facts and decisions.
- Verifies changes with tests, static checks, benchmarks, and load-test recommendations.
- Separates evidence from assumptions and never promises scale without measurements.

The 100,000 requests/minute target is a review target, not a guarantee. Real capacity must be demonstrated with representative load tests.

## Four-command start

```bash
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git ~/fullstack-critic
mkdir -p ~/bin && ln -sf ~/fullstack-critic/scripts/critic ~/bin/critic && chmod +x ~/fullstack-critic/scripts/critic
cd /path/to/your-project && cp ~/fullstack-critic/{AGENTS.md,CLAUDE.md,GEMINI.md,CRITIC.md} .
~/bin/critic | claude
```

Replace `claude` with `gemini`, `qoder`, or another CLI that accepts stdin. Run the final command from the project root.

## Review modes

### Review only

```bash
~/bin/critic | claude
```

The agent reports findings and does not change files.

### Plan improvements

```bash
~/bin/critic | claude "Create a prioritized implementation plan. Do not modify files."
```

### Implement improvements

```bash
~/bin/critic | claude "Implement the approved fixes. Keep the diff focused and explain every change."
```

### Verify implementation

```bash
~/bin/critic | claude "Verify the implementation with tests, lint, type checks, security checks, and performance checks."
```

Always inspect the diff before merging.

## Project files

- `CRITIC.md` — engineering standards and review rubric.
- `AGENTS.md` — portable agent entry point.
- `CLAUDE.md` — Claude Code entry point.
- `GEMINI.md` — Gemini CLI entry point.
- `agent/fullstack-critic-agent.md` — agent lifecycle and operating contract.
- `prompts/fullstack-review.md` — default review request.
- `scripts/critic` — loads rules, project context, and memory.
- `docs/GETTING_STARTED.md` — detailed installation and usage.
- `docs/ARCHITECTURE.md` — agent and memory architecture.
- `docs/WHY.md` — rationale and limitations.

## Memory

The agent stores project-specific memory in `.critic-memory/` at the project root. This is intentionally separate from the global critic repository.

```text
.critic-memory/
├── PROJECT_PROFILE.md       # stack, architecture, SLOs, scale targets
├── DECISIONS.md             # accepted design decisions and trade-offs
├── REVIEW_HISTORY.md        # durable findings and their status
└── RUN_STATE.md             # current task, assumptions, and verification state
```

Do not store secrets, tokens, credentials, customer data, or sensitive production logs in memory. Add `.critic-memory/` to `.gitignore` unless the team intentionally wants to version its non-sensitive memory.

## Operating contract

The agent follows this sequence:

1. Discover repository structure and toolchain.
2. Load safe project memory and project instructions.
3. Inspect the relevant code and trace dependencies.
4. Produce evidence-backed findings.
5. Propose a small, ordered plan.
6. Modify files only when explicitly requested or approved.
7. Run appropriate checks.
8. Update memory with verified facts, decisions, and unresolved risks.
9. Report what changed, what passed, and what still needs verification.

## Important limitation

This is an instruction-driven agent. It does not replace production profiling, security review, capacity planning, or human approval. It should never invent test results or claim that a system supports a throughput target without evidence.

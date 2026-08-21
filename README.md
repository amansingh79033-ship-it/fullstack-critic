# Full-Stack Critic Agent

A Composio-native senior full-stack engineering agent for reviewing, correcting, cleaning, optimizing, and verifying software.

It is designed to run inside a Composio workspace. No Claude Code, Gemini CLI, QoderCLI, Groq, OpenAI, or other external AI provider is required by this project.

## Why this agent exists

Reviews that load an entire repository are slow, expensive, and easily distracted. Production risks usually live in a small connected path: a route and its middleware, a query and its index, a component and its API hook, or a deployment resource and its scaling settings.

This agent uses semantic chunking. It imports only the active layer and direct dependencies, records a verified summary, discards the active chunks, and then imports the next layer only when necessary.

## Agent workflow

```text
SELECT → IMPORT → WORK → SUMMARIZE → EXPORT → DISCARD
```

The agent can review, plan, implement, optimize, and verify. It changes files only after an explicit implementation request or approval.

## Repository guide

- `CRITIC.md` — review rubric and output format.
- `agent/fullstack-critic-agent.md` — Composio-only agent behavior.
- `layers/manifest.md` — semantic layer selection rules.
- `docs/SEMANTIC_CHUNKING.md` — chunk lifecycle and context discipline.
- `docs/ARCHITECTURE.md` — system architecture.
- `docs/GETTING_STARTED.md` — workspace setup.
- `docs/WHY.md` — rationale and limitations.

## Composio workspace usage

1. Open a Composio workspace.
2. Add or select the Full-Stack Critic Agent.
3. Connect GitHub or the relevant repository/workspace tools.
4. Select the target repository.
5. Ask for a review, plan, implementation, optimization, or verification.
6. Approve modifications before implementation.
7. Review the diff and verification report.

Example request:

```text
Review the checkout API. Start with the api layer, load only direct backend and database dependencies when evidence requires them, summarize and discard each layer before switching, then report correctness, security, and performance findings. Do not modify files.
```

## Scale target

Assess realistic capacity toward 100,000 requests per minute, approximately 1,667 requests per second. Never claim capacity without representative load-test evidence.

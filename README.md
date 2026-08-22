# Full-Stack Critic Agent

A **Composio-native senior full-stack engineering agent** for reviewing, correcting, cleaning, optimizing, and verifying software projects.

Public repository:

https://github.com/amansingh79033-ship-it/fullstack-critic

## Important: Composio-only runtime

This repository contains the agent contract, engineering rubric, semantic context protocol, memory rules, and documentation. The agent is intended to run inside a **Composio workspace** using Composio's connected repository and workspace tools.

No Claude Code, Gemini CLI, QoderCLI, Groq, OpenAI, or other external AI provider is required by this project.

## Quick installation

Clone on Windows PowerShell:

```powershell
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git $HOME\fullstack-critic
cd $HOME\fullstack-critic
```

Clone on Bash, WSL2, Linux, or macOS:

```bash
git clone https://github.com/amansingh79033-ship-it/fullstack-critic.git ~/fullstack-critic
cd ~/fullstack-critic
```

Then open Composio and:

1. Create or open a workspace.
2. Add the Full-Stack Critic Agent instructions from `agent/fullstack-critic-agent.md`.
3. Connect GitHub or the repository tools needed by the workspace.
4. Select the project repository.
5. Run a review request.

Detailed instructions are in [`docs/GETTING_STARTED.md`](docs/GETTING_STARTED.md).

## Features

- Read-only repository review
- Implementation planning
- Approved code changes
- Cleanup and refactoring
- Backend and frontend review
- REST and GraphQL API review
- Database and query review
- Cache and queue review
- Security review
- Scalability review toward 100,000 requests/minute
- Load-test planning
- Test-plan generation
- Observability review
- Deployment and infrastructure review
- Semantic chunking
- Active-layer context management
- Project-local memory
- Evidence-based findings
- Exact file and line references
- Compatibility and migration-risk analysis
- Review, plan, implement, optimize, and verify modes
- Composio workspace and repository-tool operation

## Agent workflow

```text
SELECT → IMPORT → WORK → SUMMARIZE → EXPORT → DISCARD
```

The agent loads only the relevant semantic layer and direct dependencies. It summarizes verified facts before switching layers and discards unrelated active context before importing another layer.

## Memory

Project-local memory is stored in:

```text
.critic-memory/
├── PROJECT_PROFILE.md
├── DECISIONS.md
├── REVIEW_HISTORY.md
└── RUN_STATE.md
```

Memory is selective, explicit, reviewable, and non-sensitive. Never store credentials, tokens, private keys, customer data, or raw sensitive logs.

## Example Composio request

```text
Review the checkout API. Start with the api layer. Import only the route, schema, middleware, client call, and focused tests. Load backend or database chunks only when evidence requires them. Summarize and discard each layer before switching. Do not modify files. Return correctness, security, reliability, and performance findings with exact file references.
```

## Implementation request

```text
Implement the approved fixes. Keep the diff focused. Preserve public API compatibility. Run focused tests, lint, type checks, and security checks where available. Record verified results in project memory and report remaining risks.
```

## Performance target

The agent assesses realistic capacity toward 100,000 requests per minute, approximately 1,667 requests per second. It must not claim that a system supports this target without representative load-test evidence.

## Documentation

- [`docs/GETTING_STARTED.md`](docs/GETTING_STARTED.md) — installation and Composio workspace setup
- [`docs/OS_GUIDE.md`](docs/OS_GUIDE.md) — Windows, WSL2, macOS, and Linux
- [`docs/FEATURES.md`](docs/FEATURES.md) — complete feature reference
- [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) — architecture and runtime model
- [`docs/SEMANTIC_CHUNKING.md`](docs/SEMANTIC_CHUNKING.md) — context lifecycle
- [`docs/WHY.md`](docs/WHY.md) — rationale and limitations
- [`layers/manifest.md`](layers/manifest.md) — semantic layer selection

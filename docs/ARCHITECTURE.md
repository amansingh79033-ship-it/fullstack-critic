# Agent Architecture

```text
Composio Workspace Agent
   |
   +--> CRITIC.md                         global engineering rubric
   +--> agent/fullstack-critic-agent.md  lifecycle and safety contract
   +--> layers/manifest.md                semantic layer selector
   +--> project instructions              scoped constraints
   +--> project memory                    selectively loaded
   +--> repository tools                  files, diffs, tests, GitHub
   |
   +--> SELECT layer
   +--> IMPORT minimal semantic chunks
   +--> WORK on one active layer
   +--> SUMMARIZE verified results
   +--> EXPORT to memory
   +--> DISCARD active chunks
   +--> IMPORT next layer only when required
```

## Composio-only execution

The agent is designed to run inside a Composio workspace. Composio supplies the agent runtime and connected repository/workspace tools. The GitHub repository stores the agent contract, rubric, context protocol, and documentation; it does not bundle a separate model provider.

## Layers, not monolithic context

The agent must not import the entire repository or all memory into every task. It uses the semantic layer manifest to select a focused working set. A layer may contain files, symbols, routes, queries, tests, or configuration blocks and their direct dependencies.

## Context lifecycle

Each layer is a context transaction:

```text
select → import → work → summarize → export → discard
```

The agent can move from `api` to `database`, for example, but must summarize the API findings first and discard unrelated API chunks before importing database chunks. This is context management, not a guarantee that provider-side logs are erased.

## Memory lifecycle

Memory remains project-local and explicit:

- `PROJECT_PROFILE.md` for stable facts.
- `DECISIONS.md` for accepted trade-offs.
- `REVIEW_HISTORY.md` for durable findings.
- `RUN_STATE.md` for the active layer and current task.

Only the relevant memory file is loaded for the current layer. Memory is verified against current code before use.

# Agent Architecture

```text
IDE / CLI
   |
   v
scripts/critic
   |
   +--> CRITIC.md                 global engineering rubric
   +--> agent/fullstack-critic-agent.md  lifecycle and memory contract
   +--> PROJECT_REVIEW.md         project-specific constraints
   +--> .critic-memory/*          project-local durable context
   +--> prompts/fullstack-review.md      requested operation
   |
   v
Selected model/CLI
   |
   +--> Review, plan, implement, optimize, or verify
   +--> Tests, static analysis, benchmarks, load-test guidance
   +--> Updated non-sensitive memory and final report
```

## Separation of concerns

### Global rules

`CRITIC.md` defines the engineering rubric and output format. It is shared across projects.

### Agent behavior

`agent/fullstack-critic-agent.md` defines the lifecycle, modes, safety rules, and memory protocol.

### Project context

`PROJECT_REVIEW.md` defines facts and constraints unique to an application.

### Memory

`.critic-memory/` is project-local. This prevents one project's architecture, assumptions, or risks from leaking into another project.

### Execution

`scripts/critic` composes the context. The selected CLI provides the model execution environment. This makes the agent portable rather than tied to one vendor.

## Memory lifecycle

1. Create `.critic-memory/` when a project first adopts the agent.
2. Populate `PROJECT_PROFILE.md` with verified facts.
3. Load memory before every meaningful task.
4. Verify important memory against current code and configuration.
5. Append decisions and durable findings after review or implementation.
6. Record unresolved risks in `RUN_STATE.md`.
7. Remove stale facts by adding a correction with date and evidence.

## Safety model

The default is read-only review. Changes require an explicit implementation request or approval. Every implementation must be followed by focused verification and a diff review. The agent must not fabricate performance numbers or silently change APIs, migrations, security controls, or deployment behavior.

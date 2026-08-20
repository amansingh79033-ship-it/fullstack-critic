# Why use the Full-Stack Critic Agent?

## The problem

Most reviews focus on the changed lines. Production failures often happen at boundaries: frontend to API, API to database, service to queue, or application to infrastructure.

Typical examples:

- A list endpoint returns every row because pagination was omitted.
- A retry policy multiplies traffic during a dependency outage.
- A database query is correct but has no supporting index.
- A cache removes latency until invalidation creates stale or unsafe data.
- A frontend component repeatedly fetches the same data.
- An endpoint checks authentication but not object-level authorization.
- A service scales horizontally while sharing a bottlenecked database pool.

## What this agent adds

The agent provides a consistent operating method across IDEs and CLI tools. It connects code quality with measurable production behavior and forces every important recommendation to include evidence and verification.

It is especially useful for:

- API and backend reviews
- Performance and optimization work
- Pre-production readiness checks
- Refactoring legacy systems
- Pull-request review assistance
- Database and cache changes
- Security and reliability checks
- Capacity planning toward high throughput

## Why built-in memory matters

Without memory, every run repeatedly asks basic questions and can contradict earlier decisions. With project-local memory, the agent can retain safe facts such as:

- The actual technology stack
- Service boundaries
- SLOs and traffic targets
- Known bottlenecks
- Accepted trade-offs
- Findings already fixed or accepted as risks
- Verification still outstanding

Memory improves continuity, but it must remain explicit and reviewable. The agent must verify memory against the current code because memory can become stale.

## What it cannot do

It cannot prove production capacity from static code alone. It cannot replace a human security review, production metrics, realistic load testing, or architecture ownership. It should assist engineering judgment, not bypass it.

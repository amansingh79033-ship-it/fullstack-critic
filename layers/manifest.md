# Semantic Layer Manifest

Use this manifest to load only the smallest relevant context. A layer is a temporary active working set, not the whole repository.

## Layer selection

| Layer | Load when the task involves | Typical chunks |
|---|---|---|
| `discovery` | orientation, unknown architecture, project map | root manifests, entrypoints, directory tree, deployment summary |
| `api` | endpoints, contracts, request/response behavior | route files, schemas, middleware, API tests, client calls |
| `backend` | services, business logic, concurrency, workers | handlers, services, queues, dependency clients, focused tests |
| `database` | queries, migrations, indexes, transactions | repositories, ORM models, SQL, migrations, DB tests |
| `cache-queue` | caching, events, background work | cache adapters, consumers, producers, retry/dead-letter code |
| `frontend` | UI, state, rendering, browser performance | affected components, hooks, stores, API clients, frontend tests |
| `security` | auth, permissions, secrets, threat analysis | auth middleware, policies, validators, config, security tests |
| `infra` | deployment, scaling, networking, observability | Docker, Kubernetes, Terraform, CI, dashboards, alert rules |
| `testing` | test strategy and verification | relevant unit/integration/e2e/load-test files and scripts |
| `performance` | latency, throughput, memory, profiling, optimization | hot path, benchmark, metrics, query plan, load-test files |

## Loading algorithm

1. Classify the request.
2. Start with one primary layer.
3. Select direct dependencies only.
4. Load symbols and ranges rather than whole files when supported.
5. Record the active layer in `.critic-memory/RUN_STATE.md`.
6. Summarize before switching layers.
7. Discard the previous active chunks.
8. Load the next layer only if required by evidence.

## Dependency examples

- `api` → `backend` → `database` only when the endpoint reaches persistence.
- `frontend` → `api` only for the affected client request.
- `performance` → `database` only when profiling identifies a query bottleneck.
- `security` → `api` or `infra` only for the relevant trust boundary.

Do not load unrelated frontend, infrastructure, or historical files just because they exist.

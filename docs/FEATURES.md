# Feature Reference

## Review capabilities

### Backend

- Service boundaries
- Blocking I/O
- Concurrency
- Worker pools
- Timeouts
- Retries
- Circuit breakers
- Backpressure
- Graceful shutdown
- Health checks
- Horizontal scaling
- Connection pools

### Frontend

- Bundle size
- Code splitting
- Lazy loading
- Rendering cost
- Large-list virtualization
- Request waterfalls
- Duplicate requests
- State management
- Memory leaks
- LCP, INP, and CLS
- Accessibility
- Mobile performance

### APIs

- Validation
- Authentication
- Authorization
- Idempotency
- Pagination
- Versioning
- Rate limits
- Payload size
- Error consistency
- N+1 requests
- Compatibility

### Databases and caches

- Indexes
- Full scans
- N+1 queries
- Transactions
- Locks
- Isolation
- Migrations
- Replication
- Connection pools
- Cache keys
- TTLs
- Invalidation
- Stampedes
- Queue backlogs

### Security

- Injection
- XSS
- CSRF
- SSRF
- IDOR
- Path traversal
- Secrets
- Unsafe deserialization
- Excessive permissions
- Token handling
- Sensitive logs

### Operations

- Structured logs
- Request IDs
- Metrics
- Traces
- RED metrics
- USE metrics
- SLOs
- Alerts
- Deployment
- Rollback
- Dependency failures
- Disaster recovery

## Agent modes

| Mode | Default writes | Purpose |
|---|---:|---|
| Review | No | Evidence-backed findings |
| Plan | No | Prioritized implementation plan |
| Implement | Only with approval | Correct and clean code |
| Optimize | Only with approval | Measured performance improvements |
| Verify | No by default | Tests, checks, benchmarks, and risks |

## Semantic chunking

The agent uses focused layers:

```text
discovery, api, backend, database, cache-queue,
frontend, security, infra, testing, performance
```

It imports only the current layer and direct dependencies, writes a verified summary, discards the active context, and then loads the next layer only when required.

## Project memory

```text
.critic-memory/
├── PROJECT_PROFILE.md
├── DECISIONS.md
├── REVIEW_HISTORY.md
└── RUN_STATE.md
```

Memory is selective and project-local. It must never contain secrets or sensitive customer data.

## Scale analysis

The agent evaluates systems toward:

```text
100,000 requests/minute
≈ 1,667 requests/second
```

It examines:

- Throughput
- Peak traffic
- p50/p95/p99 latency
- Error rate
- CPU
- Memory
- Database capacity
- Cache hit rate
- Queue depth
- Connection limits
- Horizontal scaling
- Failure recovery

Static review does not prove capacity. Load-test evidence is required.

## Output

Every review should include:

- Executive summary
- Severity-ranked findings
- Exact file and line references
- Evidence
- Expected impact
- Recommended fix
- Verification method
- Scalability assessment
- Security assessment
- Test plan
- Prioritized action plan
- Final verdict
- Active layers and chunks
- Excluded chunks
- Memory updates
- Remaining risks

# Semantic Chunking and Active Context

## Goal

Keep the Composio agent focused, fast, and accurate by importing only the code and memory needed for the current task. After finishing a layer, export a concise verified summary and remove that layer from the active working set before importing another.

## What is a semantic chunk?

A semantic chunk is the smallest useful unit of project context, such as:

- A function and its direct callers
- A route, schema, middleware, and focused test
- A database query, model, index, and migration
- A component, hook, state store, and API client call
- A deployment resource and its referenced environment variables
- A benchmark and the implementation it measures

Avoid arbitrary whole-file loading when symbol-level or range-level retrieval is possible.

## Context transaction

Every layer follows this transaction:

```text
SELECT  ->  IMPORT  ->  WORK  ->  SUMMARIZE  ->  EXPORT  ->  DISCARD
```

### SELECT

Classify the task with `layers/manifest.md`. Choose a primary layer and list direct dependencies.

### IMPORT

Fetch only the selected chunks. Include the minimum memory file required for the layer. Do not import all memory or the whole repository.

### WORK

Review, plan, implement, optimize, or verify only within the active layer. Record files and symbols used.

### SUMMARIZE

Record verified facts, findings, decisions, measurements, and unresolved questions. Keep summaries short and durable.

### EXPORT

Write the summary to `RUN_STATE.md`, `REVIEW_HISTORY.md`, or `DECISIONS.md` as appropriate. Never export secrets.

### DISCARD

Remove the previous chunks from the active retrieval set. Do not carry unrelated code into the next layer. Keep only the durable summary and explicit dependencies.

## Correctness rules

- Context reduction must not remove a security boundary, transaction boundary, public API contract, or direct dependency.
- If evidence is insufficient, import the next smallest dependency layer.
- Do not guess missing code.
- Do not report an optimization without a baseline or clear evidence.
- Do not claim a layer is complete until its focused tests and checks are considered.

## Benefits

- Lower context usage
- Faster reviews
- Fewer irrelevant suggestions
- Less cross-project memory contamination
- Easier debugging
- Better traceability of why each file was loaded
- Safer optimization because the active scope is explicit

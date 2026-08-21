#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "${1:-.}" && pwd)"

for file in CRITIC.md AGENTS.md; do
  test -f "$ROOT/$file" || { echo "FAIL: missing $ROOT/$file"; exit 1; }
done

git -C "$ROOT" rev-parse --show-toplevel >/dev/null || { echo "FAIL: not a Git repository: $ROOT"; exit 1; }

MEMORY="$ROOT/.critic-memory"
mkdir -p "$MEMORY"

test -f "$MEMORY/PROJECT_PROFILE.md" || printf '# Project Profile\n\n- Stack:\n- Deployment:\n- SLOs:\n- Traffic target:\n- Last verified:\n' > "$MEMORY/PROJECT_PROFILE.md"
test -f "$MEMORY/DECISIONS.md" || printf '# Decisions\n\nAppend verified architectural decisions here.\n' > "$MEMORY/DECISIONS.md"
test -f "$MEMORY/REVIEW_HISTORY.md" || printf '# Review History\n\nAppend durable findings and statuses here.\n' > "$MEMORY/REVIEW_HISTORY.md"
test -f "$MEMORY/RUN_STATE.md" || printf '# Current Run\n\n- Active layer: none\n- Imported chunks: none\n- Discarded layers: none\n- Last updated: automated workspace test\n' > "$MEMORY/RUN_STATE.md"

cat > "$ROOT/.critic-workflow-test.md" <<'EOF'
Run the semantic context test on this workspace using Composio only.

Do not modify application files.

1. Select the discovery layer.
2. Import only the smallest relevant repository chunks.
3. Record the active layer and imported chunks in .critic-memory/RUN_STATE.md.
4. Summarize discovery findings.
5. Discard discovery chunks before loading anything else.
6. Load the api layer only if discovery evidence requires it.
7. Summarize and discard every layer before switching.
8. Report imported chunks, excluded chunks, layer transitions, memory updates, and any workflow violation.
EOF

echo "PASS: workspace is prepared for the Composio semantic workflow test"
echo "Workspace: $ROOT"
echo "Request: $ROOT/.critic-workflow-test.md"
echo "Next: open Composio workspace and submit the request file to the embedded agent"

param(
  [string]$Workspace = (Get-Location).Path
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path $Workspace).Path
$required = @('CRITIC.md', 'AGENTS.md')
$missing = @($required | Where-Object { -not (Test-Path (Join-Path $root $_)) })

if ($missing.Count -gt 0) {
  Write-Error "Missing required files: $($missing -join ', ')"
}

git -C $root rev-parse --show-toplevel *> $null
if ($LASTEXITCODE -ne 0) {
  Write-Error "Workspace is not a Git repository: $root"
}

$memory = Join-Path $root '.critic-memory'
New-Item -ItemType Directory -Force $memory | Out-Null

$templates = @{
  'PROJECT_PROFILE.md' = '# Project Profile`n`n- Stack:`n- Deployment:`n- SLOs:`n- Traffic target:`n- Last verified:`n'
  'DECISIONS.md' = '# Decisions`n`nAppend verified architectural decisions here.`n'
  'REVIEW_HISTORY.md' = '# Review History`n`nAppend durable findings and statuses here.`n'
  'RUN_STATE.md' = '# Current Run`n`n- Active layer: none`n- Imported chunks: none`n- Discarded layers: none`n- Last updated: automated workspace test`n'
}

foreach ($name in $templates.Keys) {
  $file = Join-Path $memory $name
  if (-not (Test-Path $file)) {
    Set-Content -Path $file -Value $templates[$name] -Encoding utf8
  }
}

$request = @'
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
'@
Set-Content -Path (Join-Path $root '.critic-workflow-test.md') -Value $request -Encoding utf8

Write-Host "PASS: workspace is prepared for the Composio semantic workflow test"
Write-Host "Workspace: $root"
Write-Host "Request: $(Join-Path $root '.critic-workflow-test.md')"
Write-Host "Next: open Composio workspace and submit the request file to the embedded agent"

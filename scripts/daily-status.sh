#!/usr/bin/env bash
# Idempotent client pulse. Rewrites STATUS.md from git history.
# Safe to run locally or from GitHub Actions. Does not invent work.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

export TZ="${TZ:-America/Chicago}"
TODAY="$(date +%F)"
NOW="$(date -Iseconds)"

mkdir -p progress

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  LOG="$(git log --since='24 hours ago' \
    --pretty=format:'- `%h` %ad — %s' \
    --date=short \
    -- . \
    ':(exclude)STATUS.md' \
    || true)"
  LAST="$(git log -1 --pretty=format:'%ad `%h` %s' --date=short 2>/dev/null || echo 'none')"
else
  LOG=""
  LAST="not a git repo"
fi

{
  echo "# Status"
  echo
  echo "Generated: ${NOW} (${TZ})"
  echo
  echo "## Last 24 hours"
  echo
  if [[ -z "${LOG}" ]]; then
    echo "No document or skill commits in the last 24 hours."
    echo
    echo "Last activity: ${LAST}"
  else
    echo "${LOG}"
  fi
  echo
  echo "## Where to look"
  echo
  echo "- [SOW](docs/SOW.md)"
  echo "- [PRD (skill-specific)](docs/PRD-specific.md)"
  echo "- [SOP (skill-specific)](docs/SOP-specific.md)"
  echo "- [Journal ${TODAY}](progress/${TODAY}.md) (file may not exist yet)"
  echo
  echo "## Rule"
  echo
  echo "Quiet day = no paper moved. Do not backfill fake tasks."
} > STATUS.md

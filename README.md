# x402 Oracle Consultant

Client window for Dilly's Trading Co. — Agensi skill **x402-oracle-consultant**.

SOW ID: `DTC-AGENSI-X402-ORACLE-001`  
Listing target: **$15** one-time on [Agensi](https://www.agensi.io/)  
Host (do not “fix” the spelling): `https://x402orcle.vercel.app`

This repo is the paper trail. The skill zip is produced from it; it is not the Agensi listing itself.

## Read in this order

1. [STATUS.md](STATUS.md) — last 24 hours (regenerated daily)
2. [docs/SOW.md](docs/SOW.md) — what is in / out of v1
3. [docs/PRD-specific.md](docs/PRD-specific.md) — skill requirements
4. [docs/SOP-specific.md](docs/SOP-specific.md) — build / zip / submit steps
5. [progress/](progress/) — dated journal (newest first)

Supporting: [docs/PRD.md](docs/PRD.md) (family overview), [docs/Agensi-Skill-Building-SOP.md](docs/Agensi-Skill-Building-SOP.md) (marketplace process).

## Current state

| Item | State |
|------|--------|
| SOW | Written 2026-10-30. Waiting on owner “execute” before SKILL.md |
| Live API lock | `GET /api/health`, `GET /api/pricing`, `POST /api/consult/<tier>` |
| Package zip | Not started |
| Agensi listing | Not submitted |

## How this stays current

- Every real change is a git commit. GitHub history is the audit log.
- GitHub Action `daily-status` rewrites `STATUS.md` every day at 07:00 America/Chicago (12:00 UTC) and on each push.
- Human notes go in `progress/YYYY-MM-DD.md`. Empty days are honest: STATUS will say no commits.

Do not treat a quiet STATUS as a failed delivery. Treat it as “no paper moved.”

## Access

Private org repo: https://github.com/x402-oracle/x402-oracle-consultant

Keith (kwizzlesurp10-ctrl) and Dillon are partners. Accept the GitHub org + repo invites, then Watch the repo. STATUS.md is the daily pulse.

Operator notes: [CLIENT-ACCESS.md](CLIENT-ACCESS.md)

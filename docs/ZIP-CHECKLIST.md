# ZIP checklist — x402-oracle-consultant

**SOW ID:** DTC-AGENSI-X402-ORACLE-001  
**Paper-trail date:** 2026-10-30  
**M0:** not passed. `owner_execute` empty. This file is not the word “execute”.  
**Package under test:** none. `SKILL.md` absent. `x402-oracle-consultant.zip` absent.

Print in black on white. Status words are the record. Do not treat an empty box as a pass.

| Word | Meaning |
|------|---------|
| **PASS** | Checked this pass against a file or a free GET. |
| **FAIL** | Checked this pass. The rule is not met. |
| **BLOCKED-ON-M0** | Cannot pass until the owner says “execute” and D1 exists. |

**Assumptions**

- Task date is 2026-10-30. Free GET clock is 2026-10-31T04:48:10Z through 2026-10-31T04:48:11Z (23:48 America/Chicago, still 2026-10-30).
- Request body stays `{"question":"<user question>"}` per SOW §4.1. Not re-probed. No POST. No `/openapi.json` fetch.
- SOW wins over PRD/SOP. §11 wins on paths and prices.
- Listing price $15 is paid to Dilly's Trading Co. via Agensi. Oracle USDC is separate and is paid to the oracle, not to Dilly's Trading Co.
- Public `payTo` stays in SOW §11. It is not copied below.

## D1–D6 gap

| ID | Deliverable | State | Evidence |
|----|-------------|--------|----------|
| D1 | `SKILL.md` | **Blocked** | Missing. M0 not passed. |
| D2 | Security pre-flight log | **Missing** | Eight scan rows below are not Pass. This sheet is the blank. |
| D3 | `x402-oracle-consultant.zip` | **Missing** | No zip in the repo. |
| D4 | Listing packet | **Missing** | No paste-ready packet. Price and tags are specified, not written up. |
| D5 | Dry-run record | **Missing** | No consult probe. No 402 transcript. No payment header. |
| D6 | Submit confirmation | **Missing** | Not uploaded. Creator Mode not verified in this repo. |

Also on disk, not D1–D6: `docs/SOW.md`, `docs/PRD-specific.md`, `docs/SOP-specific.md`, client window (`README.md`, `CLIENT-ACCESS.md`), daily STATUS (`STATUS.md`, `scripts/daily-status.sh`, `.github/workflows/daily-status.yml`). Live paths are locked in SOW §11 and matched by the free GETs recorded below.

## Counts (this sheet)

| Status | Count |
|--------|------:|
| PASS | 2 |
| FAIL | 1 |
| BLOCKED-ON-M0 | 20 |

## Package (zip not built)

- [ ] **1. BLOCKED-ON-M0** — `SKILL.md` at zip root. No wrapping folder. File does not exist.
- [ ] **2. BLOCKED-ON-M0** — Optional `reference.md` only. Not required for Done. No other payload files. Nothing to zip.
- [ ] **3. BLOCKED-ON-M0** — No `node_modules`, binaries, `.env`, secrets, wallets, or private keys inside the zip. Zip does not exist, so this cannot pass. Repo observation only: no `node_modules`, no `.env` (existence check; file not opened), no zip. That observation is not a package pass.
- [ ] **4. BLOCKED-ON-M0** — Zip name is `x402-oracle-consultant.zip`.
- [ ] **5. BLOCKED-ON-M0** — Size ≤ 50 MB. (SOW §12 agent-upload cap is tighter: 5 MB and 100 files. Apply that cap too when the zip exists. It does not create a pass today.)
- [ ] **6. BLOCKED-ON-M0** — ≤ 1,000 files.
- [ ] **7. BLOCKED-ON-M0** — Text-only.
- [ ] **8. BLOCKED-ON-M0** — `unzip -l` smoke test shows `SKILL.md` at the archive root.

## Agensi 8-point scan

No `SKILL.md` to scan. Do not mark these Pass by reading the SOW.

- [ ] **9. BLOCKED-ON-M0** — Structure. Valid YAML frontmatter, size, file count, no bundled deps.
- [ ] **10. BLOCKED-ON-M0** — File types. Markdown, text, or simple scripts only.
- [ ] **11. BLOCKED-ON-M0** — No destructive commands, privilege escalation, remote piping, or `os.system`.
- [ ] **12. BLOCKED-ON-M0** — No hardcoded secrets.
- [ ] **13. BLOCKED-ON-M0** — No sensitive env harvesting.
- [ ] **14. BLOCKED-ON-M0** — Every outbound host and path the instructions name is listed in `external_urls`.
- [ ] **15. BLOCKED-ON-M0** — No eval chains or obfuscation.
- [ ] **16. BLOCKED-ON-M0** — No “ignore previous instructions” and no other agent-manipulation phrase.

## Declaration, gate, host, listing

- [ ] **17. BLOCKED-ON-M0** — `external_urls` minimum is these eight URLs and no bare consult collection:

  - `https://x402orcle.vercel.app`
  - `https://x402orcle.vercel.app/api/health`
  - `https://x402orcle.vercel.app/api/pricing`
  - `https://x402orcle.vercel.app/api/consult/oracle_ask`
  - `https://x402orcle.vercel.app/api/consult/oracle_diagnose_402`
  - `https://x402orcle.vercel.app/api/consult/oracle_bazaar_rewrite`
  - `https://x402orcle.vercel.app/api/consult/oracle_review_mcp`
  - `https://x402orcle.vercel.app/api/consult/complete_oracle_task`

  Do not declare `GET /api/consult` (SOW §11: 404). Do not declare `/mcp`. Do not declare any host other than `x402orcle.vercel.app`. The pricing JSON `connect` string names `https://api.cdp.coinbase.com/` (facilitator) and env setup. Do not copy that string into D1. Do not add that host to `external_urls`.

- [ ] **18. BLOCKED-ON-M0** — Human-approval gate is present and cannot be skipped. Required shape when D1 is written: explicit yes in the current conversation, with exact USD, tier name, path, and network Base USDC / `eip155:8453`, before any `PAYMENT-SIGNATURE`. This pass did not construct that header.

- [ ] **19. BLOCKED-ON-M0** — Skill package spells the host `x402orcle` (one “a”). Governing docs already use that spelling. The package does not exist, so the row stays blocked.

- [ ] **20. BLOCKED-ON-M0** — Listing packet: **$15** one-time, plus tags `x402`, `oracle`, `mcp`, `agent-payments`, `base`, `usdc`. SOW §12 also lists `a2a` and `bazaar` (still ≤ 10 tags). Packet not written. Oracle spend ($0.10 / $0.50 / $1.50 / $3.00 / $10.00) is not the listing price.

## Checked this pass

- [x] **21. PASS** — Public payTo already documented in SOW §11 — do not relocate. Live `GET /api/pricing` `payTo` matched that value (42-character receive address, compared, not written here).

- [x] **22. PASS** — Free GET lock, 2026-10-31T04:48:10Z–2026-10-31T04:48:11Z, both HTTP 200. `GET /api/health`: `ok=true`, `version=0.1.0`, `wallet_configured=false`, `pay_to_configured=true`, `demoMode=false`, `network=eip155:8453`, `slug=x402orcle`. `GET /api/pricing`: `network=eip155:8453`; free `oracle_health` → `/api/health`, `oracle_pricing` → `/api/pricing`; paid `oracle_ask` $0.10, `oracle_diagnose_402` $0.50, `oracle_bazaar_rewrite` $1.50, `oracle_review_mcp` $3.00, `complete_oracle_task` $10.00, each `POST /api/consult/<tier>`. Array order on the wire differs from the §11 table order. Paths and prices match. No POST.

## Do not copy

- [ ] **23. FAIL** — `docs/SOP-specific.md` Step 2 sample `external_urls` is origin plus bare `https://x402orcle.vercel.app/api/consult`. It omits `/api/health`, `/api/pricing`, and the five tier paths. `docs/PRD.md` §3.3 says the same bare consult path. SOW §3 and §11 already override both. Do not copy those samples into D1. SOW was not rewritten.

## Not a zip row (recorded, not scored)

- `README.md` says `daily-status` also runs on each push. `.github/workflows/daily-status.yml` does not (`cron` 07:00 America/Chicago and `workflow_dispatch` only; comment says not on push, because a STATUS timestamp would loop). No edit this pass.
- No `docs/SOW-ERRATA.md`. Live health and pricing match §11.

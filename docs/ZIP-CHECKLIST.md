# ZIP checklist — x402-oracle-consultant

**SOW ID:** DTC-AGENSI-X402-ORACLE-001  
**Paper-trail date:** 2026-10-30, updated 2026-10-31  
**M0:** passed 2026-10-31 00:00 America/Chicago. Owner said “execute” in chat.  
**M2:** `SKILL.md` written at repo root. No `reference.md` (SOW: optional, not required for Done).  
**Package under test:** `SKILL.md` only. `x402-oracle-consultant.zip` still absent.

Print in black on white. Status words are the record. Do not treat an empty box as a pass.

| Word | Meaning |
|------|---------|
| **PASS** | Checked this pass against `SKILL.md` or a free GET. |
| **FAIL** | Checked this pass. The rule is not met. |
| **BLOCKED-ON-D3** | Zip-only. `SKILL.md` existing at repo root does not pass it. |
| **BLOCKED-ON-D4** | Listing packet not written. |

**Assumptions**

- M1 re-check clock: 2026-10-31T05:03:03Z. Both free GETs HTTP 200. Paths, prices, network, and health flags still match SOW §11. Prior check 2026-10-31T04:48:10Z–04:48:11Z agreed.
- Request body in D1 is `{"question":"<user question>"}`. Not re-probed with POST. No `/openapi.json` fetch.
- SOW wins over PRD/SOP. §11 wins on paths and prices.
- Listing price $15 is listing metadata (D4). Oracle USDC is separate and is paid to the oracle.
- Public `payTo` stays in SOW §11. D1 tells the agent to read it from live `/api/pricing`. It is not copied below.

## D1–D6 gap

| ID | Deliverable | State | Evidence |
|----|-------------|--------|----------|
| D1 | `SKILL.md` | **Present** | Repo root. Frontmatter parsed. Phases numbered. Hard constraints before phases. Dry-run is the last section. Not zipped. |
| D2 | Security pre-flight log | **Partial** | File-level points on this sheet are Pass. Archive size, file count, and `unzip -l` stay open. Not accepted as D2 Done. |
| D3 | `x402-oracle-consultant.zip` | **Missing** | No zip in the repo. |
| D4 | Listing packet | **Missing** | No paste-ready packet. |
| D5 | Dry-run record | **Missing** | The skill contains a written example. No live consult probe. No 402 transcript from the host. No payment header. |
| D6 | Submit confirmation | **Missing** | Not uploaded. Creator Mode not verified in this repo. |

## Counts (this sheet)

| Status | Count |
|--------|------:|
| PASS | 13 |
| FAIL | 1 |
| BLOCKED | 9 |

Blocked split: **BLOCKED-ON-D3** 8 (rows 1–8), **BLOCKED-ON-D4** 1 (row 20). **BLOCKED-ON-M0** 0.

## Package (zip not built)

- [ ] **1. BLOCKED-ON-D3** — `SKILL.md` at zip root, no wrapping folder. The file is at the repo root. No archive exists, so `unzip -l` was not run.
- [ ] **2. BLOCKED-ON-D3** — Optional `reference.md` only. `reference.md` was not added. Header names and the unpaid example are in `SKILL.md`. The zip’s file list is still unproven.
- [ ] **3. BLOCKED-ON-D3** — No `node_modules`, binaries, `.env`, secrets, wallets, or private keys inside the zip. Zip does not exist. `SKILL.md` itself has none of those. That is not a package pass.
- [ ] **4. BLOCKED-ON-D3** — Zip name is `x402-oracle-consultant.zip`.
- [ ] **5. BLOCKED-ON-D3** — Size ≤ 50 MB. `SKILL.md` is 11294 bytes. The archive cap, including the tighter agent-upload cap (5 MB, 100 files), is not measured.
- [ ] **6. BLOCKED-ON-D3** — ≤ 1,000 files in the zip.
- [ ] **7. BLOCKED-ON-D3** — Text-only zip. `SKILL.md` is markdown. The archive was not built.
- [ ] **8. BLOCKED-ON-D3** — `unzip -l` smoke test shows `SKILL.md` at the archive root.

## Agensi 8-point scan

Scanned `SKILL.md` only, 2026-10-31. Rows 5–8 still cover the archive.

- [x] **9. PASS** — Structure. YAML frontmatter parses. Keys: `name` (`x402-oracle-consultant`), `description`, `external_urls` (8). No bundled deps. Zip size and file count remain rows 5–6.
- [x] **10. PASS** — File types. D1 is one markdown file. No `reference.md`. No binary added.
- [x] **11. PASS** — No destructive commands, privilege escalation, remote piping, or `os.system` in `SKILL.md`.
- [x] **12. PASS** — No hardcoded secrets in `SKILL.md`. No receive address. No key material.
- [x] **13. PASS** — No environment harvesting in `SKILL.md`. The file forbids reading the process environment. It does not read one.
- [x] **14. PASS** — Every outbound host and path named as a call is in `external_urls`. No second host.
- [x] **15. PASS** — No eval chain or obfuscation in `SKILL.md`.
- [x] **16. PASS** — The agent-manipulation phrase this row forbids is absent from `SKILL.md`.

## Declaration, gate, host, listing

- [x] **17. PASS** — `external_urls` is exactly these eight URLs. Bare `/api/consult` is not listed. `/mcp` is not listed. `https://api.cdp.coinbase.com/` is not listed.

  - `https://x402orcle.vercel.app`
  - `https://x402orcle.vercel.app/api/health`
  - `https://x402orcle.vercel.app/api/pricing`
  - `https://x402orcle.vercel.app/api/consult/oracle_ask`
  - `https://x402orcle.vercel.app/api/consult/oracle_diagnose_402`
  - `https://x402orcle.vercel.app/api/consult/oracle_bazaar_rewrite`
  - `https://x402orcle.vercel.app/api/consult/oracle_review_mcp`
  - `https://x402orcle.vercel.app/api/consult/complete_oracle_task`

- [x] **18. PASS** — Human approval gate is Phase 4, after the unpaid 402 and before Phase 5. The ask states live USD, tier, path, and Base USDC / `eip155:8453`, and waits for an explicit yes in the current conversation. Any other reply stops the paid call. The skill forbids creating a `PAYMENT-SIGNATURE`. This session did not construct that header.

- [x] **19. PASS** — Host spelling in `SKILL.md` and in `external_urls` is `x402orcle` (one “a”).

- [ ] **20. BLOCKED-ON-D4** — Listing packet: **$15** one-time, plus tags `x402`, `oracle`, `mcp`, `agent-payments`, `base`, `usdc`. SOW §12 also lists `a2a` and `bazaar`. Packet not written. `SKILL.md` says the marketplace price is not an oracle charge and does not quote $15 as a consult price.

## Checked this pass

- [x] **21. PASS** — Public payTo already documented in SOW §11 — do not relocate. `SKILL.md` points at live `payTo` and does not embed it. `GET /api/pricing` at 2026-10-31T05:03:03Z still matched §11 (42-character receive address, compared, not written here).

- [x] **22. PASS** — Free GET lock, 2026-10-31T05:03:03Z, both HTTP 200. Same result as 2026-10-31T04:48:10Z–04:48:11Z. Health: `ok=true`, `version=0.1.0`, `wallet_configured=false`, `pay_to_configured=true`, `demoMode=false`, `network=eip155:8453`, `slug=x402orcle`. Pricing: `network=eip155:8453`; free paths `/api/health` and `/api/pricing`; paid `oracle_ask` $0.10, `oracle_diagnose_402` $0.50, `oracle_bazaar_rewrite` $1.50, `oracle_review_mcp` $3.00, `complete_oracle_task` $10.00. No POST.

## Do not copy

- [ ] **23. FAIL** — `docs/SOP-specific.md` Step 2 and `docs/PRD.md` §3.3 still show bare `https://x402orcle.vercel.app/api/consult`. D1 did not copy that sample. Those source files were not rewritten. SOW §11 still overrides them.

## Not a zip row (recorded, not scored)

- `README.md` says `daily-status` also runs on each push. `.github/workflows/daily-status.yml` does not (`cron` 07:00 America/Chicago and `workflow_dispatch` only). No edit this pass.
- No `docs/SOW-ERRATA.md`. Live health and pricing match §11.

# Statement of Work

**Project:** x402 Oracle Consultant — Agensi skill (v1.0)
**SOW ID:** DTC-AGENSI-X402-ORACLE-001
**Effective date:** 2026-10-30
**Status:** Ready to execute
**Document type:** Statement of Work (self-directed build under Dilly's Trading Co.)
**Not:** legal advice, MSA, order form, or Agensi listing copy

---

## 1. Parties

| Role | Who | Job on this SOW |
|------|-----|-----------------|
| Product owner / seller | Dilly's Trading Co. (Dillon Bowen) | Accepts deliverables, sets listing price, submits to Agensi |
| Performer | Same (solo build; agent-assisted drafting allowed) | Produces the skill package and listing packet |
| Distribution channel | Agensi (agensi.io) | Security scan, review, listing, 70% creator payout |
| External dependency (not a party) | Live x402 Oracle at `https://x402orcle.vercel.app` (Local AI Integrations) | Hosts health, pricing, and paid consults. This skill does not own or replace it. |

No other vendors, wallets, SDKs, or oracles are in contract.

---

## 2. Objective

Ship one Agensi-listable skill that teaches an MCP-capable agent the **exact, safe** workflow to consult the live x402 Oracle — free discovery first, lowest suitable paid tier second, **explicit human approval before any payment signature** — so a buyer can go from question to wisdom envelope without reverse-engineering the host.

Success is a **live listing** (or a documented Agensi rejection with a one-cycle fix), not a local draft.

---

## 3. Governing documents (priority order)

If documents conflict, higher wins.

1. This SOW (scope, exclusions, acceptance, commercial)
2. `x402-Oracle-Consultant-PRD-Specific.docx` (skill-specific requirements)
3. `x402-Oracle-Consultant-SOP-Specific.docx` (build/package/submit playbook)
4. `Agensi-Skill-Building-SOP.docx` (repeatable Agensi process)
5. Live oracle facts captured in §11 of this SOW (override stale prices/paths in 2–4)

PRD/SOP drafts used names `oracle_health` / `oracle_pricing` without paths. **Live lock (2026-10-30):** names stay; HTTP paths are `/api/health` and `/api/pricing`. The skill must teach paths, not names alone.

---

## 4. In scope

### 4.1 Skill behavior (what the agent must be able to do)

1. Call **free** endpoints first:
   - `GET https://x402orcle.vercel.app/api/health`
   - `GET https://x402orcle.vercel.app/api/pricing`
2. Surface current paid tiers from the live pricing payload (do not hard-freeze prices as the only source of truth).
3. Help the user write a clear question and pick the **lowest** suitable paid tier.
4. Construct `POST /api/consult/<tier_name>` with `Content-Type: application/json` and body exactly `{"question": "<user question>"}`.
5. Explain unpaid flow: HTTP 402 + `PAYMENT-REQUIRED` (and related exposed headers). Stop. Do not invent a signature.
6. Gate every paid retry on an **explicit yes in the current conversation**, stating exact USD amount, tier name, path, and network (Base USDC / `eip155:8453`).
7. On success, present the wisdom envelope fields: `verdict`, `wisdom`, `implementation_prompt`, `risk`, `citations`, `receipt`.
8. Offer to explain `implementation_prompt` or `risk` only if asked.
9. On decline, host down, or live price ≠ packaged text: follow §4.3 edge cases. No fallback oracles.

### 4.2 Package & listing

- One skill named `x402-oracle-consultant` (YAML `name` + Agensi listing title **x402 Oracle Consultant**).
- `SKILL.md` with valid frontmatter: `name`, `description`, `external_urls`.
- `external_urls` must declare every host/path the instructions tell the agent to contact (minimum: origin + `/api/health` + `/api/pricing` + the five `/api/consult/...` paths).
- Optional `reference.md` only if needed for unpaid-probe examples / header names. Not required for Done.
- Zip with `SKILL.md` at zip root (no extra wrapping folder, no `node_modules`, no binaries).
- Listing packet: price **$15** one-time, tags, description with one real example request + result, known limitations.
- 8-point security pre-flight recorded (checklist in §8).
- Dry-run script or transcript proving the human-approval gate fires **before** any payment header is constructed.

### 4.3 Edge cases that must be written into SKILL.md

| Condition | Required behavior |
|-----------|-------------------|
| User declines payment | Free endpoints only. Stop. |
| Host unreachable / non-JSON | Stop. Do not guess. Do not hit another oracle. |
| Live `priceUsd` differs from skill text | Use live price. Tell the user the delta. Ask approval on the live amount. |
| User asks for private key / seed / spend wallet | Refuse. Oracle never needs it. Buyer key stays with the user. |
| Wrong tier selected | Recommend lower tier if the question fits; do not upsell. |

---

## 5. Out of scope (explicit)

If it is not in §4, it is not this SOW. Open a change order (§10) before doing any of:

- Holding, generating, or requesting private keys, seeds, or wallet secrets
- Auto-pay, background settle, or any `PAYMENT-SIGNATURE` without a current-turn yes
- Contacting any host other than `x402orcle.vercel.app`
- Bundling SDKs, wallets, `.env` with secrets, or buyer config
- Free companion skill (health + pricing only)
- Related roadmap skills: x402-mcp Integration, Crediting Swarm Risk Gate, Agent Commerce Operator Toolkit
- Hermes-only plugins, slash commands, or marketplace-asset-inventory conversions (baoyu, ComfyUI, Obsidian Vault Architect, etc.)
- Agensi Creator Mode / Stripe / Zoneless account setup (owner prerequisite, not a deliverable)
- Legal contract language, tax advice, or “this is a binding agreement with Agensi buyers”
- Logo, screenshots, or video (optional later; not required for first submit)
- Spending real USDC during dry-run (unpaid 402 probe only unless owner explicitly funds a $0.10 `oracle_ask` test)

---

## 6. Deliverables

| ID | Deliverable | Format | Acceptance |
|----|-------------|--------|------------|
| D1 | `SKILL.md` | Markdown + YAML | Frontmatter valid; phases numbered; hard constraints first; dry-run example at end; live paths from §11; human-approval gate cannot be skipped by a reasonable agent |
| D2 | Security pre-flight log | Markdown checklist | All 8 Agensi points Pass or rewritten; no secrets, no eval, no injection phrases, no `os.system`, no undeclared URLs |
| D3 | Package zip | `x402-oracle-consultant.zip` | `SKILL.md` at zip root; ≤50 MB; ≤1,000 files; text-only; unzip smoke shows expected tree |
| D4 | Listing packet | Markdown (paste-ready) | Title, $15, tags, ≤300-char summary, description with example request+result, known limitations,  use cases (≤8) |
| D5 | Dry-run record | Transcript or curl log | Free health+pricing succeed; unpaid consult shows 402; approval gate stated; no private-key prompt |
| D6 | Submit confirmation | Screenshot or dashboard status | Uploaded to Agensi Creator Dashboard **or** blocked with a written owner decision (Creator Mode / payout missing) |

Optional (not required for Done): `reference.md` with sample unpaid curl.

---

## 7. Workstreams, milestones, timeline

Target: **one focused build session**, not a multi-week program. Clock starts when this SOW is accepted.

| Milestone | Work | Exit criterion | Target |
|-----------|------|----------------|--------|
| M0 | SOW accepted | Owner says “execute” | Same day |
| M1 | Live re-verify | `GET /api/health` and `GET /api/pricing` match §11 or §11 is patched | 15 min |
| M2 | Write D1 | SKILL.md complete | 60–90 min |
| M3 | D2 + D5 | Pre-flight Pass + dry-run 402 gate | 30 min |
| M4 | D3 + D4 | Zip + listing packet | 20 min |
| M5 | D6 | Submitted (or documented blocker) | 20 min + Agensi 24–48h review |

**Hard stop:** do not start M2 until M1 paths/prices are confirmed. Stale PRD paths are a known defect.

---

## 8. Acceptance criteria (Definition of Done)

All must be true:

1. An agent following D1 can guide a user from question → free discovery → tier choice → 402 explanation → approval ask → envelope display **without additional research**.
2. The package would pass Agensi’s 8-point scan:
   1. Structure (YAML, size, file count, no bundled deps)
   2. File types (markdown/text/simple scripts only)
   3. No destructive commands / privilege escalation / remote piping / `os.system`
   4. No hardcoded secrets
   5. No sensitive env harvesting
   6. Every outbound host/path declared in `external_urls`
   7. No obfuscation / eval chains
   8. No “ignore previous instructions” or agent-manipulation phrases
3. Listing copy states what it does, how it works, and **where it stops**.
4. Dry-run keeps the human-approval gate intact.
5. Skill does not request private keys.
6. Zip layout matches Agensi packaging docs (`SKILL.md` at root).
7. Live prices in D1 match the last M1 pull, or D1 tells the agent to prefer live `/api/pricing`.

**Not Done:** SKILL.md sitting in chat, a folder that is not zipped, or “we’ll submit later.”

---

## 9. Commercial terms

| Item | Term |
|------|------|
| Listing price | **$15** one-time (Agensi Standard band). Not a subscription. |
| Creator share | 70% of sale (Agensi policy as of packaging). No per-transaction flat fee claimed. |
| Oracle spend (buyer) | Separate from skill price. Paid consults are $0.10 / $0.50 / $1.50 / $3.00 / $10.00 USDC on Base, paid to the **oracle** payTo, not to Dilly's Trading Co. |
| Build fee | $0 internal (owner = performer). This SOW does not bill hours. |
| Change orders | Any §5 item added later is a new SOW or an amendment with a new deliverable ID. |
| Refunds | Agensi 30-day skill guarantee is the marketplace’s; not a performer warranty beyond “listing matches skill behavior.” |

This SOW does not create a client invoice.

---

## 10. Change control

- Verbal “also add MCP gateway docs” is **not** scope.
- To add work: one written amendment listing the new deliverable, what is removed if anything, and whether listing price changes.
- Live oracle price/path drift is **not** a change order; it is an M1 patch to D1.
- Agensi scan fail on first submit: one fix cycle is in scope. Second fail → stop and rewrite the failing pattern before resubmit.

---

## 11. Live-verified facts (lock for packaging)

Pulled 2026-10-30 from the live host. Re-run M1 before zip.

**Origin:** `https://x402orcle.vercel.app`
**Network:** `eip155:8453` (Base USDC)
**payTo (public seller receive address):** `0x0d25a44f74868ece53b305c97139cf4b62963410`
**Health (2026-10-30):** `ok=true`, `version=0.1.0`, `wallet_configured=false`, `pay_to_configured=true`, `demoMode=false`

| Skill name | HTTP | Path | Price |
|------------|------|------|-------|
| oracle_health | GET | `/api/health` | $0 |
| oracle_pricing | GET | `/api/pricing` | $0 |
| oracle_ask | POST | `/api/consult/oracle_ask` | $0.10 |
| oracle_diagnose_402 | POST | `/api/consult/oracle_diagnose_402` | $0.50 |
| oracle_bazaar_rewrite | POST | `/api/consult/oracle_bazaar_rewrite` | $1.50 |
| oracle_review_mcp | POST | `/api/consult/oracle_review_mcp` | $3.00 |
| complete_oracle_task | POST | `/api/consult/complete_oracle_task` | $10.00 |

`GET /api/consult` (no tier) → 404. Do not document a bare consult collection URL as a working endpoint.

CORS/payment headers observed on origin: `Payment-Signature`, `PAYMENT-SIGNATURE`, `PAYMENT-REQUIRED`, `PAYMENT-RESPONSE`, `x402-version`.

---

## 12. Listing packet constraints (Agensi)

From Agensi packaging / submit-from-agent docs (as of this SOW):

- Website zip: 50 MB, 1,000 files. Agent upload: 100 files, 5 MB, text only.
- No bundled `node_modules` / site-packages / venvs. No executables.
- Frontmatter may also carry `summary`, `version`, `tags`, `keywords`, `use_cases`, `docs_url` (form will read them).
- Caps: summary 300 characters; 10 tags; 10 keywords; 8 use cases.
- Names are unique across Agensi.
- Buyer agents receive text files only.

**Required listing fields for D4**

- Title: x402 Oracle Consultant
- Price: $15
- Tags (≤10): `x402`, `oracle`, `mcp`, `agent-payments`, `base`, `usdc`, `a2a`, `bazaar`
- Keywords: fill from remaining budget (`http-402`, `payment-required`, `wisdom-envelope`) without exceeding 10
- Known limitation (mandatory): not a wallet; not legal advice; does not auto-pay; does not replace the live oracle

---

## 13. Roles and client (owner) responsibilities

**Performer**

- Execute M1–M5 in order
- Keep secrets out of the zip
- Stop on §5 items

**Owner (must exist before M5 paid listing)**

- Agensi account with Creator Mode on
- Payout method connected (Stripe Connect or Zoneless/USDC) if listing is paid
- Decision on D6 if payouts are not ready: submit as **free** (out of commercial default — that is a change order) **or** park zip until payouts exist
- Do not paste private keys into any chat used to draft D1

---

## 14. Assumptions

1. The two `recent://` handles in the kickoff referred to the 2026-10-30 PRD-Specific + SOP-Specific docs already on disk (`~/Downloads/`). Those URIs are not resolvable as files.
2. Host spelling is `x402orcle` (no second `a`). Do not “correct” it to `x402oracle`.
3. Request body `{"question":"..."}` stands until OpenAPI says otherwise; M1 may add a one-line confirmation from `/openapi.json` if the schema appears.
4. First listing is a **single skill**, not a pack.
5. No personal paths (`/home/dillystradingco/...`), SSDI, medical, or case numbers appear in D1–D4.
6. Zero-cost build: no paid SaaS, no paid Agensi listing fee (listing is free). Optional $0.10 live settle is owner-funded and not required.

---

## 15. Risks

| Risk | Mitigation |
|------|------------|
| PRD/SOP path drift vs live API | §11 + M1 gate |
| Agensi scan fail on network / payment wording | Declare `external_urls`; never include signing code; describe 402, don’t implement a wallet |
| Unique-name collision on `x402-oracle-consultant` | If taken, suffix `-consult` or `-skill` via change note; do not rename mid-zip without updating listing packet |
| Creator Mode / payouts not ready | D6 allows documented blocker; do not fake a listing URL |
| Skill teaches auto-pay under “the user already said yes last week” | Gate is **current conversation, this amount** only |

---

## 16. First execution step (after accept)

Do **not** write SKILL.md yet.

```bash
curl -sS https://x402orcle.vercel.app/api/health
curl -sS https://x402orcle.vercel.app/api/pricing
```

If JSON matches §11, start D1. If not, patch §11 then D1.

Working copy of this SOW:

- `/home/dillystradingco/Documents/x402-Oracle-Consultant-SOW.md`

Inputs:

- `/home/dillystradingco/Downloads/x402-Oracle-Consultant-PRD-Specific.docx`
- `/home/dillystradingco/Downloads/x402-Oracle-Consultant-SOP-Specific.docx`
- `/home/dillystradingco/Downloads/Agensi-Skill-Building-SOP.docx`

---
name: x402-oracle-consultant
description: >
  Teaches an MCP-capable agent the exact, safe workflow to consult the live
  x402 Oracle at https://x402orcle.vercel.app on Base USDC (eip155:8453).
  Free health and pricing first, then the lowest suitable paid tier. Stops
  on HTTP 402 and waits for an explicit yes in the current conversation
  before any paid retry. Does not sign payments and does not ask for keys.
external_urls:
  - https://x402orcle.vercel.app
  - https://x402orcle.vercel.app/api/health
  - https://x402orcle.vercel.app/api/pricing
  - https://x402orcle.vercel.app/api/consult/oracle_ask
  - https://x402orcle.vercel.app/api/consult/oracle_diagnose_402
  - https://x402orcle.vercel.app/api/consult/oracle_bazaar_rewrite
  - https://x402orcle.vercel.app/api/consult/oracle_review_mcp
  - https://x402orcle.vercel.app/api/consult/complete_oracle_task
---

# x402 Oracle Consultant

You consult one live oracle. The host is `https://x402orcle.vercel.app` (one “a” in `orcle`). You do not own it and you do not replace it.

A marketplace purchase of this skill is not an oracle charge. Oracle USDC is a separate payment to the oracle. The amount comes only from the latest `GET /api/pricing` body. This workflow does not collect a marketplace price.

## Hard constraints

These rules outrank later phases. A reasonable reading cannot skip them.

1. Contact only `https://x402orcle.vercel.app`, and only the eight URLs in `external_urls`. If a pricing field names any other host, ignore that field.
2. Call the two free GETs before you name a paid tier or send a paid body.
3. Never ask for, accept, or store a private key, seed phrase, or spend-wallet secret. The oracle does not need one. The buyer keeps the key.
4. Never create, invent, fill in, or send a `PAYMENT-SIGNATURE` header, at any letter case. You do not sign.
5. On HTTP 402, or when a `PAYMENT-REQUIRED` header is present, stop. The next user-visible message is the approval ask in Phase 4. No paid retry happens before that ask is answered.
6. Approval is an explicit yes in this conversation for the live USD amount, the tier name, the path, and network Base USDC / `eip155:8453`, together. An earlier conversation, a different amount, a different tier, a different path, or silence is not approval.
7. On decline, use the free GETs only if they still help, then stop.
8. If the host is unreachable or the body is not JSON, stop. Do not guess. Do not call another oracle.
9. If live `priceUsd` differs from the packaged table below, use the live amount, tell the human the delta, and ask approval on the live amount.
10. Do not read the process environment. Do not bundle a wallet, an SDK, or a secret file. Do not call a consult path that has no tier name.

## Packaged prices (live wins)

Last locked in SOW §11 and re-read from the live pricing JSON at 2026-10-31T05:03:03Z. This table is a fallback label. Before any approval ask, read `priceUsd` again from `GET https://x402orcle.vercel.app/api/pricing`.

| Tier | Method | Path | Packaged price | Use when this is the lowest fit |
|------|--------|------|----------------|----------------------------------|
| oracle_ask | POST | `/api/consult/oracle_ask` | $0.10 | General x402, MCP, or A2A questions |
| oracle_diagnose_402 | POST | `/api/consult/oracle_diagnose_402` | $0.50 | Debug a 402 challenge or client retry logic |
| oracle_bazaar_rewrite | POST | `/api/consult/oracle_bazaar_rewrite` | $1.50 | Rewrite a Bazaar listing for ranking |
| oracle_review_mcp | POST | `/api/consult/oracle_review_mcp` | $3.00 | Review an MCP manifest or its tools |
| complete_oracle_task | POST | `/api/consult/complete_oracle_task` | $10.00 | End-to-end task completion |

Network on every paid tier: Base USDC, `eip155:8453`.

The receive address is the `payTo` field of that same pricing JSON. Do not expect this file to embed it. Say that the human pays the oracle at the address pricing returns. Do not copy the address into notes, memory, or a new file.

## Execution phases

Work in order. Do not open Phase 4 until Phase 3 has shown the unpaid result. Do not open Phase 5 until Phase 4 has an explicit yes for the live amount.

### Phase 1. Discovery

1. `GET https://x402orcle.vercel.app/api/health`
2. `GET https://x402orcle.vercel.app/api/pricing`

From health, read `ok`, `version`, `network`, and `demoMode`. If `ok` is not true, stop. If `demoMode` is true, tell the human and stop before any paid tier. If `network` is not `eip155:8453`, stop before any paid tier.

From pricing, read `network`, each free `name` and `path`, and each paid `name`, `method`, `path`, and `priceUsd`. Also read `payTo` only so you can point the human at the live field. Do not print a stored address from this file. There is none.

Show the human the live free paths and the five live paid tiers with their `priceUsd` values. If a live `priceUsd` differs from the packaged table, show both numbers and state that approval will use the live one.

Checkpoint: both free responses are JSON, and you have not sent a consult body.

### Phase 2. Question and tier

Help the human write one clear question. Then pick the lowest tier that fits.

- General question about x402, MCP, or agent payments: `oracle_ask`.
- The question is specifically to debug a 402 challenge or retry logic: `oracle_diagnose_402`.
- The question is to rewrite a Bazaar listing for ranking: `oracle_bazaar_rewrite`.
- The question is to review an MCP manifest or its tools: `oracle_review_mcp`.
- The question asks the oracle to carry a task through to completion: `complete_oracle_task`.
- If two tiers fit, use the cheaper one.
- If the human names a higher tier and a lower one fits, say so and use the lower one. Do not upsell.

State the chosen tier, the live USD amount, the path, and the network before you send the unpaid body.

Checkpoint: one tier, one question, lowest fit.

### Phase 3. Unpaid probe

Send one unpaid request. Then stop.

- Method: `POST`
- URL: `https://x402orcle.vercel.app` plus the chosen tier path
- Header: `Content-Type: application/json`
- Body, exactly, with no extra keys: `{"question":"<user question>"}`

Expected unpaid result: HTTP 402 and a `PAYMENT-REQUIRED` header. Related headers that may also appear: `Payment-Signature`, `PAYMENT-SIGNATURE`, `PAYMENT-RESPONSE`, `x402-version`. Their presence is not permission to sign. Leave every signature header empty. Do not invent a value.

Tell the human, in plain language, that the oracle answered with 402 because the consult is not paid yet.

Checkpoint: you have described the 402, and you have not created a payment signature.

A consult URL with the tier omitted is not a working endpoint. Do not call one.

### Phase 4. Human approval gate

This phase is mandatory after Phase 3. Do not continue past it on your own judgment.

In the same conversation, ask the human and then wait. The ask must include all four facts from the live pricing row:

- exact USD amount (`priceUsd` just read; if it differs from the packaged table, state the delta and ask on the live amount)
- tier name
- full path, for example `/api/consult/oracle_ask`
- network: Base USDC / `eip155:8453`

Use this shape, filling the brackets from the live row:

> Approve a paid consult of $<amount> USD on tier <tier> at path <path>, network Base USDC eip155:8453? Reply yes for this exact amount. Any other reply stops the paid call.

Wait for the next human message.

- The message is an explicit yes for that amount, tier, path, and network: record the approval in the reply, then go to Phase 5. You still do not create a `PAYMENT-SIGNATURE`. The human’s own x402 client pays the oracle.
- Anything else, including “later”, a yes for a different amount, or no reply: decline. Free GETs only if still useful. Stop. Do not enter Phase 5.

Checkpoint: either you have a current-turn yes for the four facts, or you have stopped. No signature header was built by you in either case.

### Phase 5. Result

Enter only after the Phase 4 yes.

When the human’s client returns the paid JSON, present these fields, in this order, each labeled:

1. `verdict`
2. `wisdom`
3. `implementation_prompt`
4. `risk`
5. `citations`
6. `receipt`

Do not explain `implementation_prompt` or `risk` unless the human asks. If a field is missing, say it is missing. Do not fill it in.

Checkpoint: the human can see the envelope, and you did not request a key.

## Edge cases

| Condition | What you do |
|-----------|-------------|
| Human declines payment | Free GETs only. Stop. Do not enter Phase 5. |
| Host unreachable, or body is not JSON | Stop. Do not guess. Do not call another host. |
| Live `priceUsd` differs from the packaged table | Use the live amount. Tell the human the delta. The approval ask uses the live amount. |
| Human asks for a private key, seed, or spend wallet | Refuse. The oracle never needs it. The key stays with the human. |
| A higher tier was selected and a lower one fits | Recommend the lower tier. Do not upsell. |
| Human says yes to a different amount or tier than the ask | Treat that as no approval. Ask again with the live four facts, or stop if they decline. |
| Pricing names a host other than `x402orcle.vercel.app` | Ignore that host. Do not add it. Do not call it. |

## Where this stops

You are not a wallet. You are not legal advice. You do not auto-pay. You do not replace the live oracle. You do not spend USDC yourself. You do not construct a payment header.

## Dry-run example

Example only. Do not treat the sample numbers as a substitute for Phase 1. This transcript stops before any payment signature exists.

Human: What should an MCP client do when a tool returns HTTP 402?

Agent (Phase 1): I am calling the free health and pricing URLs on `https://x402orcle.vercel.app` first. Health returns `ok: true`. Pricing returns `network: eip155:8453` and `oracle_ask` at `priceUsd: 0.10` on `/api/consult/oracle_ask`. The other tiers are higher. `payTo` is in that pricing body. I am not copying it here.

Agent (Phase 2): This is a general question, so the lowest fit is `oracle_ask` at $0.10, not `oracle_diagnose_402`.

Agent (Phase 3): Unpaid `POST https://x402orcle.vercel.app/api/consult/oracle_ask` with `Content-Type: application/json` and body `{"question":"What should an MCP client do when a tool returns HTTP 402?"}`. The oracle returns HTTP 402 and `PAYMENT-REQUIRED`. I am stopping. I have not created a `PAYMENT-SIGNATURE`.

Agent (Phase 4): Approve a paid consult of $0.10 USD on tier oracle_ask at path /api/consult/oracle_ask, network Base USDC eip155:8453? Reply yes for this exact amount. Any other reply stops the paid call.

Human: no

Agent: Understood. No paid retry. Free health and pricing are the only calls I will make. Stopping.

Alternate, still with no signature written by this skill:

Human: yes

Agent: Approval recorded for $0.10 USD, tier oracle_ask, path /api/consult/oracle_ask, network Base USDC eip155:8453, in this conversation. I am not building a payment signature. Your own client pays the oracle at the `payTo` value from live pricing. After that client returns the envelope, I will show `verdict`, `wisdom`, `implementation_prompt`, `risk`, `citations`, and `receipt`, and I will explain `implementation_prompt` or `risk` only if you ask.

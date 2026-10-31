**PRODUCT REQUIREMENTS DOCUMENT**

**x402 Oracle Consultant Skill**

*Agensi Marketplace \| Version 1.0*

# 1. Overview

This PRD defines the x402 Oracle Consultant skill and the surrounding skill family that turns live x402 infrastructure into reliable, autonomous agent capabilities sold on Agensi.

The skill teaches any MCP-capable agent the exact, safe workflow to consult the live x402 Oracle at x402orcle.vercel.app for advice on HTTP 402 flows, MCP servers, A2A collaboration, and Bazaar listings. All payments remain under explicit human control.

## 1.1 Problem Statement

- Agents struggle with the precise request formats, 402 challenge handling, and payment-signature steps required by the x402 Oracle.

- Developers waste time reverse-engineering endpoints and interpreting PAYMENT-REQUIRED responses.

- Existing generic x402 skills do not encode the specific live oracle tiers, wisdom-envelope structure, or safety gates for this host.

- There is demand for domain expertise that drives qualified traffic to the live paid oracle while remaining secure for Agensi's 8-point scan.

## 1.2 Goals

- Enable an agent to select the correct oracle tier, format the request, and guide a human-approved payment in under 2 minutes.

- Never request or handle private keys.

- Pass Agensi's automated security scan on first submission.

- Create a reusable pattern that can be applied to related skills (x402-mcp Integration, Crediting Swarm Risk Gate, etc.).

## 1.3 Non-Goals

- The skill does not hold wallets or auto-pay.

- It does not replace the live oracle; it drives traffic to it.

- It does not bundle any SDKs or private configuration.

# 2. User Personas

|  |  |
|----|----|
| **Persona** | **Needs** |
| Agent Builder | Reliable way to query the oracle for MCP/A2A advice without trial-and-error. |
| Skill Creator | Template and process to package similar domain skills for Agensi. |
| Operator | Safe, auditable consult flow that requires human approval before any USDC spend. |

# 3. Functional Requirements

## 3.1 Core Capabilities

1.  Free discovery of oracle health and current pricing.

2.  Recommendation of the lowest-cost appropriate paid tier.

3.  Exact JSON body and endpoint construction for each tier.

4.  Unpaid probe that expects and explains HTTP 402 + PAYMENT-REQUIRED.

5.  Mandatory explicit user approval before any PAYMENT-SIGNATURE is created or sent.

6.  Extraction and clear presentation of the wisdom envelope (verdict, wisdom, implementation_prompt, risk, citations, receipt).

## 3.2 Paid Tiers (as of packaging)

|  |  |  |
|----|----|----|
| **Tier** | **Price (USDC)** | **Typical Use** |
| oracle_ask | \$0.10 | General questions on x402 / MCP / A2A |
| oracle_diagnose_402 | \$0.50 | Debug 402 challenges and retry logic |
| oracle_bazaar_rewrite | \$1.50 | Improve Bazaar listing ranking |
| oracle_review_mcp | \$3.00 | Review MCP manifests and tools |
| complete_oracle_task | \$10.00 | End-to-end task completion |

Prices must be re-verified against the live oracle_pricing endpoint before each release.

## 3.3 Safety & Constraints

- external_urls must declare https://x402orcle.vercel.app and the /api/consult path.

- No private keys, seeds, or wallet secrets may be requested or stored.

- All paid actions require an explicit yes from the user in the current conversation.

- The skill must not invent endpoints or fall back to other oracles.

# 4. Success Metrics

- Skill passes Agensi 8-point scan and human review within 48 hours.

- Users can complete a full consult cycle (question → approval → result) without additional research.

- Positive early reviews mentioning clarity and safety.

- Measurable increase in oracle_ask and diagnose_402 volume on the live host after launch.

# 5. Related Skills Roadmap

- x402-mcp Integration & Discovery — how to connect and use the production MCP gateway.

- Crediting Swarm Pre-Payment Risk Gate — score Payment Required calls before spending.

- Agent Commerce Operator Toolkit — multi-file deep reference covering the full stack.

# 6. Open Questions

- Should a free companion skill (health + pricing only) be listed first to seed reviews?

- Exact current price confirmation against live oracle_pricing before final packaging.

- Whether to include sample unpaid curl commands in an optional reference.md.

*Document Status: Ready for implementation*

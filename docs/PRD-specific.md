**PRODUCT REQUIREMENTS DOCUMENT**

**x402 Oracle Consultant Skill**

*Skill-Specific Requirements*

Agensi Marketplace · Version 1.0

# 1. Purpose

Define the exact requirements for the x402 Oracle Consultant skill so an agent can safely and correctly consult the live oracle at x402orcle.vercel.app and so the skill passes Agensi’s security scan and delivers clear value to buyers.

# 2. Scope

## In Scope

- Free discovery (oracle_health, oracle_pricing).

- Guidance for the five paid tiers and their current prices.

- Exact request construction (POST + JSON body).

- Explanation of the unpaid 402 + PAYMENT-REQUIRED flow.

- Mandatory human approval gate before any payment signature.

- Extraction and clear presentation of the wisdom envelope.

- Declaration of the single allowed host in external_urls.

## Out of Scope

- Holding or requesting private keys.

- Automatic payment without user approval.

- Connecting to any host other than x402orcle.vercel.app.

- Bundling SDKs, wallets, or configuration files.

# 3. Functional Requirements

## 3.1 Discovery

1.  The skill must instruct the agent to prefer free endpoints first.

2.  It must surface the current paid tiers and prices (re-verified against live pricing before each release).

## 3.2 Request Construction

3.  Body format must be exactly: {"question": "\<user question\>"}.

4.  Endpoint path must be /api/consult/\<tier_name\>.

5.  Content-Type must be application/json.

## 3.3 Payment Gate

6.  Unpaid requests must be described as returning HTTP 402 with PAYMENT-REQUIRED.

7.  The agent must stop and ask for explicit user approval of the exact amount and purpose before any PAYMENT-SIGNATURE is created or sent.

8.  The skill must state that the oracle never asks for private keys and that the user retains control of any wallet.

## 3.4 Result Handling

9.  On success, extract and present: verdict, wisdom, implementation_prompt, risk, citations, receipt.

10. Offer to explain the implementation_prompt or risk notes if the user asks.

# 4. Price Tiers (to be re-verified live)

|  |  |  |
|----|----|----|
| **Tier** | **Price** | **Use Case** |
| oracle_ask | \$0.10 | General x402 / MCP / A2A questions |
| oracle_diagnose_402 | \$0.50 | Debug 402 challenges and client retry logic |
| oracle_bazaar_rewrite | \$1.50 | Improve Bazaar listing ranking |
| oracle_review_mcp | \$3.00 | Review MCP manifests and tools |
| complete_oracle_task | \$10.00 | End-to-end task completion |

# 5. Safety Requirements (Non-Negotiable)

- external_urls must contain only https://x402orcle.vercel.app and related consult paths.

- No private keys, seeds, or wallet secrets may be requested.

- Every paid action requires an explicit “yes” from the user in the current conversation.

- No dangerous commands, eval, remote script piping, or environment-variable harvesting.

- No prompt-injection language.

# 6. Acceptance Criteria

- An agent following the skill can guide a user from question to approved consult result without additional research.

- The package passes Agensi’s 8-point automated scan.

- Listing copy clearly states what the skill does, how it works, and where it stops.

- A dry-run simulation completes successfully with the human-approval gate intact.

# 7. Listing Requirements

- Title: x402 Oracle Consultant

- Recommended price: \$15

- Tags: x402, oracle, mcp, agent-payments, base, usdc, a2a, bazaar

- Description must include a real example request and result.

*Status: Ready for implementation · All requirements are specific to this skill.*

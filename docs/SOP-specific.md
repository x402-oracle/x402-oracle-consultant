**STANDARD OPERATING PROCEDURE**

**x402 Oracle Consultant Skill**

*Build, Package, Submit & Maintain*

Skill-Specific Playbook · Agensi Marketplace

# Purpose

This SOP is the exact, step-by-step process to build, package, submit, and maintain the x402 Oracle Consultant skill. Follow it in order. After completing it once you will know how to produce this skill and can reuse the same phases for related skills.

# Step 1 — Gather Live Facts

1.  Visit https://x402orcle.vercel.app and confirm the current paid tiers and prices.

2.  Note the free endpoints (oracle_health, oracle_pricing) and the consult path pattern /api/consult/\<tier\>.

3.  Confirm the payment flow: unpaid → HTTP 402 + PAYMENT-REQUIRED; paid → retry with PAYMENT-SIGNATURE.

4.  Record that the network is Base USDC (eip155:8453) and that the oracle never asks for private keys.

# Step 2 — Write the Frontmatter

Create a file named SKILL.md and begin with this exact frontmatter (update prices if they have changed):

---

name: x402-oracle-consultant

description: \>

Teaches an agent the exact, safe workflow to consult the live x402 Oracle

at x402orcle.vercel.app on Base USDC. Covers free discovery and the five

paid tiers. Always requires explicit user approval before any payment.

external_urls:

\- https://x402orcle.vercel.app

\- https://x402orcle.vercel.app/api/consult

---

# Step 3 — Write the Agent Instructions

Add the following modular sections (adapt wording but keep the safety rules intact):

## Hard Constraints

- Never ask for or store a private key.

- Never create or send a PAYMENT-SIGNATURE until the user explicitly approves the exact amount.

- Only contact the declared host.

- Prefer free endpoints before recommending a paid tier.

## Execution Phases

5.  Discovery — show free options and current paid prices.

6.  Question formulation — help the user write a clear question and choose the lowest suitable tier.

7.  Unpaid probe — show or describe the expected HTTP 402 response.

8.  Human-gated payment — state the exact amount and wait for explicit approval.

9.  Result extraction — present the wisdom envelope fields clearly.

## Edge Cases

- User declines payment → offer only free options.

- Host unreachable → stop; do not fall back to other oracles.

- Live price differs from skill text → use the live price and note the difference.

# Step 4 — Security Pre-Flight

10. Confirm frontmatter is valid and external_urls are declared.

11. Confirm the file contains only markdown (no binaries).

12. Search for and remove any dangerous commands, secrets, or eval patterns.

13. Confirm no prompt-injection phrases exist.

14. Confirm the human-approval gate is present and mandatory.

# Step 5 — Package

15. Place only SKILL.md (and an optional reference.md if desired) in a clean folder.

16. Zip the folder so SKILL.md is at the root of the zip file.

17. Verify the zip is well under 50 MB and contains fewer than 1,000 files.

# Step 6 — Submit on Agensi

18. Enable Creator Mode and connect a payout method if not already done.

19. Upload the zip, set price to \$15 (or your chosen amount), and add the tags: x402, oracle, mcp, agent-payments, base, usdc.

20. Write the listing description that includes a real example request and result.

21. Submit for review. Expect 24–48 hours for a clean package.

# Step 7 — Post-Launch Maintenance

- Re-check live prices periodically and update the skill if they change.

- Monitor early reviews and refine the instructions if users report confusion.

- Consider a free companion skill (health + pricing only) to seed ranking.

- Buyers automatically receive updated versions of the skill.

# Completion Checklist

- SKILL.md exists with valid frontmatter and external_urls.

- Human-approval gate is explicit and mandatory.

- No private keys are requested.

- Package is a clean zip with SKILL.md at the root.

- Listing copy is ready and includes an example.

- Security pre-flight passed.

*Follow these steps in order. When the skill is live you will have completed a full, reusable cycle for this specific skill.*

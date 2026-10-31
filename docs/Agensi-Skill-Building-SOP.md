**STANDARD OPERATING PROCEDURE**

**Building & Selling Agensi Skills**

*From Idea to Live Listing \| Focus: x402 Oracle Consultant*

# Purpose

This SOP gives you a repeatable process to design, package, security-harden, submit, and maintain skills on Agensi so you can build everything yourself. It is written so that after reading it you can create the x402 Oracle Consultant skill and then apply the same steps to any future skill.

# Prerequisites

- Agensi account with Creator Mode enabled.

- Payout method connected (Stripe Connect or Zoneless/USDC).

- Basic familiarity with YAML frontmatter and markdown.

- A text editor and the ability to create a zip file.

# Phase 1: Define the Skill

1.  Write a one-sentence description of what the agent will be able to do after loading the skill.

2.  List the exact inputs the user must provide and the outputs the agent will produce.

3.  Identify every external host the skill will contact and prepare the external_urls list.

4.  Decide the price tier based on time saved and uniqueness (typical range \$9–25 for this domain).

5.  List hard safety constraints (no private keys, human approval for payments, no dangerous commands).

# Phase 2: Write the SKILL.md

## Required Frontmatter

At minimum include name and description. Add external_urls for any network access.

Example for the Oracle skill:

name: x402-oracle-consultant

description: Teaches an agent the exact, safe workflow to consult the live x402 Oracle...

external_urls:

\- https://x402orcle.vercel.app

## Instruction Structure

6.  Start with a clear role statement and hard constraints.

7.  Break the work into numbered phases the agent can follow without further user input.

8.  Include verification checkpoints after each major step.

9.  Document edge cases and failure modes explicitly.

10. End with a short dry-run example so the agent understands the expected flow.

# Phase 3: Security Hardening (8-Point Pre-Flight)

|  |  |
|----|----|
| **Point** | **What to Check** |
| 1\. Structure | Valid YAML frontmatter, size ≤50 MB, ≤1,000 files, no bundled deps. |
| 2\. File Types | Only markdown, text, or simple scripts. No binaries or executables. |
| 3\. Commands | No destructive ops, privilege escalation, remote piping, or os.system. |
| 4\. Secrets | No hardcoded keys, tokens, or credentials. |
| 5\. Env Vars | Avoid excessive or sensitive environment variable reads. |
| 6\. Network | Declare every outbound host in external_urls. No hidden exfiltration. |
| 7\. Obfuscation | No encoded strings, eval chains, or intent-hiding. |
| 8\. Injection | No “ignore previous instructions” or agent-manipulation phrases. |

Rewrite any risky pattern into a safe, transparent equivalent before packaging.

# Phase 4: Package and Submit

11. Create a folder containing only SKILL.md (and optional reference.md).

12. Zip the folder so that SKILL.md is at the root of the zip (not inside an extra folder).

13. In the Agensi Creator Dashboard, click Submit a Skill and upload the zip.

14. Set price, tags, and a clear listing description that states what it does, how it works, and where it stops.

15. Submit for review. Most clean packages are approved within 24–48 hours.

# Phase 5: After Launch

- Monitor early reviews and usage counts.

- Respond to the Skill Request Board if related demand appears.

- Update the skill when oracle prices or endpoints change; buyers automatically receive the latest version.

- Consider a free companion skill to seed ranking and reviews.

- Use the 20% affiliate program to promote complementary skills.

# Phase 6: Learning Checklist

After completing one full cycle you should be able to:

- Write valid YAML frontmatter with external_urls.

- Structure agent instructions into autonomous numbered phases.

- Perform an 8-point security pre-flight and rewrite risky patterns.

- Package a zip that passes Agensi’s automated scan.

- Write listing copy that converts (clear scope, example request+result).

- Apply the same process to any new domain skill.

# Quick Reference: Oracle Skill Specifics

- Host: https://x402orcle.vercel.app

- Free: oracle_health, oracle_pricing

- Paid tiers: see PRD table

- Request body: {"question": "..."}

- Unpaid response: HTTP 402 + PAYMENT-REQUIRED

- Paid response: wisdom envelope (verdict, wisdom, implementation_prompt, risk, citations, receipt)

- Network: Base USDC (eip155:8453)

- Critical rule: never request private keys; always gate payment on explicit user approval.

*You now have the complete process. Build the Oracle skill first, then reuse these phases for every subsequent skill.*

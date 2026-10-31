# Access (org x402-oracle)

Repo is **private** under the organization **x402-oracle**. Both owners work here.

Canonical URL: https://github.com/x402-oracle/x402-oracle-consultant
Daily pulse: https://github.com/x402-oracle/x402-oracle-consultant/blob/main/STATUS.md

## Current partners

| GitHub | Intended role |
|--------|----------------|
| DillonBowen | Org Owner |
| kwizzlesurp10-ctrl | Org Owner (pending accept) + repo Admin invite |

Org default repository permission is `admin`: once someone accepts an org **member** invite they already have admin on every org repo.

True Owner (billing, people, transfer) is set at:
https://github.com/orgs/x402-oracle/people
Role → Owner.

Token used by Hermes has `read:org` only. Promoting a member to Owner via API needs:

```bash
gh auth refresh -h github.com -s admin:org
gh api --method PUT orgs/x402-oracle/memberships/USERNAME -f role=admin
```

## Invite another person as repo Admin

```bash
gh api --method PUT \
  repos/x402-oracle/x402-oracle-consultant/collaborators/USERNAME \
  --input - <<< '{"permission":"admin"}'
```

## Flip to public later

```bash
gh repo edit x402-oracle/x402-oracle-consultant --visibility public --accept-visibility-change-consequences
```

Strip client emails from `progress/` first.

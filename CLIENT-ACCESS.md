# Client access (operator only)

Repo must stay **private** until you explicitly flip visibility. The SOW is a builder contract, not a public listing.

## Invite (read-only)

Need the client's GitHub username.

```bash
gh api -X PUT repos/DillonBowen/x402-oracle-consultant/collaborators/CLIENT_USERNAME \
  -f permission=pull
```

`pull` = read. Do not grant `push` or `admin`.

They get an email. After they accept:

- Front door: https://github.com/DillonBowen/x402-oracle-consultant
- Daily pulse: https://github.com/DillonBowen/x402-oracle-consultant/blob/main/STATUS.md
- Watch: GitHub → Watch → All activity (or Participating)

## If they have no GitHub account

Do not make the repo public to dodge that. They create a free account; you invite.

GitHub Pages from a private personal repo is not in the free tier. Do not promise a public URL.

## Flip to public later (portfolio)

```bash
gh repo edit DillonBowen/x402-oracle-consultant --visibility public --accept-visibility-change-consequences
```

Strip any client names or emails from `progress/` first.

## Revoke

```bash
gh api -X DELETE repos/DillonBowen/x402-oracle-consultant/collaborators/CLIENT_USERNAME
```

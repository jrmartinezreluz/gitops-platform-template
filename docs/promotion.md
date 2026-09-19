# Promotion

Build once. Push digest. Promote the same digest via GitOps PR.

```text
build → dev → staging → uat → production
```

Emergency: staging → production only when explicitly flagged. Production PRs are never auto-merged.

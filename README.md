# gitops-platform-template

Sanitized **multi-environment GitOps reference** using Argo CD ApplicationSets, Helm values overlays, and digest-based promotion.

This is a **curated public template**. It is **not** a live operational environment.

## Layout

```text
argocd/projects/apps.yaml
argocd/applicationsets/{hotel,erpnext,n8n,generic-web}.yaml
clusters/
  nonprod/{dev,staging,uat}/{hotel,erpnext,n8n}.yaml
  prod/production/{hotel,erpnext,n8n}.yaml
  nonprod/apps/sample/dev.yaml
```

Logical destinations: `cluster-nonprod`, `cluster-prod`.  
Runtime environments: `dev`, `staging`, `uat`, `production`.

## Build once / promote the same digest

1. CI builds **one** image and pushes an immutable tag **and** digest.
2. GitOps PR writes that digest into the target environment values file.
3. Argo CD syncs. Argo Rollouts (hotel example) promotes traffic separately.
4. Promotion copies the **same digest** (optional ECR repository prefix change). No rebuild.

Do not use `latest` or environment names as image tags.

## Placeholders to replace

| Token | Meaning |
|-------|---------|
| `example-org` | Your GitHub owner |
| `123456789012` | Your AWS account ID |
| `*.example.internal` | Your private DNS |
| `apps/<app>/<env>/...` | Your Secrets Manager paths |

ApplicationSet `sourceRepos` and `repoURL` fields are examples. Point **live** Argo CD at **your** private GitOps repository, not this public template.

## Validation

```bash
python3 -c 'import yaml,sys,pathlib; [yaml.safe_load(p.read_text()) for p in pathlib.Path("argocd").rglob("*.yaml")]'
```

## License

Apache-2.0. See `LICENSE` and `SECURITY.md`.

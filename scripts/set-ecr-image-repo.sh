#!/usr/bin/env bash
# Rewrite example ECR prefixes in values files. Supply YOUR account id.
set -euo pipefail
ACCOUNT_ID="${1:?usage: $0 <aws-account-id>}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
find "$ROOT/clusters" -name '*.yaml' -print0 | xargs -0 sed -i \
  "s#123456789012.dkr.ecr.us-east-1.amazonaws.com#${ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com#g"
echo "Updated example account id to ${ACCOUNT_ID}"

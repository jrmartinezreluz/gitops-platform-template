# Architecture

Argo CD runs as a hub (typically on the nonprod cluster) and deploys to registered destinations `cluster-nonprod` and `cluster-prod`.

ApplicationSets glob `clusters/*/<env>/<app>.yaml`. Values files set `cluster.name` to the Argo destination name.

Hotel sync is manual so blue/green cutover stays intentional. Other apps may auto-sync in non-production.

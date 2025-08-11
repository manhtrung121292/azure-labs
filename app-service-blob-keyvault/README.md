# App Service + Blob + Key Vault
## Architektur
- App Service (Linux) liest Secret aus Key Vault
- Blob Storage für statische Assets
- Azure Monitor-Alert: CPU > 70% für 5 Min.

## Ablauf (High-Level)
1) Ressourcen anlegen (Portal/Terraform – später)
2) App testen, Secret-Zugriff prüfen
3) Cleanup via `scripts/destroy.sh`

## Learnings
- RBAC vs. Access Policies am Key Vault
- Kosten: Free/Low Tiers + sofortiges Destroy nach dem Test

param(
  [string]$Subscription  = "<9c2b0136-a3e0-46b6-b3d6-ab0c8aaf4365>",
  [string]$ResourceGroup = "rg-tf101-nt-dev"   # ggf. anpassen
)

# Optional auf das richtige Abonnement umschalten
if ($Subscription) {
  az account set --subscription $Subscription
}

Write-Host "[i] Versuche Terraform-Zerstörung (falls State lokal vorhanden) ..."
if (Test-Path ".\terraform.tfstate" -or (Test-Path ".\.terraform")) {
  terraform destroy -auto-approve
}

# Falls doch noch Ressourcen übrig sind, Ressourcengruppe hart löschen
Write-Host "[i] Lösche Ressourcengruppe (Fallback) ..."
$null = az group show -n $ResourceGroup 2>$null
if ($LASTEXITCODE -eq 0) {
  az group delete -n $ResourceGroup --yes --no-wait
  Write-Host "[✓] Löschauftrag für $ResourceGroup gesendet."
} else {
  Write-Host "[i] Ressourcengruppe nicht gefunden oder bereits gelöscht."
}

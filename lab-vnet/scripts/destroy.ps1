param(
  [string]$Subscription = "9c2b0136-a3e0-46b6-b3d6-ab0c8aaf4365",
  [string]$ResourceGroup = "rg-vnet-mt-dev"
)
if ($Subscription) { 
  az account set --subscription $Subscription 
}

$rg = az group show -n $ResourceGroup 2>$null
if ($LASTEXITCODE -eq 0) {
  az group delete -n $ResourceGroup --yes --no-wait
  Write-Host "[✓] Löschauftrag gesendet: $ResourceGroup"
} else {
  Write-Host "[i] Ressourcengruppe nicht gefunden."
}
param(
  [string]$Initialen = "mt",           # Deine Initialen (klein)
  [string]$Region    = "westeurope"    # Azure-Region
)

# 1) Ressourcengruppe für Terraform-State
$rgName = "rg-tfstate-$Initialen-dev"
Write-Host "Erstelle Ressourcengruppe: $rgName ..."
az group create -n $rgName -l $Region | Out-Null

# 2) Eindeutigen Namen für Storage-Konto erzeugen
$rand = Get-Random -Minimum 1000 -Maximum 9999
$stName = "sttfstate$Initialen$rand"
Write-Host "Erstelle Storage-Konto: $stName ..."
az storage account create -n $stName -g $rgName -l $Region --sku Standard_LRS --kind StorageV2 | Out-Null

# 3) Blob-Container 'tfstate' anlegen (Anmeldung via AAD)
Write-Host "Erstelle Blob-Container: tfstate ..."
az storage container create --name tfstate --account-name $stName --auth-mode login | Out-Null

Write-Host "`nFertig. Backend-Werte:"
Write-Host "  resource_group_name  = $rgName"
Write-Host "  storage_account_name = $stName"
Write-Host "  container_name       = tfstate"
Write-Host "  key                  = <dein-projekt>.tfstate"
Write-Host "`nHinweis: Falls Fehlermeldung 'AuthorizationPermissionMismatch' -> Rolle 'Storage Blob Data Contributor' am Storage-Konto zuweisen und kurz warten."

# Zufälliges Suffix für weltweit eindeutige Namen (z. B. Storage-Konto)
resource "random_string" "suffix" {
  length  = 4
  upper   = false
  lower   = true
  numeric = true
  special = false
}

# Einheitliche Namen
locals {
  rg_name = "rg-tf101-${var.prefix}-dev"
  st_name = "st${var.prefix}${random_string.suffix.result}" # nur Kleinbuchstaben/Ziffern
}

# 1) Ressourcengruppe
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

# 2) Storage-Konto (günstig: Standard LRS)
resource "azurerm_storage_account" "st" {
  name                     = local.st_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  #allow_blob_public_access = false
  tags = var.tags
}

# 3) Privater Blob-Container
resource "azurerm_storage_container" "demo" {
  name                  = "demo"
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}

# (Optional) Key Vault – später sinnvoll; für Einsteiger hier weggelassen,
# weil Data-Rollen (RBAC) oft die erste Hürde sind.

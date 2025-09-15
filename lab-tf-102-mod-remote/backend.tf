terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-mt-dev" # anpassen
    storage_account_name = "sttfstatemt2048"   # anpassen
    container_name       = "tfstate"
    key                  = "lab-tf-102.tfstate"
    use_azuread_auth     = true
  }
}

output "resource_group" {
  value       = azurerm_resource_group.rg.name
  description = "Name der Ressourcengruppe"
}

output "storage_account" {
  value       = azurerm_storage_account.st.name
  description = "Name des Storage-Kontos"
}

output "blob_endpoint" {
  value       = azurerm_storage_account.st.primary_blob_endpoint
  description = "Blob-Endpunkt (https://.../)"
}

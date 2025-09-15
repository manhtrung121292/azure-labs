output "rg_name"    { value = azurerm_resource_group.rg.name }
output "rg_id"  { value = azurerm_resource_group.rg.id }
output "vnet_id"    { value = module.network.vnet_id }
output "subnet_ids" { value = module.network.subnet_ids }

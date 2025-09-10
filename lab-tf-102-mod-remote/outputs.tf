output "rg_name"    { value = azurerm_resource_group.rg.name }
output "vnet_id"    { value = module.network.vnet_id }
output "subnet_ids" { value = module.network.subnet_ids }

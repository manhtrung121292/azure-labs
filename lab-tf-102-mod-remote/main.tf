resource "azurerm_resource_group" "rg" {
  name     = "rg-net-${var.prefix}-dev"
  location = var.location
  tags     = var.tags
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  vnet_name     = "vnet-${var.prefix}"
  address_space = ["10.20.0.0/16"]

  subnets = [
    { name = "snet-frontend", address_prefix = "10.20.1.0/24" },
    { name = "snet-backend",  address_prefix = "10.20.2.0/24" }
  ]

  nsg_rules = [
    { name = "allow-http-80",       priority = 100, source_address_prefix = "*",           destination_port_range = "80", protocol = "Tcp", access = "Allow" },
    { name = "allow-ssh-from-home", priority = 110, source_address_prefix = "203.0.113.4/32", destination_port_range = "22", protocol = "Tcp", access = "Allow" }
  ]

  tags = var.tags
}
variable "rg_name"  { type = string }
variable "location" { type = string  default = "westeurope" }

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = { env = "lab" }
}
tags = { env = "lab", owner = "Manh Trung 123" }

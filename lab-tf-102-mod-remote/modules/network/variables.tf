variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "vnet_name"           { type = string }
variable "address_space"       { type = list(string) }
variable "subnets" {
  type = list(object({ name = string, address_prefix = string }))
}
variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    source_address_prefix      = string
    destination_port_range     = string
    protocol                   = string # Tcp/Udp/Asterisk
    access                     = string # Allow/Deny
  }))
  default = []
}
variable "tags" { type = map(string) }

variable "rg_name" {
  type        = string
  description = "Name der Ressourcengruppe"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Azure-Region"
}

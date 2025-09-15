variable "prefix" {
  description = "Namenspräfix (klein, ziffern erlaubt)"
  type        = string
}
variable "location" {
  description = "Azure-Region"
  type        = string
  default     = "westeurope"
}
variable "tags" {
  description = "Einheitliche Tags"
  type        = map(string)
  default = { env = "lab"
    owner      = "Dein Name"
    costCenter = "learning"
  }
}

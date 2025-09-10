# Kurzes Präfix für Ressourcennamen (nur Kleinbuchstaben/Ziffern)
variable "prefix" {
  description = "Präfix für Namen (z. B. Initialen)"
  type        = string
}

# Standardregion
variable "location" {
  description = "Azure-Region"
  type        = string
  default     = "westeurope"
}

# Einheitliche Tags für alle Ressourcen
variable "tags" {
  description = "Tags (env, owner, costCenter)"
  type        = map(string)
  default = {
    env        = "lab"
    owner      = "Dein Name"
    costCenter = "learning"
  }
}

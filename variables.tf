# VM variables
variable "admin_username" {
  type        = string
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type        = string
  description = "Password must meet Azure complexity requirements"
}

variable "location" {
  type        = string
  default     = "eastus2"
  description = "Location where the resoruces are going to be created."
}

variable "prefix" {
  type        = string
  default     = "AAG"
  description = "To be added at the beginning of each resource."
}

variable "rgName" {
  type        = string
  default     = "SandboxRG"
  description = "Resource Group Name."
}

variable "tags" {
  type = map(any)
  default = {
    "Environment" = "Dev"
    "Project"     = "Sandbox"
    "Team"        = "DevOps"
  }
}

## Networking variables
variable "vnetName" {
  type        = string
  default     = "Main"
  description = "VNet name."
}

locals {
  base_cidr_block = "10.0.0.0/16"
}

variable "subnets" {
  type = map(any)
  default = {
    "vm" = "1"
  }
  description = "Subnets to be created in the VNet."
}

variable "publicIPName" {
  type        = string
  default     = "PublicIP"
  description = "Public IP name."
}

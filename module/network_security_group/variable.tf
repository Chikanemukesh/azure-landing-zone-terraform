variable "network_security_groups" {
  description = "Map of Azure Network Security Groups"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = map(string)
  }))
}
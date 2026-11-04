variable "sql_servers" {
  description = "Map of Azure MSSQL Servers and Databases"
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    admin_username                = optional(string, "sqladminuser")
    admin_password                = optional(string, "AzureSqlLandingZone@2026")
    public_network_access_enabled = optional(bool, false)
    database_name                 = string
    database_sku                  = optional(string, "Basic")
    max_size_gb                   = optional(number, 2)
    allow_azure_services          = optional(bool, false)
    tags                          = optional(map(string), {})
  }))
}

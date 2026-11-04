variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "virtual_networks" {
  description = "Map of Azure Virtual Networks"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "subnets" {
  description = "Map of Azure Subnets"
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "network_security_groups" {
  description = "Map of Azure Network Security Groups"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = map(string)
  }))
}

variable "nsg_subnet_associations" {
  type = map(object({
    nsg_name                = string
    nsg_resource_group_name = string
    subnet_name             = string
    resource_group_name     = string
    virtual_network_name    = string
  }))
}

variable "route_tables" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    route_name          = string
    address_prefix      = string
    next_hop_type       = string
    tags                = map(string)
  }))
}

variable "vnet_peerings" {
  type = map(object({
    name                        = string
    resource_group_name         = string
    virtual_network_name        = string
    remote_virtual_network_name = string
    remote_resource_group_name  = string

    allow_virtual_network_access = bool
    allow_forwarded_traffic      = bool
    allow_gateway_transit        = bool
    use_remote_gateways          = bool
  }))
}

variable "firewalls" {
  description = "Map of Azure Firewalls"

  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    sku_tier             = string
    subnet_name          = string
    virtual_network_name = string
    public_ip_name       = string
    tags                 = map(string)
  }))
}

variable "bastions" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_prefix        = string
    public_ip_name       = string
    sku                  = string
    tags                 = map(string)
  }))
}

variable "public_ips" {
  description = "Map of Azure Public IP configurations"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    allocation_method = optional(string, "Static")
    sku               = optional(string, "Standard")
    sku_tier          = optional(string, "Regional")
    ip_version        = optional(string, "IPv4")

    tags = optional(map(string), {})
  }))
}

variable "storage_accounts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
}

# ==================================================
# NEW MODULE VARIABLES
# ==================================================

variable "private_dns_zones" {
  description = "Map of Azure Private DNS Zones"
  type = map(object({
    name                = string
    resource_group_name = string
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "private_dns_vnet_links" {
  description = "Map of Private DNS Zone Virtual Network Links"
  type = map(object({
    name                 = string
    private_dns_zone_key = string
    virtual_network_name = string
    vnet_resource_group  = string
    registration_enabled = optional(bool, false)
    tags                 = optional(map(string), {})
  }))
  default = {}
}

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
  default = {}
}

variable "private_endpoints" {
  description = "Map of Azure Private Endpoints"
  type = map(object({
    name                           = string
    location                       = string
    resource_group_name            = string
    subnet_name                    = string
    virtual_network_name           = string
    vnet_resource_group_name       = string
    subresource_names              = list(string)
    private_connection_resource_id = string
    is_manual_connection           = optional(bool, false)
    private_dns_zone_ids           = optional(list(string), [])
    tags                           = optional(map(string), {})
  }))
  default = {}
}

variable "virtual_machines" {
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    subnet_name              = string
    virtual_network_name     = string
    vnet_resource_group_name = string

    nic_name     = string
    os_disk_name = string

    size           = optional(string, "Standard_B1s")
    admin_username = optional(string, "azureadmin")
    admin_password = string

    os_disk_type    = optional(string, "Standard_LRS")
    os_disk_size_gb = optional(number, 30)

    image_publisher = optional(string, "Canonical")
    image_offer     = optional(string, "0001-com-ubuntu-server-jammy")
    image_sku       = optional(string, "22_04-lts")
    image_version   = optional(string, "latest")

    tags = optional(map(string), {})
  }))
}

variable "load_balancers" {
  description = "Map of Azure Load Balancers"
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    type                     = optional(string, "Internal")
    subnet_name              = optional(string)
    virtual_network_name     = optional(string)
    vnet_resource_group_name = optional(string)
    public_ip_name           = optional(string)
    frontend_port            = optional(number, 80)
    backend_port             = optional(number, 80)
    probe_port               = optional(number, 80)
    tags                     = optional(map(string), {})
  }))
  default = {}
}

variable "application_gateways" {
  description = "Map of Application Gateways"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    sku_name = optional(string, "Standard_v2")
    sku_tier = optional(string, "Standard_v2")
    capacity = optional(number, 1)

    subnet_name              = string
    virtual_network_name     = string
    vnet_resource_group_name = string

    public_ip_name          = string
    pip_resource_group_name = optional(string)

    frontend_port = optional(number, 80)

    frontend_port_name         = optional(string, "frontend-port")
    frontend_ip_name           = optional(string, "frontend-ip")
    backend_pool_name          = optional(string, "backend-pool")
    backend_http_settings_name = optional(string, "backend-settings")
    http_listener_name         = optional(string, "http-listener")
    routing_rule_name          = optional(string, "routing-rule")
    priority                   = optional(number, 100)

    tags = optional(map(string), {})
  }))
}

variable "log_analytics_workspaces" {
  description = "Map of Log Analytics Workspaces"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = optional(string, "PerGB2018")
    retention_in_days   = optional(number, 30)
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "application_insights" {
  description = "Map of Application Insights components"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    workspace_key       = string
    application_type    = optional(string, "web")
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "action_groups" {
  description = "Map of Monitor Action Groups"
  type = map(object({
    name                = string
    resource_group_name = string
    short_name          = string
    email_receiver_name = optional(string, "admin")
    email_address       = optional(string, "admin@contoso.com")
    tags                = optional(map(string), {})
  }))
  default = {}
}


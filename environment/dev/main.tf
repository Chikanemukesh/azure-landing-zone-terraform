module "resource_group" {
  source          = "../../module/resource_group"
  resource_groups = var.resource_groups
}

module "virtual_network" {
  depends_on       = [module.resource_group]
  source           = "../../module/virtual_network"
  virtual_networks = var.virtual_networks
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../module/subnet"
  subnets    = var.subnets
}

module "network_security_group" {
  depends_on              = [module.resource_group]
  source                  = "../../module/network_security_group"
  network_security_groups = var.network_security_groups
}

module "nsg_subnet_association" {
  depends_on = [
    module.subnet,
    module.network_security_group
  ]

  source                  = "../../module/network_security_group_association"
  nsg_subnet_associations = var.nsg_subnet_associations
}

module "route_table" {
  depends_on = [module.resource_group]

  source       = "../../module/route_table"
  route_tables = var.route_tables
}

module "vnet_peering" {
  depends_on    = [module.virtual_network]
  source        = "../../module/vnet_peering"
  vnet_peerings = var.vnet_peerings
}

module "firewall" {
  depends_on = [module.virtual_network, module.subnet]

  source    = "../../module/firewall"
  firewalls = var.firewalls
}

module "bastion" {
  depends_on = [module.virtual_network, module.subnet]

  source   = "../../module/azure_bastion"
  bastions = var.bastions
}

module "public_ip" {
  source     = "../../module/public_ip"
  public_ips = var.public_ips
}

module "storage_account" {
  depends_on       = [module.resource_group]
  source           = "../../module/storage_account"
  storage_accounts = var.storage_accounts
}

# ==================================================
# 11. PRIVATE DNS MODULE
# ==================================================
module "private_dns" {
  depends_on = [module.resource_group, module.virtual_network]

  source            = "../../module/private_dns"
  private_dns_zones = var.private_dns_zones
  vnet_links        = var.private_dns_vnet_links
}

# ==================================================
# 12. SQL DATABASE MODULE
# ==================================================
module "sql_database" {
  depends_on = [module.resource_group]

  source      = "../../module/sql_database"
  sql_servers = var.sql_servers
}

# ==================================================
# 13. PRIVATE ENDPOINT MODULE
# ==================================================
module "private_endpoint" {
  depends_on = [
    module.virtual_network,
    module.subnet,
    module.storage_account,
    module.sql_database,
    module.private_dns
  ]

  source            = "../../module/private_endpoint"
  private_endpoints = var.private_endpoints
}

# ==================================================
# 14. VIRTUAL MACHINE MODULE
# ==================================================
module "virtual_machine" {
  depends_on = [
    module.resource_group,
    module.virtual_network,
    module.subnet
  ]

  source           = "../../module/virtual_machine"
  virtual_machines = var.virtual_machines
}

# ==================================================
# 15. LOAD BALANCER MODULE
# ==================================================
module "load_balancer" {
  depends_on = [
    module.resource_group,
    module.virtual_network,
    module.subnet
  ]

  source         = "../../module/load_balancer"
  load_balancers = var.load_balancers
}

# ==================================================
# 16. APPLICATION GATEWAY MODULE
# ==================================================
module "application_gateway" {
  depends_on = [
    module.resource_group,
    module.virtual_network,
    module.subnet,
    module.public_ip
  ]

  source               = "../../module/application_gateway"
  application_gateways = var.application_gateways
}

# ==================================================
# 17. MONITORING MODULE
# ==================================================
module "monitoring" {
  depends_on = [module.resource_group]

  source                   = "../../module/monitoring"
  log_analytics_workspaces = var.log_analytics_workspaces
  application_insights     = var.application_insights
  action_groups            = var.action_groups
}


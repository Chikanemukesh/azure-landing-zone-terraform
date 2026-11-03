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
  depends_on = [module.virtual_network]
  source        = "../../module/vnet_peering"
  vnet_peerings = var.vnet_peerings
}

module "firewall" {
  depends_on = [
    module.virtual_network,
    module.subnet
  ]

  source    = "../../module/firewall"
  firewalls = var.firewalls
}
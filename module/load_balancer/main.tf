
data "azurerm_subnet" "lb_subnet" {
  for_each = var.load_balancers

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.vnet_resource_group_name
}

resource "azurerm_lb" "lb" {
  for_each = var.load_balancers

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku

  frontend_ip_configuration {
    name                          = each.value.frontend_ip_name
    subnet_id                     = data.azurerm_subnet.lb_subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_allocation
  }

  tags = each.value.tags
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each = var.load_balancers

  name            = each.value.backend_pool_name
  loadbalancer_id = azurerm_lb.lb[each.key].id
}

resource "azurerm_lb_probe" "probe" {
  for_each = var.load_balancers

  name            = each.value.probe_name
  loadbalancer_id = azurerm_lb.lb[each.key].id
  protocol        = each.value.probe_protocol
  port            = each.value.probe_port
}

resource "azurerm_lb_rule" "lb_rule" {
  for_each = var.load_balancers

  name                           = each.value.rule_name
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool[each.key].id]
  probe_id                       = azurerm_lb_probe.probe[each.key].id
}

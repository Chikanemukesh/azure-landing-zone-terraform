
data "azurerm_subnet" "appgw_subnet" {
  for_each = var.application_gateways

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.vnet_resource_group_name
}

data "azurerm_public_ip" "appgw_pip" {
  for_each = var.application_gateways

  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_application_gateway" "appgw" {
  for_each = var.application_gateways

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    capacity = each.value.capacity
  }

  gateway_ip_configuration {
    name      = each.value.name
    subnet_id = data.azurerm_subnet.appgw_subnet[each.key].id
  }

  frontend_port {
    name = each.value.frontend_port_name
    port = each.value.frontend_port
  }

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_name
    public_ip_address_id = data.azurerm_public_ip.appgw_pip[each.key].id
  }

  backend_address_pool {
    name = each.value.backend_pool_name
  }

  backend_http_settings {
    name                  = each.value.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = each.value.frontend_port
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = each.value.http_listener_name
    frontend_ip_configuration_name = each.value.frontend_ip_name
    frontend_port_name             = each.value.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = each.value.routing_rule_name
    priority                   = each.value.priority
    rule_type                  = "Basic"
    http_listener_name         = each.value.http_listener_name
    backend_address_pool_name  = each.value.backend_pool_name
    backend_http_settings_name = each.value.backend_http_settings_name
  }

  tags = each.value.tags
}

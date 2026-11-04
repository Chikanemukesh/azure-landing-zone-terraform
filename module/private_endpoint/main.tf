# Azure Private Endpoint
# Purpose: Azure services (Storage, SQL, etc.) ko VNet ke andar securely connect karna.

data "azurerm_subnet" "pe_subnet" {
  for_each = var.private_endpoints

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.vnet_resource_group_name
}

resource "azurerm_private_endpoint" "private_endpoint" {
  for_each = var.private_endpoints

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = data.azurerm_subnet.pe_subnet[each.key].id

  private_service_connection {
    name                           = "${each.value.name}-connection"
    private_connection_resource_id = each.value.private_connection_resource_id
    subresource_names              = each.value.subresource_names
    is_manual_connection          = coalesce(each.value.is_manual_connection, false)
  }

  dynamic "private_dns_zone_group" {
    for_each = length(coalesce(each.value.private_dns_zone_ids, [])) > 0 ? [1] : []
    content {
      name                 = "${each.value.name}-dns-group"
      private_dns_zone_ids = each.value.private_dns_zone_ids
    }
  }

  tags = each.value.tags
}

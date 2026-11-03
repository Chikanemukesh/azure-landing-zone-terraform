resource "azurerm_storage_account" "storage_account" {

  for_each = var.storage_accounts

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location

  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  account_kind = "StorageV2"
  access_tier  = "Hot"

  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"

  public_network_access = "Disabled"

  allow_nested_items_to_be_public = false

  tags = each.value.tags
}
resource "azurerm_storage_account" "asmit4" {
  for_each = var.asmitstg

  name                     = each.value.stg_name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

resource "azurerm_storage_container" "asmit5" {
  for_each              = var.asmitstg
  name                  = each.value.con_name
  storage_account_id    = azurerm_storage_account.asmit4[each.key].id
  container_access_type = each.value.container_access_type
}
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  for_each                    = var.key_vault
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = lookup(each.value, "enabled_for_disk_encryption", true)
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = lookup(each.value, "soft_delete_retention_days", 7)
  purge_protection_enabled    = lookup(each.value, "purge_protection_enabled", true)
  sku_name                    = each.value.sku_name
  rbac_authorization_enabled  = lookup(each.value, "rbac_authorization_enabled", false)

  network_acls {
    bypass         = lookup(each.value, "network_acls_bypass", "AzureServices")
    default_action = lookup(each.value, "network_acls_default_action", "Allow")
    ip_rules       = lookup(each.value, "ip_rules", [])
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Create", "Delete", "Update",
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Purge", "Recover",
    ]

    storage_permissions = [
      "Get", "List",
    ]
  }
}

resource "azurerm_key_vault_secret" "secret" {
  for_each        = var.secrets
  name            = each.value.name
  value           = each.value.value
  key_vault_id    = azurerm_key_vault.key_vault[each.value.key_vault_key].id
  content_type    = lookup(each.value, "content_type", "Password")
  expiration_date = lookup(each.value, "expiration_date", "2027-12-31T23:59:59Z")
}


output "key_vault_ids" {
  value = { for k, v in azurerm_key_vault.key_vault : k => v.id }
}

output "key_vault_names" {
  value = { for k, v in azurerm_key_vault.key_vault : k => v.name }
}

output "secrets" {
  value     = { for k, v in azurerm_key_vault_secret.secret : k => v.value }
  sensitive = true
}

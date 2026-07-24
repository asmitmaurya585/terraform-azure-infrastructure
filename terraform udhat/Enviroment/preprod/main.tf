module "resource_group" {
  source  = "../../module/azurerm_resource_group"
  asmitrg = var.asmitrg
}

module "storage" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_storage_account"
  asmitstg   = var.asmitstg
}
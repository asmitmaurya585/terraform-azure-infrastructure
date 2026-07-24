data "azurerm_subnet" "asmit" {
  for_each = var.asmitvm

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_subnet" "asmit2" {
  for_each = var.windows_vms

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

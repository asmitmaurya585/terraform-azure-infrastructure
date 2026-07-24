data "azurerm_subnet" "asmit" {
  for_each = var.bastion_host

  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "asmit" {
  for_each            = var.bastion_host
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}
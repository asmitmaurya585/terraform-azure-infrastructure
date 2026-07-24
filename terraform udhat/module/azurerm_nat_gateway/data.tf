data "azurerm_subnet" "asmit" {
  for_each = var.subnet_association

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "asmit" {
  for_each            = var.nat_gateway1
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}
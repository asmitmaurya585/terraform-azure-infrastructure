resource "azurerm_virtual_network" "asmit2" {
  for_each = var.asmitvnet

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}
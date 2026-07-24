resource "azurerm_public_ip" "asmit6" {
  for_each            = var.asmitip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}
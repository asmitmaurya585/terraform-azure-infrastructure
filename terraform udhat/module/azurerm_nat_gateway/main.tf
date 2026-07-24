resource "azurerm_nat_gateway" "asmit7" {
  for_each                = var.nat_gateway
  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  sku_name                = each.value.sku_name
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  zones                   = each.value.zones
}

resource "azurerm_nat_gateway_public_ip_association" "nat_pip" {
  for_each = var.nat_gateway1

  nat_gateway_id       = azurerm_nat_gateway.asmit7[each.key].id
  public_ip_address_id = data.azurerm_public_ip.asmit[each.key].id
}

resource "azurerm_subnet_nat_gateway_association" "asmit8" {
  for_each = var.subnet_association

  subnet_id      = data.azurerm_subnet.asmit[each.key].id
  nat_gateway_id = azurerm_nat_gateway.asmit7["subnetvm1"].id

}
resource "azurerm_bastion_host" "asmit" {
  for_each            = var.bastion_host
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = data.azurerm_subnet.asmit[each.key].id
    public_ip_address_id = data.azurerm_public_ip.asmit[each.key].id
  }
}
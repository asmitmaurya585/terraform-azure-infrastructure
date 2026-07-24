data "azurerm_subnet" "appgw_subnet" {
  for_each             = var.app_gateway
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "appgw_pip" {
  for_each            = var.app_gateway
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "linux_nic" {
  for_each            = var.app_gateway
  name                = each.value.linux_nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "windows_nic" {
  for_each            = var.app_gateway
  name                = each.value.windows_nic_name
  resource_group_name = each.value.resource_group_name
}



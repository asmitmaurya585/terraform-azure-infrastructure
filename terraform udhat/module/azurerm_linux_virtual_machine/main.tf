resource "azurerm_network_interface" "asmit10" {
  for_each            = var.asmitvm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.asmit[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_virtual_machine" "asmit11" {
  for_each            = var.asmitvm
  name                = each.value.vm_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  network_interface_ids = [
  azurerm_network_interface.asmit10[each.key].id, ]
  vm_size = each.value.vm_size

  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  storage_os_disk {
    name              = each.value.os_disk_name
    caching           = each.value.caching
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.computer_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }
  #tfsec:ignore:azure-compute-disable-password-authentication
  os_profile_linux_config {
    disable_password_authentication = false
  }

}


resource "azurerm_network_interface" "windows_nic" {
  for_each = var.windows_vms

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.asmit2[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "windows" {

  for_each = var.windows_vms

  name                = each.value.vm_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  size                = each.value.vm_size

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  #tfsec:ignore:azure-compute-disable-password-authentication
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.windows_nic[each.key].id,
  ]

  os_disk {
    name                 = each.value.os_disk_name
    caching              = each.value.caching
    storage_account_type = each.value.managed_disk_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}
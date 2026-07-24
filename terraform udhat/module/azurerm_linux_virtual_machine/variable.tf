variable "asmitvm" {
  type = map(object({
    nic_name                      = string
    subnet_name                   = string
    virtual_network_name          = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
    vm_name                       = string
    location                      = string
    resource_group_name           = string
    vm_size                       = string
    admin_username                = string
    admin_password                = string
    publisher                     = string
    offer                         = string
    sku                           = string
    version                       = string
    os_disk_name                  = string
    caching                       = string
    create_option                 = string
    managed_disk_type             = string
    computer_name                 = string

  }))
}

variable "windows_vms" {
  type = map(object({
    nic_name                      = string
    subnet_name                   = string
    virtual_network_name          = string
    ip_configuration_name         = string
    private_ip_address_allocation = string
    vm_name                       = string
    location                      = string
    resource_group_name           = string
    vm_size                       = string
    admin_username                = string
    admin_password                = string
    publisher                     = string
    offer                         = string
    sku                           = string
    version                       = string
    os_disk_name                  = string
    caching                       = string
    create_option                 = string
    managed_disk_type             = string
    computer_name                 = string
  }))
}

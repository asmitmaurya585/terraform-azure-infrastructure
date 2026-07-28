variable "asmitrg" {
  type = any
}
variable "asmitsub" {
  type = any
}
variable "asmitvnet" {
  type = any
}


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


variable "bastion_host" {
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    ip_configuration_name = string
    subnet_name           = string
    virtual_network_name  = string
    public_ip_name        = string
  }))
}

variable "asmitip" {
  type = any
}
variable "nat_gateway" {
  type = any
}
variable "nat_gateway1" {
  type = any
}
variable "subnet_association" {
  type = any
}
variable "nsg" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    nic_name            = string

    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "app_gateway" {
  type = any
}

variable "key_vault" {
  type = any
}

variable "secrets" {
  type    = any
  default = {}
}



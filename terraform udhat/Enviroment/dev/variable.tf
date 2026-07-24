variable "asmitrg" {}
variable "asmitsub" {}
variable "asmitvnet" {}


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

variable "asmitip" {}
variable "nat_gateway" {}
variable "nat_gateway1" {}
variable "subnet_association" {}
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
  type = map(object({
    name                                   = string
    location                               = string
    resource_group_name                    = string
    sku_name                               = string
    sku_tier                               = string
    capacity                               = number
    subnet_name                            = string
    virtual_network_name                   = string
    public_ip_name                         = string
    gateway_ip_configuration_name          = string
    frontend_port_name                     = string
    frontend_port                          = number
    frontend_ip_configuration_name         = string
    linux_nic_name                         = string
    windows_nic_name                       = string
    linux_backend_pool_name                = string
    windows_backend_pool_name              = string
    linux_backend_http_settings_name       = string
    windows_backend_http_settings_name     = string
    cookie_based_affinity                  = string
    linux_backend_http_settings_port       = number
    windows_backend_http_settings_port     = number
    linux_backend_http_settings_protocol   = string
    windows_backend_http_settings_protocol = string
    request_timeout                        = number
    linux_listener_name                    = string
    windows_listener_name                  = string
    http_listener_protocol                 = string
    linux_host_name                        = string
    windows_host_name                      = string
    linux_rule_name                        = string
    windows_rule_name                      = string
    rule_type                              = string
    linux_rule_priority                    = number
    windows_rule_priority                  = number
  }))
}


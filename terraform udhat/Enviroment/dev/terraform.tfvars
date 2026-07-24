asmitrg = {
  rg1 = {
    name     = "devrg"
    location = "centralindia"
  }
}

asmitvnet = {
  vnet1 = {
    name                = "devvent"
    location            = "centralindia"
    resource_group_name = "devrg"
    address_space       = ["10.0.0.0/16"]
  }
}

asmitsub = {
  sub1 = {
    name                 = "subnet1"
    resource_group_name  = "devrg"
    virtual_network_name = "devvent"
    address_prefixes     = ["10.0.1.0/24"]
  }

  sub2 = {
    name                 = "subnet2"
    resource_group_name  = "devrg"
    virtual_network_name = "devvent"
    address_prefixes     = ["10.0.2.0/24"]
  }

  sub3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "devrg"
    virtual_network_name = "devvent"
    address_prefixes     = ["10.0.3.0/26"]
  }

  sub4 = {
    name                 = "gateway"
    resource_group_name  = "devrg"
    virtual_network_name = "devvent"
    address_prefixes     = ["10.0.4.0/26"]
  }
}

asmitip = {
  pip1 = {
    name                = "Nat_pip"
    resource_group_name = "devrg"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip2 = {
    name                = "bastion_pip"
    resource_group_name = "devrg"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip3 = {
    name                = "load_pip"
    resource_group_name = "devrg"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nat_gateway = {
  subnetvm1 = {
    name                    = "devnat"
    location                = "centralindia"
    resource_group_name     = "devrg"
    sku_name                = "Standard"
    idle_timeout_in_minutes = 10
    zones                   = null

  }
}
nat_gateway1 = {
  subnetvm1 = {
    public_ip_name      = "Nat_pip"
    resource_group_name = "devrg"
  }
}
subnet_association = {
  subnet4 = {
    subnet_name         = "subnet1"
    vnet_name           = "devvent"
    resource_group_name = "devrg"
  }

  subnet3 = {
    subnet_name         = "subnet2"
    vnet_name           = "devvent"
    resource_group_name = "devrg"
  }
}

bastion_host = {
  bastion1 = {
    name                  = "devbastion"
    location              = "centralindia"
    resource_group_name   = "devrg"
    ip_configuration_name = "configuration"
    subnet_name           = "AzureBastionSubnet"
    virtual_network_name  = "devvent"
    public_ip_name        = "bastion_pip"
  }
}

asmitvm = {
  vm1 = {
    nic_name                      = "nicdev"
    subnet_name                   = "subnet1"
    virtual_network_name          = "devvent"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
    vm_name                       = "fronted-dev"
    location                      = "centralindia"
    resource_group_name           = "devrg"
    vm_size                       = "Standard_E2s_v3"
    admin_username                = "fronted-dev"
    admin_password                = "asmit@123456"
    publisher                     = "Canonical"
    offer                         = "0001-com-ubuntu-server-jammy"
    sku                           = "22_04-lts"
    version                       = "latest"
    os_disk_name                  = "myosdisk1"
    caching                       = "ReadWrite"
    create_option                 = "FromImage"
    managed_disk_type             = "Standard_LRS"
    computer_name                 = "host-name"

  }
}
windows_vms = {
  vm2 = {
    nic_name                      = "nicdev2"
    subnet_name                   = "subnet2"
    virtual_network_name          = "devvent"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"

    vm_name             = "windows-dev2"
    location            = "centralindia"
    resource_group_name = "devrg"
    vm_size             = "Standard_D2s_v3"

    admin_username = "azureadmin"
    admin_password = "Asmit@123456"

    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"

    os_disk_name      = "windowsosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

    computer_name = "windows-host2"
  }
}

nsg = {
  linux = {
    name                = "devnsg"
    location            = "centralindia"
    resource_group_name = "devrg"
    nic_name            = "nicdev"

    security_rules = [
      {
        name                       = "Allow-SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-HTTP"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }

  windows = {
    name                = "windows-nsg"
    location            = "centralindia"
    resource_group_name = "devrg"
    nic_name            = "nicdev2"

    security_rules = [
      {
        name                       = "Allow-RDP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

app_gateway = {
  agw1 = {
    name                                   = "dev-appgateway"
    location                               = "centralindia"
    resource_group_name                    = "devrg"
    sku_name                               = "Standard_v2"
    sku_tier                               = "Standard_v2"
    capacity                               = 2
    subnet_name                            = "gateway"
    virtual_network_name                   = "devvent"
    public_ip_name                         = "load_pip"
    gateway_ip_configuration_name          = "appGatewayIpConfig"
    frontend_port_name                     = "http-port"
    frontend_port                          = 80
    frontend_ip_configuration_name         = "appGatewayFrontendIP"
    linux_nic_name                         = "nicdev"
    windows_nic_name                       = "nicdev2"
    linux_backend_pool_name                = "linux-backend-pool"
    windows_backend_pool_name              = "windows-backend-pool"
    linux_backend_http_settings_name       = "linux-http-setting"
    windows_backend_http_settings_name     = "windows-http-setting"
    cookie_based_affinity                  = "Disabled"
    linux_backend_http_settings_port       = 80
    windows_backend_http_settings_port     = 80
    linux_backend_http_settings_protocol   = "Http"
    windows_backend_http_settings_protocol = "Http"
    request_timeout                        = 60
    linux_listener_name                    = "linux-listener"
    windows_listener_name                  = "windows-listener"
    http_listener_protocol                 = "Http"
    linux_host_name                        = "linux.b18g66.online"
    windows_host_name                      = "windows.b18g66.online"
    linux_rule_name                        = "linux-rule"
    windows_rule_name                      = "windows-rule"
    rule_type                              = "Basic"
    linux_rule_priority                    = 10
    windows_rule_priority                  = 20
  }
}



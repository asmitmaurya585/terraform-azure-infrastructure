asmitrg = {
  rg1 = {
    name     = "sandboxrg"
    location = "centralindia"
  }
  rg2 = {
    name     = "sandboxrg2"
    location = "centralindia"
  }
  rg3 = {
    name     = "sandboxrg3"
    location = "centralindia"
  }
}

asmitvnet = {
  vnet1 = {
    name                = "sandboxvnet"
    location            = "centralindia"
    resource_group_name = "sandboxrg"
    address_space       = ["10.10.0.0/16"]
  }
}

asmitsub = {
  sub1 = {
    name                 = "sandbox-subnet1"
    resource_group_name  = "sandboxrg"
    virtual_network_name = "sandboxvnet"
    address_prefixes     = ["10.10.1.0/24"]
  }

  sub2 = {
    name                 = "sandbox-subnet2"
    resource_group_name  = "sandboxrg"
    virtual_network_name = "sandboxvnet"
    address_prefixes     = ["10.10.2.0/24"]
  }

  sub3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "sandboxrg"
    virtual_network_name = "sandboxvnet"
    address_prefixes     = ["10.10.3.0/26"]
  }

  sub4 = {
    name                 = "sandbox-gateway"
    resource_group_name  = "sandboxrg"
    virtual_network_name = "sandboxvnet"
    address_prefixes     = ["10.10.4.0/26"]
  }
}

asmitip = {
  pip1 = {
    name                = "sandbox_nat_pip"
    resource_group_name = "sandboxrg"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip2 = {
    name                = "sandbox_bastion_pip"
    resource_group_name = "sandboxrg"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip3 = {
    name                = "sandbox_load_pip"
    resource_group_name = "sandboxrg"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

nat_gateway = {
  subnetvm1 = {
    name                    = "sandboxnat"
    location                = "centralindia"
    resource_group_name     = "sandboxrg"
    sku_name                = "Standard"
    idle_timeout_in_minutes = 10
    zones                   = null
  }
}

nat_gateway1 = {
  subnetvm1 = {
    public_ip_name      = "sandbox_nat_pip"
    resource_group_name = "sandboxrg"
  }
}

subnet_association = {
  subnet4 = {
    subnet_name         = "sandbox-subnet1"
    vnet_name           = "sandboxvnet"
    resource_group_name = "sandboxrg"
  }

  subnet3 = {
    subnet_name         = "sandbox-subnet2"
    vnet_name           = "sandboxvnet"
    resource_group_name = "sandboxrg"
  }
}

bastion_host = {
  bastion1 = {
    name                  = "sandboxbastion"
    location              = "centralindia"
    resource_group_name   = "sandboxrg"
    ip_configuration_name = "configuration"
    subnet_name           = "AzureBastionSubnet"
    virtual_network_name  = "sandboxvnet"
    public_ip_name        = "sandbox_bastion_pip"
  }
}

asmitvm = {
  vm1 = {
    nic_name                      = "nicsandbox1"
    subnet_name                   = "sandbox-subnet1"
    virtual_network_name          = "sandboxvnet"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
    vm_name                       = "frontend-sandbox"
    location                      = "centralindia"
    resource_group_name           = "sandboxrg"
    vm_size                       = "Standard_E2s_v3"
    admin_username                = "sandboxadmin"
    admin_password                = "Sandbox@123456"
    publisher                     = "Canonical"
    offer                         = "0001-com-ubuntu-server-jammy"
    sku                           = "22_04-lts"
    version                       = "latest"
    os_disk_name                  = "sandboxosdisk1"
    caching                       = "ReadWrite"
    create_option                 = "FromImage"
    managed_disk_type             = "Standard_LRS"
    computer_name                 = "sandbox-host1"
  }
}

windows_vms = {
  vm2 = {
    nic_name                      = "nicsandbox2"
    subnet_name                   = "sandbox-subnet2"
    virtual_network_name          = "sandboxvnet"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"

    vm_name             = "linux-sandbox2"
    location            = "centralindia"
    resource_group_name = "sandboxrg"
    vm_size             = "Standard_D2s_v3"

    admin_username = "sandboxadmin"
    admin_password = "Sandbox@123456"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    os_disk_name      = "sandboxosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"

    computer_name = "sandbox-host2"
  }
}

nsg = {
  linux = {
    name                = "sandboxnsg1"
    location            = "centralindia"
    resource_group_name = "sandboxrg"
    nic_name            = "nicsandbox1"

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
    name                = "sandboxnsg2"
    location            = "centralindia"
    resource_group_name = "sandboxrg"
    nic_name            = "nicsandbox2"

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
}

app_gateway = {
  agw1 = {
    name                                   = "sandbox-appgateway"
    location                               = "centralindia"
    resource_group_name                    = "sandboxrg"
    sku_name                               = "Standard_v2"
    sku_tier                               = "Standard_v2"
    capacity                               = 2
    subnet_name                            = "sandbox-gateway"
    virtual_network_name                   = "sandboxvnet"
    public_ip_name                         = "sandbox_load_pip"
    gateway_ip_configuration_name          = "appGatewayIpConfig"
    frontend_port_name                     = "http-port"
    frontend_port                          = 80
    https_frontend_port_name               = "https-port"
    https_frontend_port                    = 443
    frontend_ip_configuration_name         = "appGatewayFrontendIP"
    ssl_certificate_name                   = "appgw-ssl-cert"
    ssl_certificate_path                   = "appgwcert.pfx"
    ssl_certificate_password               = "Sandbox@123456"
    linux_nic_name                         = "nicsandbox1"
    windows_nic_name                       = "nicsandbox2"
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
    http_listener_protocol                 = "Https"
    linux_host_name                        = "sandbox-linux.b18g66.online"
    windows_host_name                      = "sandbox-windows.b18g66.online"
    linux_rule_name                        = "linux-rule"
    windows_rule_priority                  = 20
    linux_rule_priority                    = 10
    windows_rule_name                      = "windows-rule"
    rule_type                              = "Basic"
  }
}

key_vault = {
  kv1 = {
    name                        = "sandboxkv-asmit-01"
    location                    = "centralindia"
    resource_group_name         = "sandboxrg"
    sku_name                    = "standard"
    purge_protection_enabled    = true
    network_acls_default_action = "Allow"
    ip_rules                    = ["122.161.79.41"]
  }
}

secrets = {
  vm1_secret = {
    name          = "frontend-sandbox-vm-password"
    value         = "Sandbox@123456"
    key_vault_key = "kv1"
  }
  vm2_secret = {
    name          = "linux-sandbox2-vm-password"
    value         = "Sandbox@123456"
    key_vault_key = "kv1"
  }
}

log_analytics_workspace = {
  law1 = {
    name                = "sandbox-log-analytics-workspace"
    location            = "centralindia"
    resource_group_name = "sandboxrg"
    sku                 = "PerGB2018"
    retention_in_days   = 30
  }
}


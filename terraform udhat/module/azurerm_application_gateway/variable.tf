variable "app_gateway" {
  type = map(object({
    name                           = string
    location                       = string
    resource_group_name            = string
    sku_name                       = string
    sku_tier                       = string
    capacity                       = number
    subnet_name                    = string
    virtual_network_name           = string
    public_ip_name                 = string
    gateway_ip_configuration_name  = string
    frontend_port_name             = string
    frontend_port                  = number
    frontend_ip_configuration_name = string
    linux_nic_name                 = string
    windows_nic_name               = string
    linux_backend_pool_name        = string
    windows_backend_pool_name      = string
    linux_backend_http_settings_name     = string
    windows_backend_http_settings_name   = string
    cookie_based_affinity                = string
    linux_backend_http_settings_port     = number
    windows_backend_http_settings_port   = number
    linux_backend_http_settings_protocol = string
    windows_backend_http_settings_protocol = string
    request_timeout                = number
    linux_listener_name            = string
    windows_listener_name          = string
    http_listener_protocol         = string
    linux_host_name                = string
    windows_host_name              = string
    linux_rule_name                = string
    windows_rule_name              = string
    rule_type                      = string
    linux_rule_priority            = number
    windows_rule_priority          = number
  }))
}



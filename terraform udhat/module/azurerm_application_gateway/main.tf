resource "azurerm_application_gateway" "appgw" {
  for_each            = var.app_gateway
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    capacity = each.value.capacity
  }

  gateway_ip_configuration {
    name      = each.value.gateway_ip_configuration_name
    subnet_id = data.azurerm_subnet.appgw_subnet[each.key].id
  }

  frontend_port {
    name = each.value.frontend_port_name
    port = each.value.frontend_port
  }

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.appgw_pip[each.key].id
  }

  backend_address_pool {
    name         = each.value.linux_backend_pool_name
    ip_addresses = [data.azurerm_network_interface.linux_nic[each.key].private_ip_address]
  }

  backend_address_pool {
    name         = each.value.windows_backend_pool_name
    ip_addresses = [data.azurerm_network_interface.windows_nic[each.key].private_ip_address]
  }

  backend_http_settings {
    name                  = each.value.linux_backend_http_settings_name
    cookie_based_affinity = each.value.cookie_based_affinity
    port                  = each.value.linux_backend_http_settings_port
    protocol              = each.value.linux_backend_http_settings_protocol
    request_timeout       = each.value.request_timeout
  }

  backend_http_settings {
    name                  = each.value.windows_backend_http_settings_name
    cookie_based_affinity = each.value.cookie_based_affinity
    port                  = each.value.windows_backend_http_settings_port
    protocol              = each.value.windows_backend_http_settings_protocol
    request_timeout       = each.value.request_timeout
  }

  http_listener {
    name                           = each.value.linux_listener_name
    frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
    frontend_port_name             = each.value.frontend_port_name
    protocol                       = each.value.http_listener_protocol
    host_name                      = each.value.linux_host_name
  }

  http_listener {
    name                           = each.value.windows_listener_name
    frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
    frontend_port_name             = each.value.frontend_port_name
    protocol                       = each.value.http_listener_protocol
    host_name                      = each.value.windows_host_name
  }

  request_routing_rule {
    name                       = each.value.linux_rule_name
    rule_type                  = each.value.rule_type
    http_listener_name         = each.value.linux_listener_name
    backend_address_pool_name  = each.value.linux_backend_pool_name
    backend_http_settings_name = each.value.linux_backend_http_settings_name
    priority                   = each.value.linux_rule_priority
  }

  request_routing_rule {
    name                       = each.value.windows_rule_name
    rule_type                  = each.value.rule_type
    http_listener_name         = each.value.windows_listener_name
    backend_address_pool_name  = each.value.windows_backend_pool_name
    backend_http_settings_name = each.value.windows_backend_http_settings_name
    priority                   = each.value.windows_rule_priority
  }
}



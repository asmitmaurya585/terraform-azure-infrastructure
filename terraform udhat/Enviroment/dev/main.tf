module "resource_group" {
  source  = "../../module/azurerm_resource_group"
  asmitrg = var.asmitrg
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_virtual_network"
  asmitvnet  = var.asmitvnet
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../module/azurerm_subnet"
  asmitsub   = var.asmitsub
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_puplic_ip"
  asmitip    = var.asmitip
}

module "nat_gateway" {
  depends_on         = [module.public_ip, module.subnet]
  source             = "../../module/azurerm_nat_gateway"
  nat_gateway        = var.nat_gateway
  nat_gateway1       = var.nat_gateway1
  subnet_association = var.subnet_association
}

module "bastion_host" {
  depends_on   = [module.public_ip, module.subnet]
  source       = "../../module/azurerm_bastion"
  bastion_host = var.bastion_host
}

module "virtual_machine" {
  depends_on  = [module.public_ip, module.subnet]
  source      = "../../module/azurerm_linux_virtual_machine"
  asmitvm     = var.asmitvm
  windows_vms = var.windows_vms
}

module "nsg" {
  depends_on = [module.virtual_machine]
  source     = "../../module/azurerm_nsg"
  nsg        = var.nsg

}

module "application_gateway" {
  depends_on  = [module.virtual_machine, module.public_ip, module.subnet]
  source      = "../../module/azurerm_application_gateway"
  app_gateway = var.app_gateway
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_key_vault"
  key_vault  = var.key_vault
  secrets    = var.secrets
}



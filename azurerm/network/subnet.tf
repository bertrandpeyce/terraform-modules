locals {
  subnet_name             = var.prefix_name == "" ? format("subnet%d", var.subnet_id) : format("%s-subnet%d", var.prefix_name, var.subnet_id)
}

resource "azurerm_subnet" "subnet" {
  name                 = local.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
}

locals {
  vnet_name          = var.prefix_name == "" ? format("vnet%d", var.vnet_id) : format("%s-vnet%d", var.prefix_name, var.vnet_id)
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
  tags                = var.vnet_tags
}

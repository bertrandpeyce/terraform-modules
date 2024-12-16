resource "azurerm_network_security_group" "nsg" {
  name                = format("%s-%s%03d-nsg", var.prefix_name, var.vm_base_name, var.vm_id)
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.vm_tags

}

resource "azurerm_network_security_rule" "nsg_rules" {
  for_each = { for rule in var.vm_nsg_rules : rule.name => rule }

    name                       = each.value.name
    priority                   = each.value.priority
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = "*"
    destination_address_prefix = "*"

    network_security_group_name = azurerm_network_security_group.nsg.name
    resource_group_name         = var.resource_group_name
}


resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


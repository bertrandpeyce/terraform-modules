
resource "azurerm_network_interface" "nic" {
  name                = format("%s-%s%03d-nic", var.prefix_name, var.vm_base_name, var.vm_id)
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
  tags = var.vm_tags
}

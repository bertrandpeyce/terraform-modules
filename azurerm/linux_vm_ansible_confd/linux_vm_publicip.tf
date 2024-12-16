
resource "azurerm_public_ip" "pip" {
  name                = format("%s-%s%03d-publicip", var.prefix_name, var.vm_base_name, var.vm_id)
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  tags                = var.vm_tags
  domain_name_label   = var.vm_domain_name_label
}

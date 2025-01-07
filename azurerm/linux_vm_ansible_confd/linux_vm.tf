
resource "azurerm_linux_virtual_machine" "vm" {
  resource_group_name   = var.resource_group_name
  name                  = format("%s-%s%03d", var.prefix_name, var.vm_base_name, 1)
  location              = var.location
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.vm_size
  user_data = var.ansible_playbook_name == "" || var.ansible_playbook_url == "" ? null : base64encode(templatefile("${path.module}/templates/linux_vm_cloud_config.yml.tftpl", {
    ansible_playbook_url  = var.ansible_playbook_url
    ansible_playbook_name = var.ansible_playbook_name
    admin_username        = var.admin_username
  }))

  tags = var.vm_tags

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.admin_ssh_public_key_path)

  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    sku       = "server"
    offer     = "ubuntu-24_04-lts"
    publisher = "Canonical"
    version   = "latest"
  }
}

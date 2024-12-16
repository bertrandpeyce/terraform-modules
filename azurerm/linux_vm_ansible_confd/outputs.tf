output "public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "private_ip_address" {
  value = azurerm_network_interface.nic.private_ip_address
} 

output "fqdn" {
  value = azurerm_public_ip.pip.fqdn
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}


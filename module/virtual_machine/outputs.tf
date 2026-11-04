output "virtual_machines" {
  description = "Map of virtual machines"
  value       = azurerm_linux_virtual_machine.vm
  sensitive   = true
}

output "vm_ids" {
  description = "Map of virtual machine IDs"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.id }
}

output "nic_ids" {
  description = "Map of network interface IDs"
  value       = { for k, v in azurerm_network_interface.vm_nic : k => v.id }
}

output "private_ip_addresses" {
  description = "Map of private IP addresses"
  value       = { for k, v in azurerm_network_interface.vm_nic : k => v.private_ip_address }
}

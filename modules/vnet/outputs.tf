output "virtual_network_name" {
  description = "The name of the created virtual network."
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  value = azurerm_subnet.private.id
  description = "The ID of the private subnet"
}
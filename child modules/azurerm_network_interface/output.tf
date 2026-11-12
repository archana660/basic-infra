
output "nic_ids" {
  value = {
    for key, nic in azurerm_network_interface.nic :
    key => nic.id
  }
}

output "nic_names" {
  value = {
    for key, nic in azurerm_network_interface.nic :
    key => nic.name
  }
}

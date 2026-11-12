output "subnet_ids" {
  value = {
    for s, subnet in azurerm_subnet.apex_subnet :
    s => subnet.id
  }
}
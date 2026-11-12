resource "azurerm_public_ip" "apex_public_ip" {
    for_each = var.c_pip
    name                = each.value.public_ip_name
    resource_group_name = each.value.resource_group_name
    location            = each.value.location
    allocation_method   = each.value.allocation_method
  
}
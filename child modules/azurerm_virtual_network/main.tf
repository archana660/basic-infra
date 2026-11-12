resource "azurerm_virtual_network" "apex_vnet" {
    for_each = var.c_vnet
    name                = each.value.vnet_name
    resource_group_name = each.value.resource_group_name
    location            = each.value.location
    address_space       = each.value.vnet_address_space
  
}
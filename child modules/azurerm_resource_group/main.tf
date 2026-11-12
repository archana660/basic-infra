resource "azurerm_resource_group" "apex" {
    for_each = var.c_rg
    name     = each.value.resource_group_name
    location = each.value.location
  
}
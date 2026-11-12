
resource "azurerm_network_interface" "nic" {
  for_each = var.c_nics

  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = try(each.value.public_ip_id, null)
  }

  timeouts {
    create = "10m"
    update = "10m"
    delete = "10m"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  for_each = var.c_nics

  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = each.value.nsg_id
}

resource "azurerm_network_security_group" "apex_nsg" {
  for_each = var.c_nsg

  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  dynamic "security_rule" {
    for_each = each.value.security_rules

    content {
      name                       = security_rule.value.security_rule_name
      priority                   = security_rule.value.security_rule_priority
      direction                  = security_rule.value.security_rule_direction
      access                     = security_rule.value.security_rule_access
      protocol                   = security_rule.value.security_rule_protocol
      source_port_range          = security_rule.value.security_rule_source_port_range
      destination_port_range     = security_rule.value.security_rule_destination_port_range
      source_address_prefix      = security_rule.value.security_rule_source_address_prefix
      destination_address_prefix = security_rule.value.security_rule_destination_address_prefix
    }
  }
}

p_rg = {
  rg1 = {
    resource_group_name = "rg-garv-healthcare"
    location            = "East US"
  }
  rg2 = {
    resource_group_name = "rg-garv-healthcare-2"
    location            = "East US"
  }
}

p_vnet = {
  vnet1 = {
    vnet_name           = "vnet-garv-healthcare"
    resource_group_name = "rg-garv-healthcare"
    location            = "East US"
    vnet_address_space  = ["10.0.0.0/16"]
  }
}

p_subnet = {
  subnet1 = {
    subnet_name             = "subnet-frontend"
    resource_group_name     = "rg-garv-healthcare"
    vnet_name               = "vnet-garv-healthcare"
    subnet_address_prefixes = ["10.0.1.0/26"]
  }

  subnet2 = {
    subnet_name             = "subnet-backend"
    resource_group_name     = "rg-garv-healthcare"
    vnet_name               = "vnet-garv-healthcare"
    subnet_address_prefixes = ["10.0.2.0/26"]
  }

  subnet3 = {
    subnet_name             = "subnet-database"
    resource_group_name     = "rg-garv-healthcare"
    vnet_name               = "vnet-garv-healthcare"
    subnet_address_prefixes = ["10.0.3.0/26"]
  }
}

p_pip = {
  pip1 = {
    public_ip_name      = "pip-garv-healthcare"
    resource_group_name = "rg-garv-healthcare"
    location            = "East US"
    allocation_method   = "Static"
  }
}

p_nsg = {
  nsg1 = {
    nsg_name            = "nsg-garv-healthcare"
    resource_group_name = "rg-garv-healthcare"
    location            = "East US"

    security_rules = [
      {
        security_rule_name                = "allow-ssh"
        security_rule_priority             = 1000
        security_rule_direction             = "Inbound"
        security_rule_access                = "Allow"
        security_rule_protocol               = "Tcp"
        security_rule_source_port_range      = "*"
        security_rule_destination_port_range = "22"
        security_rule_source_address_prefix  = "4.236.128.243/32"
        security_rule_destination_address_prefix = "*"
      }
    ]
  }
}

p_nic = {
  nic1 = {
    nic_name            = "nic-garv-dev"
    location            = "East US"
    resource_group_name = "rg-garv-healthcare"
    subnet_key          = "subnet1"
    public_ip_key       = "pip1"
    nsg_key             = "nsg1"
  }
}

p_vm = {
  vm1 = {
    name                = "vm-ubuntu-dev"
    location            = "East US"
    resource_group_name = "rg-garv-healthcare"
    nic_key             = "nic1"

    size     = "Standard_D2s_v4"
    username = "azureadmin"
    password = "Jaiguruji@123#"
  }
}
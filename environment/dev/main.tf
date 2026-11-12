module "resource_creations" {
  source = "../../child modules/azurerm_resource_group"
  c_rg   = var.p_rg
}

module "vnet_creations" {
  source    = "../../child modules/azurerm_virtual_network"
  c_vnet    = var.p_vnet
  depends_on = [module.resource_creations]
}

module "subnet_creations" {
  source    = "../../child modules/azurerm_subnet"
  c_subnet  = var.p_subnet
  depends_on = [module.vnet_creations]
}

module "pip_creations" {
  source    = "../../child modules/azurerm_publicip"
  c_pip     = var.p_pip
  depends_on = [module.resource_creations]
}

module "nsg_creations" {
  source    = "../../child modules/azurerm_nsg"
  c_nsg     = var.p_nsg
  depends_on = [module.resource_creations]
}

module "nic_creations" {
  source = "../../child modules/azurerm_network_interface"

  c_nics = {
    for key, nic in var.p_nic : key => merge(nic, {
      subnet_id     = module.subnet_creations.subnet_ids[nic.subnet_key]
      public_ip_id  = try(module.pip_creations.pip_ids[nic.public_ip_key], null)
      nsg_id        = module.nsg_creations.nsg_ids[nic.nsg_key]
    })
  }

  depends_on = [
    module.subnet_creations,
    module.pip_creations,
    module.nsg_creations
  ]
}

module "vm_creations" {
  source = "../../child modules/azurerm_virtual_machine"

  c_vm = {
    for key, vm in var.p_vm : key => merge(vm, {
      nic_id = module.nic_creations.nic_ids[vm.nic_key]
    })
  }

  depends_on = [
    module.nic_creations
  ]
}

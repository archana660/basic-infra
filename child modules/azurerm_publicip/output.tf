output "pip_ids" {
  value = {

    for p, pip in azurerm_public_ip.apex_public_ip :
    p => pip.id
  }
  
}
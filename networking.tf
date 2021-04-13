# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "${var.prefix}-${var.vnetName}"
    address_space       = [local.base_cidr_block]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = "${var.prefix}-${each.key}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(local.base_cidr_block, 8, each.value)]
}




# Resource-1: Create WebTier Subnet
resource "azurerm_subnet" "bfc_bkr_subnet" {
  name                 = var.bfc_bkr_subnet_name
  resource_group_name  = var.BFC_DEV_SHARED-NAME
  virtual_network_name = var.bfc_vnet_name
  address_prefixes     = var.bfc_bkr_subnet_address 
  depends_on = [azurerm_virtual_network.bfc_vnet]
}


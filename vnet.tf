# Create Virtual Network
resource "azurerm_virtual_network" "bfc_vnet" {
  name                = var.bfc_vnet_name
  address_space       = var.bfc_vnet_address_space
  location            = var.BFC_DEV_SHARED-LOCATION
  resource_group_name = var.BFC_DEV_SHARED-NAME
  depends_on = [azurerm_resource_group.BFC_DEV_SHARED-RG ]
  tags = {
    environment = "BFC_DEV"
  }
}

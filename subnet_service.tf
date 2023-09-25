# Resource-1: Create WebTier Subnet
resource "azurerm_subnet" "bfc_service_subnet" {
  name                 = var.bfc_dev_service_subnet_name
  resource_group_name  = var.BFC_DEV_SHARED-NAME
  virtual_network_name = var.bfc_vnet_name
  address_prefixes     = var.bfc_dev_service_subnet_address_space  
  depends_on = [azurerm_virtual_network.bfc_vnet,
  azurerm_resource_group.BFC_DEV_SERVICE-RG]
}

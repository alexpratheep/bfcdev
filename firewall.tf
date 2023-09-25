resource "azurerm_public_ip" "bfc_pip" {
  name                = "bfc_pip"
  location            = var.BFC_DEV_SHARED-LOCATION
  resource_group_name = var.BFC_DEV_SHARED-NAME
  allocation_method   = "Static"
  sku                 = "Standard"
  depends_on = [azurerm_resource_group.BFC_DEV_SHARED-RG ]
}

resource "azurerm_firewall" "bfc_firewall" {
  name                = "bfc_firewall"
  location            = var.BFC_DEV_SHARED-LOCATION
  resource_group_name = var.BFC_DEV_SHARED-NAME
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bfc_fw_subnet.id
    public_ip_address_id = azurerm_public_ip.bfc_pip.id
  }
}

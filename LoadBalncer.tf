

resource "azurerm_lb" "bfc_dev_lb" {
  name                = "bfc_dev_lb"
  location            = var.BFC_DEV_SHARED-LOCATION
  resource_group_name = var.BFC_DEV_SHARED-NAME
frontend_ip_configuration {
  name = "lbfrontip"
    private_ip_address = "10.0.10.6"
    private_ip_address_allocation = "Static"

    # Associate it with a subnet where your backend resources reside
    subnet_id = azurerm_subnet.bfc_bl_subnet.id  # Replace with your subnet ID
  }
}
  
resource "azurerm_network_interface" "app_nic" {
  count               = var.vm_count
  name                = "bfc-app-dev-nic-${count.index}"
  location            = var.BFC_DEV_APP-LOCATION
  resource_group_name = var.BFC_DEV_APP-NAME

  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id                     = azurerm_subnet.bfc_app_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "app_vm" {
  count               = var.vm_count
  name                = "bfc-app-dev-${count.index}"
  location            = var.BFC_DEV_APP-LOCATION
  resource_group_name = var.BFC_DEV_APP-NAME
  network_interface_ids = [azurerm_network_interface.app_nic[count.index].id]
admin_username        ="adminuser"
admin_password = var.vm_password 
  size           = "Standard_DS2_v2"
 # delete_os_disk_on_termination = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

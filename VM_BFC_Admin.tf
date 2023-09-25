resource "azurerm_network_interface" "srv_nic" {
  count               = var.vm_count
  name                = "bfc-srv-dev-nic-${count.index}"
  location            = var.BFC_DEV_SERVICE-LOCATION
  resource_group_name = var.BFC_DEV_SERVICE-NAME

  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id                     = azurerm_subnet.bfc_service_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "srv_vm" {
  count               = var.vm_count
  name                = "bfc-srv-dev-${count.index}"
  location            = var.BFC_DEV_SERVICE-LOCATION
  resource_group_name = var.BFC_DEV_SERVICE-NAME
  network_interface_ids = [azurerm_network_interface.srv_nic[count.index].id]
admin_username        ="adminuser"
admin_password = "Password12345!" 
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
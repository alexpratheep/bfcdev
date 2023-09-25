


# Resource-1: Create WebTier Subnet
resource "azurerm_subnet" "bfc_app_subnet" {
  name                 = var.bfc_app_subnet_name
  resource_group_name  = var.BFC_DEV_SHARED-NAME
  virtual_network_name = var.bfc_vnet_name
  address_prefixes     = var.bfc_app_subnet_address 
  depends_on = [azurerm_virtual_network.bfc_vnet]
}

# Resource-2: Create Network Security Group (NSG)
resource "azurerm_network_security_group" "dev_app_nsg" {
  name                = "${azurerm_subnet.bfc_app_subnet.name}-nsg"
  location            = var.BFC_DEV_SHARED-LOCATION
  resource_group_name = var.BFC_DEV_SHARED-NAME
  depends_on = [azurerm_resource_group.BFC_DEV_APP-RG]
}

# Resource-3: Associate NSG and Subnet
resource "azurerm_subnet_network_security_group_association" "dev_app_nsg_associate" {
  depends_on = [ azurerm_network_security_rule.bfc_app_nsg_rule_inbound] # Every NSG Rule Association will disassociate NSG from Subnet and Associate it, so we associate it only after NSG is completely created - Azure Provider Bug https://github.com/terraform-providers/terraform-provider-azurerm/issues/354  
  subnet_id                 = azurerm_subnet.bfc_app_subnet.id
  network_security_group_id = azurerm_network_security_group.dev_app_nsg.id
}

# Resource-4: Create NSG Rules
## Locals Block for Security Rules
locals {
  app_inbound_ports_map = {
    "100" : "80", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "443",
    "120" : "22"
  } 
}
## NSG Inbound Rule for WebTier Subnets
resource "azurerm_network_security_rule" "bfc_app_nsg_rule_inbound" {
  for_each = local.app_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value 
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.BFC_DEV_SHARED-NAME
  network_security_group_name = azurerm_network_security_group.dev_app_nsg.name
  depends_on = [azurerm_network_security_group.dev_app_nsg,
  azurerm_resource_group.BFC_DEV_SHARED-RG]
}

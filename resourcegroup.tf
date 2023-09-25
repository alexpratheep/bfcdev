resource "azurerm_resource_group" "BFC_DEV_SHARED-RG" {
  name     = var.BFC_DEV_SHARED-NAME
  location = var.BFC_DEV_SHARED-LOCATION
}

resource "azurerm_resource_group" "BFC_DEV_APP-RG" {
  name     = var.BFC_DEV_APP-NAME
  location = var.BFC_DEV_APP-LOCATION
}
resource "azurerm_resource_group" "BFC_DEV_DB-RG" {
  name     = var.BFC_DEV_DB-NAME
  location = var.BFC_DEV_DB-LOCATION
}

resource "azurerm_resource_group" "BFC_DEV_admin-RG" {
  name     = var.BFC_DEV_admin-NAME
  location = var.BFC_DEV_admin-LOCATION
}

resource "azurerm_resource_group" "BFC_DEV_infra-RG" {
  name     = var.BFC_DEV_infra-NAME
  location = var.BFC_DEV_infra-LOCATION
}
resource "azurerm_resource_group" "BFC_DEV_SERVICE-RG" {
  name     = var.BFC_DEV_SERVICE-NAME
  location = var.BFC_DEV_SERVICE-LOCATION
}


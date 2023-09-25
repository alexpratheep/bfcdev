# Create an Azure Storage Account
resource "azurerm_storage_account" "bfc_dev_stg" {
  name                     = var.storage_account_name
  resource_group_name      = var.BFC_DEV_infra-NAME
  location                 = var.BFC_DEV_infra-LOCATION
  account_tier             = "Standard"
  account_replication_type = "LRS"      # You can change this to "GRS" for geo-redundant storage
  enable_https_traffic_only = true      # Recommended for security
  depends_on = [azurerm_resource_group.BFC_DEV_infra-RG]

  tags = {
    environment = "dev"
  }
}
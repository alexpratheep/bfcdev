resource "azurerm_key_vault" "bfc_vault" {
  name                        = var.key_vault_name
  location                    = var.BFC_DEV_infra-LOCATION
  resource_group_name         = var.BFC_DEV_infra-NAME
  enabled_for_disk_encryption = true
depends_on = [azurerm_resource_group.BFC_DEV_infra-RG ]
  # Use values from the current Azure client configuration
  tenant_id = "9729e73e-b2fc-4148-94e5-b6e7a0016dce"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = "9729e73e-b2fc-4148-94e5-b6e7a0016dce"
    object_id = "0a262703-f33c-4cfd-9c32-9a2dcbb5ceb2"

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

# Define the object ID of the Azure AD user, group, or service principal you want to grant access to
# You can obtain this object ID from the Azure portal, Azure CLI, or other means





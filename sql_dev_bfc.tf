resource "azurerm_mssql_server" "bfc_dev_sql" {
  name                         = var.bfc_sql_server_name
  resource_group_name          = var.BFC_DEV_DB-NAME
  location                     = var.BFC_DEV_DB-LOCATION
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  depends_on = [azurerm_resource_group.BFC_DEV_DB-RG]

  tags = {
    environment = "production"
  }
}
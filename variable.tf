# Resource Group name
variable "BFC_DEV_SHARED-NAME" {
  type = string
  default = "BFC_DEV_SHARED-RG"
}
# resource_group_location
variable "BFC_DEV_SHARED-LOCATION" {
  type = string
  default =  "UK South"
}

# Resource Group name
variable "BFC_DEV_APP-NAME" {
  type = string
  default = "BFC_DEV_APP-RG"
}
# resource_group_location
variable "BFC_DEV_APP-LOCATION" {
  type = string
  default =  "UK South"
}
# Resource Group name
variable "BFC_DEV_DB-NAME" {
  type = string
  default = "BFC_DEV_DB-RG"
}
# resource_group_location
variable "BFC_DEV_DB-LOCATION" {
  type = string
  default =  "UK South"
}
# Resource Group name
variable "BFC_DEV_admin-NAME" {
  type = string
  default = "BFC_DEV_DB-RG"
}
# resource_group_location
variable "BFC_DEV_admin-LOCATION" {
  type = string
  default =  "UK South"
}

# Resource Group name
variable "BFC_DEV_infra-NAME" {
  type = string
  default = "BFC_DEV_infra-RG"
}
# resource_group_location
variable "BFC_DEV_infra-LOCATION" {
  type = string
  default =  "UK South"
}
# Resource Group name
variable "BFC_DEV_SERVICE-NAME" {
  type = string
  default = "BFC_DEV_service-RG"
}
# resource_group_location
variable "BFC_DEV_SERVICE-LOCATION" {
  type = string
  default =  "UK South"
}

# Virtual Network, Subnets 
## Virtual Network
variable "bfc_vnet_name" {
  description = "BFC Virtual Network name"
  type = string
  default = "bfc-vnet"
}
variable "bfc_vnet_address_space" {
  description = "BFC Virtual Network address_space"
  type = list(string)
  default = ["10.0.0.0/16"]
}


# Firewall Subnet Name
variable "bfc_fw_subnet_name" {
  description = "BFC firewall Subnet Name"
  type = string
  default = "AzureFirewallSubnet"
}
# Firewall Subnet Address Space
variable "bfc_fw_subnet_address" {
  description = "BFC fw Subnet Address Spaces"
  type = list(string)
  default = ["10.0.1.0/24"]
}


# Load Balncer Subnet Name

# BFC bl Subnet Name
variable "bfc_bl_subnet_name" {
  description = "BFC bl Subnet Name"
  type = string
  default = "bfc_bl_subnet"
}
# BFC app  Subnet Address Space
variable "bfc_bl_subnet_address" {
  description = "BFC bl Subnet Address Spaces"
  type = list(string)
  default = ["10.0.10.0/24"]
}
# BFC Broker Subnet Name
variable "bfc_bkr_subnet_name" {
  description = "BFC Broker Subnet Name"
  type = string
  default = "bfc_broker_subnet"
}
# BFC Broker  Subnet Address Space
variable "bfc_bkr_subnet_address" {
  description = "BFC Broker subnet Address Spaces"
  type = list(string)
  default = ["10.0.3.0/24"]
}

# BFC app Subnet Name
variable "bfc_app_subnet_name" {
  description = "BFC app Subnet Name"
  type = string
  default = "bfc_app_subnet"
}
# BFC app  Subnet Address Space
variable "bfc_app_subnet_address" {
  description = "BFC App Subnet Address Spaces"
  type = list(string)
  default = ["10.0.4.0/24"]
}
# Database Subnet Name
variable "bfc_db_subnet_name" {
  description = "BFC Database Subnet Name"
  type = string
  default = "bfc_dbsubnet"
}
# Database Subnet Address Space
variable "db_subnet_address" {
  description = "Virtual Network Database Subnet Address Spaces"
  type = list(string)
  default = ["10.0.5.0/24"]
}

# BFC DEV SHared Rresource Subnet Name
variable "bfc_dev_admin_subnet_name" {
  description = "BFC admin Subnet Name"
  type = string
  default = "bfc_admin_subnet"
}
# BFC DEV SHared  Subnet Address Space
variable "bfc_dev_admin_subnet_address_space" {
  description = "BFC admin Address Spaces"
  type = list(string)
  default = ["10.0.6.0/24"]
}
# BFC DEV Service Rresource Subnet Name
variable "bfc_dev_service_subnet_name" {
  description = "BFC service Subnet Name"
  type = string
  default = "bfc_service_subnet"
}
# BFC DEV Service  Subnet Address Space
variable "bfc_dev_service_subnet_address_space" {
  description = "BFC service Address Spaces"
  type = list(string)
  default = ["10.0.7.0/24"]
}

variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
  default     = 1  # Change this to the desired number of VMs
}

# Define variables for SQL Database
variable "bfc_sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
  default = "bfcdevsqlserver"
}

variable "bfc_sql_database_name" {
  description = "Name of the SQL Database"
  type        = string
  default = "bfcdevDb"
}
# Define variables for Storage Account
variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default = "bfcdevstrg00002"
}
# Define variables for Key Vault
variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
  default = "bfcdevkeyvlt01"
}
variable "object_id_to_grant_access" {
  type        = string
  description = "Object ID of the Azure AD user, group, or service principal"
  default = "0a262703-f33c-4cfd-9c32-9a2dcbb5ceb2"
}

variable "vm_password" {
  description = "Password for the Windows VM"
  type        = string
  default     = "Password12345!"  # You can set a default value or provide it when running Terraform.
}

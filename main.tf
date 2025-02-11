# Provides config details for Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.18.0"
    }
  }
}

# Provides config details for azure terraform provider
provider "azurerm" {
  features {}
}

# Provides resource group to logically contain resources
resource "azurerm_resource_group" "rg" {
  name     = "kai-assessment-group"
  location = "westus"
  tags = {
    environment = "dev"
    source      = "Terraform"
  }
}

# Creates a virtual network as well as public and private subnets
module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = "${random_pet.prefix.id}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

}

# Creates Azure Kubernetes Service
module "aks" {
  source              = "./modules/aks"
  aks_name            = "${random_pet.prefix.id}-aks"
  dns_prefix          = "aksdns"
  node_count          = "1"
  vm_size             = "Standard_DS2_v2"
  subnet_id           = module.vnet.subnet_id
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  service_cidr        = "10.1.0.0/16"
  dns_service_ip      = "10.1.0.10"
}

# Creates a database in Azure
module "database" {
  source                = "./modules/database"
  db_name               = "${random_pet.prefix.id}-db"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  admin_username        = "adminuser"
  admin_password        = "StrongP@ssw0rd!"
  sku_name              = "GP_Standard_D2s_v3"
  storage_mb            = 32768
  backup_retention_days = 14
}

# Creates a storage in Azure
module "storage" {
  source               = "./modules/storage"
  storage_account_name = "myassessmentstorage"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = var.location
}

# Random name generation
resource "random_pet" "prefix" {
  prefix = var.resource_group_name_prefix
  length = 1
}
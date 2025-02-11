variable "db_name" {
  type = string
  description = "Database name"
}
variable "location" {
  type = string
  description = "Location of the service creation"
}
variable "resource_group_name" {
  type = string
  description = "Resource group name"
}
variable "admin_username" {
  type = string
  description = "Admin username"
}
variable "admin_password" {
  type = string
  description = "Admin password"
}
variable "sku_name" {
  type = string
  description = "Pricing tier for the database service"
}
variable "storage_mb" {
  type = string
  description = "Storage in MB allocated to the database service"
}
variable "backup_retention_days" {
  type = string
  description = "Number days to retain the database backup data"
}
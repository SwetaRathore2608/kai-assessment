variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}
variable "location" {
  type        = string
  default     = "westus"
  description = "Region of resource creation"
}

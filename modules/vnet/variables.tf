variable "vnet_name" {
  type        = string
  description = "Name of the virtual network."
}
variable "location" {
  type        = string
  description = "Region in which we are creating the virtual network."
}
variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}
variable "address_space" {
  type        = list(string)
  description = "The address space for the virtual network."
}
variable "aks_name" {
  type = string
  description = "Name of the Kubernetes Cluster"
}
variable "location" {
  type = string
  description = "Name of the region to create the AKS cluster"
}
variable "resource_group_name" {
  type = string
  description = "Resource group name"
}
variable "dns_prefix" {
  type = string
  description = "DNS Prefix"
}
variable "node_count" {
  type = string
  description = "Count of the nodes in AKS"
}
variable "vm_size" {
  type = string
  description = "Type and size of the VM to be used"
}
variable "subnet_id" {
  type = string
  description = "Subnet ID"
}
variable "service_cidr" {
  type = string
  description = "CIDR range"
}
variable "dns_service_ip" {
  type = string
  description = "IP address for the service"
}
variable "resource_group_name" {
  type        = string
  description = "rg name in azure"

}

variable "location" {
  type        = string
  description = "resource location in azure"

}
variable "cluster_name" {
  type        = string
  description = "aks cluster name"

}

variable "kubernetes_version" {
  type        = string
  description = "Kube version to used "

}
variable "system_node_count" {

}
variable "acr_name" {
  type        = string
  description = "ACR name"

}
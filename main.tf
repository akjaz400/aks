resource "azurerm_resource_group" "akj-rg" {
  name     = var.resource_group_name
  location = var.location

}
resource "azurerm_role_assignment" "akj-role_acrpull" {
  scope                            = azurerm_container_registry.akj-acr.id
  role_definition_name             = "Acrpull"
  principal_id                     = azurerm_kubernetes_cluster.akj-aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true

}
resource "azurerm_container_registry" "akj-acr" {
  name                = var.acr_name
  location            = var.location
  resource_group_name = azurerm_resource_group.akj-rg.name
  sku                 = "Standard"
  admin_enabled       = false


}
resource "azurerm_kubernetes_cluster" "akj-aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.cluster_name



  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count
    vm_size             = "Standard_B2s"
    type                = "VirtualMachineScaleSets"
    zones               = [1]
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
  }

}
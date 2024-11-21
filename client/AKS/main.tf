provider "azurerm" {
  subscription_id = "74ec7602-ef77-4350-81e9-6673c7022a2c"
  tenant_id = "6502c7c7-2906-4fab-a94c-6ae8504f48b4"
  use_azure_cli = true
  features {}
  
}

# Variables 
variable "resource_group_name" {
  default = "aks-rg"
}

variable "location" {
  default = "East US"
}

variable "aks_cluster_name" {
  default = "myAKSCluster"
}

variable "node_pool_name" {
  default = "nodepool1"
}

variable "node_count" {
  default = 1
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.aks_cluster_name}-dns"

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}

# Output the AKS cluster's Kubernetes config
output "kubeconfig" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

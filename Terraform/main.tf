resource "azurerm_resource_group" "rg_block" {
  name     = var.resource_group
  location = var.rg_location
}

resource "azurerm_kubernetes_cluster" "aks_block" {
  depends_on = [azurerm_resource_group.rg_block]
  name                = "deployment-aks1"
  location            = var.resource_group
  resource_group_name = var.rg_location
  dns_prefix          = "deployment-aks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

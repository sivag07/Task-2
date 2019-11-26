provider "azurerm" {

}

resource "azurerm_resource_group" "main" {
  name     = "demo-rg"
  location = "westus2"
}

resource "azurerm_virtual_network" "main" {
  name                = "myvnet1"
  address_space       = ["10.0.0.0/24"]
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
}

resource "azurerm_subnet" "main" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "${azurerm_resource_group.main.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "10.0.1.0/16"
}

resource "azurerm_public_ip" "main" {
  name                = "pubip1"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "main" {
  name                = "bastion"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = "${azurerm_subnet.main.id}"
    public_ip_address_id = "${azurerm_public_ip.main.id}"
  }
}

resource "azurerm_resource_group" "resource_groups" {
  #ts:skip=accurics.azure.NS.272 The policy doesnt support for_each
  for_each = { for rg in var.resource_groups : rg.name => rg }
  name     = each.key
  location = each.value["location"]
  tags     = each.value["tags"]
}

resource "azurerm_management_lock" "resource_groups" {
  for_each   = { for rg in var.resource_groups : rg.name => rg }
  name       = "${each.key}-CanNotDelete"
  scope      = azurerm_resource_group.resource_groups[(each.key)].id
  lock_level = "CanNotDelete"
  notes      = "Managed by Terraform"
}

output "resource_group_id" {
  value       = { for k, v in azurerm_resource_group.resource_groups : k => v.id }
  description = "Resource ID of Resource Groups"
}

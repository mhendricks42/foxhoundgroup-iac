output "workspace_id" {
  description = "The ID of the Azure Sentinel workspace."
  value       = module.sentinel.workspace_id
}

output "sas_token" {
  description = "The SAS token for the Azure Sentinel workspace."
  value       = module.sentinel.sas_token
}


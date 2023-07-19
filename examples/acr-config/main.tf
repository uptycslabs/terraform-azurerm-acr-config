module "acr-config" {
  source            = "uptycslabs/acr-config/azurerm"

  uptycs_app_client_id = "Copy/Paste From the Uptycs UI"

  # Note that the following resource name is optional. You may specify this to
  # customize the name of the generated azurerm_role_definition.
  resource_name = "AnExampleName"
}

output "tenant_id" {
    value = module.acr-config.tenant_id
}
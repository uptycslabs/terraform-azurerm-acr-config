# terraform-azurem-acr-config

This module creates the necessary Azure resources to grant uptycs access to Azure Container Registries for registry monitoring. Access is setup with federated service principals.

This terraform module will create the following resources:

- Service principal

In addition to these resources, the newly created service principal will have the following permissions granted to it:
- Microsoft.ContainerRegistry/registries/read
- Microsoft.ContainerRegistry/registries/pull/read

And will be granted the following roles:
- Reader
- AcrPull

## Prerequisites

Ensure you have the following privileges before you execute the Terraform Script:
* Owner
* Contributor
* Reader
* User Access Administrator

## Authentication

To authenticate Azure tenant, use the following command:

```
$ az login --tenant "tenant id"
```

## Terraform Script

To execute the Terraform script:

1. **Prepare .tf file**

Create a `main.tf` file in a new folder. Copy and paste the following configuration and modify as required:

```hcl
module "acr-config" {
    source            = "uptycslabs/acr-config/azurerm"
    # Note that the following resource name is optional. You may specify this to
    # customize the name of the generated azurerm_role_definition.
  
    resource_name     = "uptycs_custom_role"
    uptycs_app_client_id = "Copy/Paste From the Uptycs UI"
} 

output "tenant_id" {
    value = module.acr-config.tenant_id
}
```

2. **Init, Plan and Apply**

**Inputs**

| Name                 | Description                                              | Type     | Default     |
| ---------------------| -------------------------------------------------------- | -------- | ----------- |
| uptycs_app_client_id | The Client ID of Uptycs multi-tenant app                 | `string` |             |
| resource_name        | A unique prefix for the resources created by this module | `string` | "uptycs_custom_role" |     

### Outputs

| Name     | Description |
| -------- | ----------- |
| tenant_id | Tenant ID   |

> [!NOTE]
> If you're using version >= 0.1.3 of this module, you'll have to set the ARM_SUBSCRIPTION_ID environment variable.

```
$ export ARM_SUBSCRIPTION_ID=00000000-0000-0000-0000-000000000000 # Only needed when using version >= 0.1.3 of this module, replace null uuid with actual subscription id
$ terraform init --upgrade
$ terraform plan  # Please verify before applying
$ terraform apply
# Wait until successfully completed
```

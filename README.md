# terraform-azurem-acr-config

This module creates the necessary Azure resources to grant uptycs access to Azure Container Registries for registry monitoring. Access is setup with federated service principals.

This terraform module will create the following resources:

- Service principal

In addition to these resources, the newly created service principal will have the following permissions granted to it:
- Microsoft.ContainerRegistry/registries/pull/read

## Prerequisites

Ensure you have the following privileges before you execute the Terraform Script:
* Administrative roles:
  * Global administrator

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

    uptycs_app_client_id = "Copy/Paste From the Uptycs UI"
} 

output "tenant_id" {
    value = module.acr-config.tenantId
}
```

2. **Init, Plan and Apply**

**Inputs**

| Name                   | Description                              | Type     | Default           |
| ---------------------- | ---------------------------------------- | -------- | ----------------- |
| uptycs_app_client_id   | The Client ID of Uptycs multi-tenant app | `string` | Required          |

### Outputs

| Name     | Description |
| -------- | ----------- |
| tenantId | Tenant ID   |

```
$ terraform init --upgrade
$ terraform plan  # Please verify before applying
$ terraform apply
# Wait until successfully completed
```
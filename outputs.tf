/*
 * Copyright (c) 2023 Uptycs, Inc. All rights reserved
 */

output "tenant_id" {
    description = "Tenant ID associated with the service principal, please update this back in Uptycs' UI"
    value = data.azurerm_management_group.parent_management_group
}


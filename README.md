# terraform-azure-compute-staticwebapp

Org-standard Terraform wrapper for: **static web apps**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/<org>/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/<org>/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "compute-staticwebapp" {
  source = "git::https://github.com/<org>/terraform-azure-compute-staticwebapp.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  static_web_apps = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `static_web_apps` (static web apps)

Wraps [Azure/avm-res-web-staticsite/azurerm](https://registry.terraform.io/modules/Azure/avm-res-web-staticsite/azurerm/0.6.2) v0.6.2.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `all_child_resources_inherit_lock` | `bool` | no |  |
| `branch` | `string` | no |  |
| `configuration_file_changes_enabled` | `bool` | no |  |
| `basic_auth_enabled` | `bool` | no |  |
| `private_endpoints_manage_dns_zone_group` | `bool` | no |  |
| `role_assignments` | `any` | no |  |
| `sku_tier` | `string` | no |  |
| `all_child_resources_inherit_tags` | `bool` | no |  |
| `app_settings` | `map(string)` | no |  |
| `basic_auth` | `any` | no |  |
| `lock` | `any` | no |  |
| `managed_identities` | `any` | no |  |
| `private_endpoints_inherit_lock` | `bool` | no |  |
| `repository_url` | `string` | no |  |
| `custom_domains` | `any` | no |  |
| `preview_environments_enabled` | `bool` | no |  |
| `private_endpoints` | `any` | no |  |
| `public_network_access_enabled` | `bool` | no |  |
| `sku_size` | `string` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `static_web_apps` -- map (same keys as the input) of every output from each created static web apps.

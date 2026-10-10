variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "static_web_apps" {
  description = "Map of static web apps to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-web-staticsite/azurerm v0.6.2 (https://registry.terraform.io/modules/Azure/avm-res-web-staticsite/azurerm/0.6.2) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                    = string
    tags                                    = optional(map(string))
    enable_telemetry                        = optional(bool)
    all_child_resources_inherit_lock        = optional(bool, null)
    branch                                  = optional(string, null)
    configuration_file_changes_enabled      = optional(bool, null)
    basic_auth_enabled                      = optional(bool, null)
    private_endpoints_manage_dns_zone_group = optional(bool, null)
    role_assignments                        = optional(any, null)
    sku_tier                                = optional(string, null)
    all_child_resources_inherit_tags        = optional(bool, null)
    app_settings                            = optional(map(string), null)
    basic_auth                              = optional(any, null)
    lock                                    = optional(any, null)
    managed_identities                      = optional(any, null)
    private_endpoints_inherit_lock          = optional(bool, null)
    repository_url                          = optional(string, null)
    custom_domains                          = optional(any, null)
    preview_environments_enabled            = optional(bool, null)
    private_endpoints                       = optional(any, null)
    public_network_access_enabled           = optional(bool, null)
    sku_size                                = optional(string, null)
  }))
  default = {}
}

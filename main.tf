data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "static_web_app" {
  source   = "Azure/avm-res-web-staticsite/azurerm"
  version  = "0.6.2"
  for_each = var.static_web_apps

  name                                    = each.value.name
  location                                = var.location
  resource_group_name                     = var.resource_group_name
  tags                                    = coalesce(each.value.tags, var.tags)
  enable_telemetry                        = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  all_child_resources_inherit_lock        = each.value.all_child_resources_inherit_lock
  branch                                  = each.value.branch
  configuration_file_changes_enabled      = each.value.configuration_file_changes_enabled
  basic_auth_enabled                      = each.value.basic_auth_enabled
  private_endpoints_manage_dns_zone_group = each.value.private_endpoints_manage_dns_zone_group
  role_assignments                        = each.value.role_assignments
  sku_tier                                = each.value.sku_tier
  all_child_resources_inherit_tags        = each.value.all_child_resources_inherit_tags
  app_settings                            = each.value.app_settings
  basic_auth                              = each.value.basic_auth
  lock                                    = each.value.lock
  managed_identities                      = each.value.managed_identities
  private_endpoints_inherit_lock          = each.value.private_endpoints_inherit_lock
  repository_url                          = each.value.repository_url
  custom_domains                          = each.value.custom_domains
  preview_environments_enabled            = each.value.preview_environments_enabled
  private_endpoints                       = each.value.private_endpoints
  public_network_access_enabled           = each.value.public_network_access_enabled
  sku_size                                = each.value.sku_size
}

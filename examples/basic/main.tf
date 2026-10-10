terraform {
  required_version = ">= 1.7.0"
}

module "compute-staticwebapp" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  static_web_apps = {} # see README Inputs table / upstream module docs for the per-entry schema
}

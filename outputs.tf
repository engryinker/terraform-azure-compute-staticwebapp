output "static_web_apps" {
  description = "Map (same keys as var.static_web_apps) of every output from each static web apps created -- see upstream module docs for the full shape."
  value       = module.static_web_app
}

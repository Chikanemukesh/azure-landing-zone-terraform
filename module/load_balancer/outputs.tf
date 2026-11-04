output "load_balancers" {
  description = "Map of load balancers"
  value       = azurerm_lb.lb
}

output "lb_ids" {
  description = "Map of load balancer IDs"
  value       = { for k, v in azurerm_lb.lb : k => v.id }
}

output "backend_pool_ids" {
  description = "Map of backend address pool IDs"
  value       = { for k, v in azurerm_lb_backend_address_pool.backend_pool : k => v.id }
}

variable "log_analytics_workspaces" {
  description = "Map of Log Analytics Workspaces"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = optional(string, "PerGB2018")
    retention_in_days   = optional(number, 30)
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "application_insights" {
  description = "Map of Application Insights components"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    workspace_key       = string
    application_type    = optional(string, "web")
    tags                = optional(map(string), {})
  }))
  default = {}
}

variable "action_groups" {
  description = "Map of Monitor Action Groups"
  type = map(object({
    name                = string
    resource_group_name = string
    short_name          = string
    email_receiver_name = optional(string, "admin")
    email_address       = optional(string, "admin@contoso.com")
    tags                = optional(map(string), {})
  }))
  default = {}
}

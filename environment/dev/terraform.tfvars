# ==================================================
# 1. RESOURCE GROUPS
# Purpose: Azure resources ko logically organize karna.
# ==================================================

resource_groups = {
  hub = {
    name     = "rg-landingzone-hub"
    location = "centralindia"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }

  mgmt = {
    name     = "rg-landingzone-mgmt"
    location = "centralindia"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }

  network = {
    name     = "rg-landingzone-network"
    location = "centralindia"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }

  app = {
    name     = "rg-landingzone-app"
    location = "centralindia"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }

  data = {
    name     = "rg-landingzone-data"
    location = "centralindia"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }

  monitor = {
    name     = "rg-landingzone-monitor"
    location = "centralindia"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

# ==================================================
# 2. VIRTUAL NETWORKS
# Purpose: Azure mein private network create karna.
# ==================================================

virtual_networks = {
  vnet-mgmt = {
    name                = "vnet-landingzone-mgmt"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-mgmt"
  }

  vnet-network = {
    name                = "vnet-landingzone-network"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-network"
  }

  vnet-app = {
    name                = "vnet-landingzone-app"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-app"
  }

  vnet-data = {
    name                = "vnet-landingzone-data"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-data"
  }

  vnet-monitor = {
    name                = "vnet-landingzone-monitor"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-monitor"
  }
}

# ==================================================
# 3. SUBNETS
# Purpose: VNet ko smaller network segments mein divide karna.
# ==================================================

subnets = {
  subnet-mgmt = {
    name                 = "subnet-landingzone-mgmt"
    resource_group_name  = "rg-landingzone-mgmt"
    virtual_network_name = "vnet-landingzone-mgmt"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet-network = {
    name                 = "subnet-landingzone-network"
    resource_group_name  = "rg-landingzone-network"
    virtual_network_name = "vnet-landingzone-network"
    address_prefixes     = ["10.0.2.0/24"]
  }

  subnet-app = {
    name                 = "subnet-landingzone-app"
    resource_group_name  = "rg-landingzone-app"
    virtual_network_name = "vnet-landingzone-app"
    address_prefixes     = ["10.0.3.0/24"]
  }

  subnet-data = {
    name                 = "subnet-landingzone-data"
    resource_group_name  = "rg-landingzone-data"
    virtual_network_name = "vnet-landingzone-data"
    address_prefixes     = ["10.0.4.0/24"]
  }

  subnet-monitor = {
    name                 = "subnet-landingzone-monitor"
    resource_group_name  = "rg-landingzone-monitor"
    virtual_network_name = "vnet-landingzone-monitor"
    address_prefixes     = ["10.0.5.0/24"]
  }

  firewall-subnet = {
    name                 = "AzureFirewallSubnet"
    resource_group_name  = "rg-landingzone-network"
    virtual_network_name = "vnet-landingzone-network"
    address_prefixes     = ["10.0.6.0/26"]
  }

  appgw-subnet = {
    name                 = "subnet-landingzone-appgw"
    resource_group_name  = "rg-landingzone-network"
    virtual_network_name = "vnet-landingzone-network"
    address_prefixes     = ["10.0.7.0/24"]
  }
}

# ==================================================
# 4. NETWORK SECURITY GROUPS (NSG)
# Purpose: Inbound aur outbound network traffic control karna.
# ==================================================

network_security_groups = {
  app = {
    name                = "nsg-landingzone-app"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-app"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone-App"
      Owner       = "Mukesh"
    }
  }

  data = {
    name                = "nsg-landingzone-data"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-data"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone-Data"
      Owner       = "Mukesh"
    }
  }

  monitor = {
    name                = "nsg-landingzone-monitor"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-monitor"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone-Monitor"
      Owner       = "Mukesh"
    }
  }
}

# ==================================================
# 5. NSG SUBNET ASSOCIATION
# Purpose: NSG ko respective subnet ke saath attach karna.
# ==================================================

nsg_subnet_associations = {
  app = {
    nsg_name                = "nsg-landingzone-app"
    nsg_resource_group_name = "rg-landingzone-app"
    subnet_name             = "subnet-landingzone-app"
    resource_group_name     = "rg-landingzone-app"
    virtual_network_name    = "vnet-landingzone-app"
  }

  data = {
    nsg_name                = "nsg-landingzone-data"
    nsg_resource_group_name = "rg-landingzone-data"
    subnet_name             = "subnet-landingzone-data"
    resource_group_name     = "rg-landingzone-data"
    virtual_network_name    = "vnet-landingzone-data"
  }

  monitor = {
    nsg_name                = "nsg-landingzone-monitor"
    nsg_resource_group_name = "rg-landingzone-monitor"
    subnet_name             = "subnet-landingzone-monitor"
    resource_group_name     = "rg-landingzone-monitor"
    virtual_network_name    = "vnet-landingzone-monitor"
  }
}

# ==================================================
# 6. ROUTE TABLES
# Purpose: Custom network traffic routing configure karna.
# ==================================================

route_tables = {
  app = {
    name                = "rt-landingzone-app"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-app"

    route_name     = "route-app"
    address_prefix = "10.1.0.0/16"
    next_hop_type  = "VnetLocal"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }

  data = {
    name                = "rt-landingzone-data"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-data"

    route_name     = "route-data"
    address_prefix = "10.2.0.0/16"
    next_hop_type  = "VnetLocal"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

# ==================================================
# 7. VNET PEERING
# Purpose: Do VNets ke beech private connectivity establish karna.
# ==================================================

vnet_peerings = {
  mgmt-to-app = {
    name                        = "peer-mgmt-to-app"
    resource_group_name         = "rg-landingzone-mgmt"
    virtual_network_name        = "vnet-landingzone-mgmt"
    remote_virtual_network_name = "vnet-landingzone-app"
    remote_resource_group_name  = "rg-landingzone-app"

    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  app-to-mgmt = {
    name                        = "peer-app-to-mgmt"
    resource_group_name         = "rg-landingzone-app"
    virtual_network_name        = "vnet-landingzone-app"
    remote_virtual_network_name = "vnet-landingzone-mgmt"
    remote_resource_group_name  = "rg-landingzone-mgmt"

    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}

# ==================================================
# 8. FIREWALL
# ==================================================

firewalls = {
  firewall1 = {
    name                = "fw-landingzone"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-network"
    sku_tier            = "Standard"

    subnet_name          = "AzureFirewallSubnet"
    virtual_network_name = "vnet-landingzone-network"
    public_ip_name       = "pip-fw-landingzone"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

# ==================================================
# 9. BASTION HOST
# ==================================================

bastions = {
  bastion1 = {
    name                 = "bas-landingzone-dev"
    location             = "centralindia"
    resource_group_name  = "rg-landingzone-network"
    virtual_network_name = "vnet-landingzone-network"
    subnet_prefix        = "10.0.10.0/26"
    public_ip_name       = "pip-bastion-landingzone"
    sku                  = "Standard"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

# ==================================================
# 10. AZURE PUBLIC IP
# Purpose: Firewall, Bastion aur Application Gateway ke liye Public IP.
# ==================================================

public_ips = {
  firewall1 = {
    name                = "pip-fw-landingzone"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-network"

    allocation_method = "Static"
    sku               = "Standard"
    sku_tier          = "Regional"
    ip_version        = "IPv4"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }

  bastion1 = {
    name                = "pip-bastion-landingzone"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-network"

    allocation_method = "Static"
    sku               = "Standard"
    sku_tier          = "Regional"
    ip_version        = "IPv4"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }

  appgw1 = {
    name                = "pip-appgw-landingzone"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-network"

    allocation_method = "Static"
    sku               = "Standard"
    sku_tier          = "Regional"
    ip_version        = "IPv4"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

# ==================================================
# 11. STORAGE ACCOUNTS
# ==================================================

storage_accounts = {
  storage_account1 = {
    name                     = "stlzdata001"
    resource_group_name      = "rg-landingzone-data"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

# ==================================================
# 12. PRIVATE DNS ZONES & LINKS
# Purpose: Secure internal resolution for PaaS services.
# ==================================================

private_dns_zones = {
  blob_dns = {
    name                = "privatelink.blob.core.windows.net"
    resource_group_name = "rg-landingzone-network"
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }

  database_dns = {
    name                = "privatelink.database.windows.net"
    resource_group_name = "rg-landingzone-network"
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

private_dns_vnet_links = {
  blob_to_network = {
    name                 = "link-blob-to-network"
    private_dns_zone_key = "blob_dns"
    virtual_network_name = "vnet-landingzone-network"
    vnet_resource_group  = "rg-landingzone-network"
    registration_enabled = false
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }

  db_to_network = {
    name                 = "link-db-to-network"
    private_dns_zone_key = "database_dns"
    virtual_network_name = "vnet-landingzone-network"
    vnet_resource_group  = "rg-landingzone-network"
    registration_enabled = false
    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

# ==================================================
# 13. SQL DATABASE
# Purpose: Cost-effective Basic tier (5 DTU, 2GB max size).
# ==================================================

sql_servers = {
  sql_app = {
    name                          = "sql-lz-dev-centralindia-01"
    location                      = "centralindia"
    resource_group_name           = "rg-landingzone-data"
    admin_username                = "sqladminuser"
    admin_password                = "AzureSqlLandingZone@2026"
    public_network_access_enabled = false
    database_name                 = "sqldb-landingzone-app"
    database_sku                  = "Basic"
    max_size_gb                   = 2
    allow_azure_services          = false

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

# ==================================================
# 14. PRIVATE ENDPOINTS
# ==================================================

private_endpoints = {}

# ==================================================
# 15. VIRTUAL MACHINES
# Purpose: Cost-effective burstable Standard_B1s Linux VM.
# ==================================================

virtual_machines = {
  app_vm = {
    name                = "vm-lz-app-01"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-app"

    subnet_name              = "subnet-landingzone-app"
    virtual_network_name     = "vnet-landingzone-app"
    vnet_resource_group_name = "rg-landingzone-app"

    nic_name     = "vm-lz-app-01-nic"
    os_disk_name = "vm-lz-app-01-osdisk"

    size           = "Standard_B1s"
    admin_username = "azureadmin"
    admin_password = "AzureLandingZone@2026"

    os_disk_type    = "Standard_LRS"
    os_disk_size_gb = 30

    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

# ==================================================
# 16. LOAD BALANCERS
# Purpose: Internal Standard Load Balancer for app tier.
# ==================================================


load_balancers = {
  app_lb = {
    name                = "lb-landingzone-app"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-app"

    sku = "Standard"

    subnet_name              = "subnet-landingzone-app"
    virtual_network_name     = "vnet-landingzone-app"
    vnet_resource_group_name = "rg-landingzone-app"

    frontend_ip_name      = "app-frontend-ip"
    private_ip_allocation = "Dynamic"

    backend_pool_name = "app-backend-pool"

    probe_name     = "app-health-probe"
    probe_protocol = "Tcp"
    probe_port     = 80

    rule_name     = "app-lb-rule"
    protocol      = "Tcp"
    frontend_port = 80
    backend_port  = 80

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}



# ==================================================
# 17. APPLICATION GATEWAYS
# Purpose: Web Traffic Ingress with Standard_v2 (capacity: 1).
# ==================================================

application_gateways = {
  appgw = {
    name                = "appgw-landingzone-dev"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-network"

    sku_name = "Standard_v2"
    sku_tier = "Standard_v2"
    capacity = 1

    subnet_name              = "subnet-landingzone-appgw"
    virtual_network_name     = "vnet-landingzone-network"
    vnet_resource_group_name = "rg-landingzone-network"

    public_ip_name = "pip-appgw-landingzone"

    frontend_port = 80

    frontend_port_name         = "appgw-frontend-port"
    frontend_ip_name           = "appgw-frontend-ip"
    backend_pool_name          = "appgw-backend-pool"
    backend_http_settings_name = "appgw-backend-settings"
    http_listener_name         = "appgw-http-listener"
    routing_rule_name          = "appgw-routing-rule"
    priority                   = 100

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}
# ==================================================
# 18. MONITORING
# Purpose: Central Log Analytics Workspace & App Insights.
# ==================================================

log_analytics_workspaces = {
  monitor_law = {
    name                = "law-landingzone-monitor"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-monitor"
    sku                 = "PerGB2018"
    retention_in_days   = 30

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

application_insights = {
  app_insights = {
    name                = "appi-landingzone-dev"
    location            = "centralindia"
    resource_group_name = "rg-landingzone-monitor"
    workspace_key       = "monitor_law"
    application_type    = "web"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

action_groups = {
  ops_alerts = {
    name                = "ag-landingzone-alerts"
    resource_group_name = "rg-landingzone-monitor"
    short_name          = "lzalerts"
    email_receiver_name = "MukeshOps"
    email_address       = "mukesh.ops@landingzone.com"

    tags = {
      Environment = "Dev"
      Project     = "LandingZone"
      Owner       = "Mukesh"
    }
  }
}

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
# Purpose: Do VNets ke beech private connectivity establish .
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
firewalls = {
  firewall1 = {
    name                = "fw-landingzone"
    location            = "centralindia" 
    resource_group_name = "rg-landingzone-network"
    sku_name            = "AZFW_VNet"
    sku_tier            = "Standard"  
  }
}
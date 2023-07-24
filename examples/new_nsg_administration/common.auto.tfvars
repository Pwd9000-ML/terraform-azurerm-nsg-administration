#Resource Group to be created
resource_group_name     = "pwd9000-NSGs-admin-RG"

#NSGs to be created and set as lookups to apply rules configured in locals.tf
network_security_groups = ["pwd9000-app-subnet-nsg", "pwd9000-data-subnet-nsg", "pwd9000-container-subnet-nsg"]
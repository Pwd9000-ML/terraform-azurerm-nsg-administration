#Resource Group containing NSGs to be updated
nsg_resource_group_name = "pwd9000-NSGs-admin-RG"

#Selectively apply to only these NSGs in the master config (locals file).
nsg_identifiers = ["my_azure_nsg1", "my_azure_nsg3"] 
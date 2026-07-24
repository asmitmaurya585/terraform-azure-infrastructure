asmitrg = {
  rg1 = {
    name     = "rgamit"
    location = "central india"
  }
}

asmitstg = {
  stg1 = {
    stg_name                 = "asmitstorage"
    resource_group_name      = "rgamit"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    con_name                 = "asmitcon"
    container_access_type    = "private"
  }
}
region = "eu-west-1"
common_tags = {
  "Owner" = "pinkesh@test.com"
  "ApplicationID" = "APP1234567"
  "Environment" = "poc"
  "TerraformManaged" = "TRUE"
}

##### VPC #####
vpcs = {
  "pinkesh-poc-1" = {
    vpc_cidr = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
  }
}

vpc_tags = {}

##### INTERNET GATEWAY #####
internet_gateways = {
  "pinkesh-igw-1" = {
    vpc_name = "pinkesh-poc-1"
  }
}
igw_tags = {}

##### SUBNETS #####
subnets = {
  "pinkesh-subnet-poc-1" = {
    cidr = "10.0.1.0/24"
    az = "eu-west-1a"
    vpc_name = "pinkesh-poc-1"
  }
  "pinkesh-subnet-poc-2" = {
    cidr = "10.0.2.0/24"
    az = "eu-west-1b"
    map_public_ip_on_launch = true
    vpc_name = "pinkesh-poc-1"
  }
}
subnet_tags = {}

##### NAT GATEWAY #####
nat_gateways = {
  "pinkesh-nat-gateway-1" = {
    subnet = "pinkesh-subnet-poc-1"
  }
  "pinkesh-nat-gateway-2" = {
    subnet = "pinkesh-subnet-poc-2"
  }
}
nat_gateway_tags = {}

##### ROUTE TABLE #####
route_tables = {
  "pinkesh-route-table-1" = {
    subnet = "pinkesh-subnet-poc-1"
    vpc_name = "pinkesh-poc-1"
  }
  "pinkesh-route-table-2" = {
    subnet = "pinkesh-subnet-poc-2"
    vpc_name = "pinkesh-poc-1"
  }
}

routes = {
  "0" = {
    route_table_name = "pinkesh-route-table-1"
    cidr = "0.0.0.0/0"
    igw_name = "pinkesh-igw-1"
  }
  "1" = {
    route_table_name = "pinkesh-route-table-2"
    cidr = "0.0.0.0/0"
    nat_gw_name = "pinkesh-nat-gateway-2"
  }
}
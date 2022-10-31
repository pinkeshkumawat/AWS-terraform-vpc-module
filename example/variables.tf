variable "region" {
  description = "Region where resources will be deployed"
  type = string
  default = "eu-west-1"
}
variable "common_tags" {
  description = "Common tags that will be applied to all resources"
  type = map(string)
  default = {
    "Owner" = "abhishek.sharma@cloud.com"
    "ApplicationID" = "APP1234567"
    "Environment" = "poc"
    "TerraformManaged" = "TRUE"
  }
}

##### VPC #####
variable "vpcs" {
  description = "List of maps of VPCs"
  type = map(map(any))
  default = {}
}

variable "vpc_tags" {
  description = "Tags for VPC"
  type = map(string)
  default = {}
}

##### SUBNETS #####
variable "subnets" {
  description = "List of maps of subnet data"
  type = map(map(any))
  default = {}
}

variable "subnet_tags" {
  description = "Tags for subnets"
  type = map(string)
  default = {}
}

##### INTERNET GATEWAY #####
variable "internet_gateways" {
  description = "List of maps of IGWs"
  type = map(map(any))
  default = {}
}
variable "igw_tags" {
  description = "Tags for Internet Gateway"
  type = map(string)
  default = {}
}

##### NAT GATEWAY #####
variable "nat_gateways" {
  description = "List of maps of NAT Gateway data"
  type = map(map(any))
  default = {}
}
variable "nat_gateway_tags" {
  description = "Tags for NAT Gateway"
  type = map(string)
  default = {}
}

##### ROUTE TABLE #####
variable "route_tables" {
  description = "List of maps of Route tables data"
  type = map(map(any))
  default = {}
}

variable "route_table_tags" {
  description = "Tags for Route tables"
  type = map(string)
  default = {}
}

variable "routes" {
  description = "List of maps of routes"
  type = map(map(any))
  default = {}
}

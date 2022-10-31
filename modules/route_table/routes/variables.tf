variable "route_table_id" { 
  description = "ID of route table"
  type        = string
}
variable "destination_cidr_block" {
  description = "The destination CIDR block"
  type = string
}
variable "gateway_id" {
  description = "ID of a VPC internet gateway"
  type = string
  default = null
}
variable "nat_gateway_id" {
  description = "ID of a VPC NAT gateway"
  type = string
  default = null
}
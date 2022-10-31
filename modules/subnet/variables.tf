variable "cidr" { 
  description = "CIDR range for subnet"
  type    = string
}
variable "availability_zone" {
  description = "Availability zones for subnet" 
  type    = string
}
variable "vpc_id"  { 
  description = "ID of VPC" 
  type    = string 
}
variable "name" {
  description = "Name of subnet"
  type    = string
}
variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address"
  type = bool
  default = false
}
variable "tags" {
  description = "A map of tags to assign to the subnet"
  type = map(string)
  default = {}
}
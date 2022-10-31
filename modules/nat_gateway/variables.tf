variable "subnet_id" {
  description = "ID of subnet" 
  type    = string
}
variable "name" {
  description = "Name of NAT Gateway"
  type        = string
}
variable "tags" {
  description = "Tags to apply to NAT Gateway"
  type        = map(string)
  default = {}
}
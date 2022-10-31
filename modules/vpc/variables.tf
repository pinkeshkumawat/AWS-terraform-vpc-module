variable "cidr" { 
  description = "CIDR block for VPC"
  type        = string
}
variable "name" {
  description = "Name of VPC"
  type        = string
}
variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}
variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}
variable "tags" {
  description = "Tags to apply to VPC"
  type        = map(string)
  default = {}
}

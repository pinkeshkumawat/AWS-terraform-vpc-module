variable "name" { 
  description = "Name of route table"
  type        = string
}
variable "subnet_id" { 
  description = "ID of subnet"
  type        = string
}
variable "vpc_id"  { 
  description = "ID of VPC"
  type = string
}
variable "tags" {
  description = "Tags to apply to the route table"
  type        = map(string)
  default     = {}
}


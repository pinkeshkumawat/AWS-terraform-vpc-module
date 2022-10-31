variable "vpc_id" { 
  description = "Specify the vpc id"
  type = string 
}
variable "name" {
  description = "Name of Internet Gateway"
  type        = string
}
variable "tags" {
  description = "Tags to apply to Internet Gateway"
  type        = map(string)
  default = {}
}
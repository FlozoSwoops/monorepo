variable "cidr_block" {
  type        = string
  description = "vpc cidr block"
}

variable "public_subnets" {
  type        = list(string)
  description = "list of public subnets"
}

variable "private_subnets" {
  description = "list of private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "list of availability zones"
  type        = list(string)
}
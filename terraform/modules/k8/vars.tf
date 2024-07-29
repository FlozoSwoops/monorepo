variable "name" {
  type = string
  description = "name of assignment"
}

variable "env" {
  type = string
  description = "stage of sdlc dev, test, prod"
}

variable "subnet_ids" {
  type = list(string)
  description = "list of public subnets"
}

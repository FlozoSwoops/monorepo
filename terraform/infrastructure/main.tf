locals {
  name = "cyware-assessment"
  env = "dev"
}

module "vpc" {
  source            = "../modules/networking"
  cidr_block        = "10.0.0.0/16"
  public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets   = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "eks" {
  source          = "../modules/k8"
  name = local.name
  env = local.env
  subnet_ids = module.vpc.public_subnet_ids
  

}

# resource "aws_ebs_volume" "log_volume" {
#   availability_zone = "us-west-2a"
#   size              = 10
#   type              = "gp2"

#   tags = {
#     Name = "eks-log-volume"
#   }
# }
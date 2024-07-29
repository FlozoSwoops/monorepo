locals {
  name = "cyware-assessment"
  env = "dev"
}

#Create Networking Resources
module "vpc" {
  source            = "../modules/networking"
  cidr_block        = "10.0.0.0/16"
  public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets   = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
}


#Create Cluster and Managed Node Group
module "eks" {
  source          = "../modules/k8"
  name = local.name
  env = local.env
  subnet_ids = module.vpc.public_subnet_ids
  

}
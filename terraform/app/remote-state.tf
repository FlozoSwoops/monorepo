data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "flores-terraform-state"
    key    = "ifra.tfstate"
    region = "us-east-2"
  }
}
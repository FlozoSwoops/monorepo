terraform {
    backend "s3" {
      bucket = "flores-terraform-state"
      key = "ifra.tfstate"
      region = "us-east-2"
    }
}
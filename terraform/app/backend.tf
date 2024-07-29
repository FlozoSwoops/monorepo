terraform {
    backend "s3" {
      bucket = "flores-terraform-state"
      key = "app.tfstate"
      region = "us-east-2"
    }
}
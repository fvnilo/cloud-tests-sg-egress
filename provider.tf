terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket  = "rafanilo-tf-states"
    key     = "sg-egress.tfstate"
    region  = "ca-central-1"
    encrypt = true
  }
}
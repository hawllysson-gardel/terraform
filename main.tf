terraform {
  required_version = "~> 1.5.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.12.0"
    }
  }
}

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region                  = "sa-east-1"

  default_tags {
    tags = {
      owner      = "hawllysson"
      managed-by = "terraform"
    }
  }
}
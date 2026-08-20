terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket       = "project1a0826-terraform-state"
    key          = "terraform/project1.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

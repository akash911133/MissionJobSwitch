terraform {
  required_version = 1.8
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 5.7.0"
    }
  }
}

provider "aws" {
  region = var.AWS_REGION
}

// provider alias
provider "aws" {
    alias  = "use-1"
    region = "us-east-1"
}

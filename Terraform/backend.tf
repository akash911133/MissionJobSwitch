terraform {
  backend "s3" {
    bucket         = "mission-job-switch-terraform-tfstate"
    key            = "Terraform/eu-west-1/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "terraform-locks"
    # encrypt        = true
  }
}

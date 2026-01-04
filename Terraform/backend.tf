terraform {
  backend "s3" {
    bucket         = "mission-job-switch-terraform-tfstate"
    key            = "Terraform/${var.AWS_REGION}/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "terraform-locks"
    # encrypt        = true
  }
}

terraform {
  backend "s3" {
    bucket = "anjali-tf-state"                  # Your S3 bucket name
    key    = "terraform-project1/terraform.tfstate"  # Path inside the bucket
    region =        "us-east-1"    # Same as your aws_region variable
  }
}

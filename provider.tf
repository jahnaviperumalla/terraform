terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}

terraform {
  backend "s3" {
    bucket = "jahnavi-sample-bucket-for-tf-backend"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

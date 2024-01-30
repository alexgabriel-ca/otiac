terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}
provider "aws" {
  alias  = "central"
  region = "ca-central-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-1"
}
resource "aws_vpc" "central_vpc" {
  provider   = aws.central
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "OpenText Central VPC"
    Environment = var.environment
  }
}

resource "aws_vpc" "west_vpc" {
  provider   = aws.west
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "OpenText West VPC"
    Environment = var.environment
  }
}
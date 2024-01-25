resource "aws_subnet" "central_public_subnet" {
  provider          = aws.central
  vpc_id            = aws_vpc.central_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ca-central-1a"
  depends_on = [
    aws_vpc.central_vpc
  ]
  tags = {
    Name = "OpenText Central Public Subnet"
  }
}

resource "aws_subnet" "central_private_subnet" {
  provider          = aws.central
  vpc_id            = aws_vpc.central_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ca-central-1a"
  depends_on = [
    aws_vpc.central_vpc
  ]
  tags = {
    Name = "OpenText Central Private Subnet"
  }
}

resource "aws_subnet" "west_public_subnet" {
  provider          = aws.west
  vpc_id            = aws_vpc.west_vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-west-1b"
  depends_on = [
    aws_vpc.west_vpc
  ]
  tags = {
    Name = "OpenText West Public Subnet"
  }
}

resource "aws_subnet" "west_private_subnet" {
  provider   = aws.west
  vpc_id     = aws_vpc.west_vpc.id
  cidr_block = "10.1.2.0/24"
  # availability_zone = "us-west-1b"
  depends_on = [
    aws_vpc.west_vpc
  ]
  tags = {
    Name = "OpenText West Private Subnet"
  }
}
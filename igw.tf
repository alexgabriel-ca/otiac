resource "aws_internet_gateway" "central_ig" {
  provider = aws.central
  vpc_id   = aws_vpc.central_vpc.id

  depends_on = [
    aws_subnet.central_public_subnet
  ]
  tags = {
    Name = "OpenText Central Internet Gateway"
  }
}

resource "aws_internet_gateway" "west_ig" {
  provider = aws.west
  vpc_id   = aws_vpc.west_vpc.id
  depends_on = [
    aws_subnet.west_public_subnet
  ]
  tags = {
    Name = "OpenText West Internet Gateway"
  }
}
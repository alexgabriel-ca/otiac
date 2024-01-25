# Create public route table for web server instances

resource "aws_route_table" "central_public_rt" {
  provider = aws.central
  vpc_id   = aws_vpc.central_vpc.id
  depends_on = [
    aws_subnet.central_public_subnet
  ]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.central_ig.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.central_ig.id
  }

  tags = {
    Name = "OpenText Central Route Table"
  }
}

resource "aws_route_table_association" "central_public_1_rt_a" {
  provider       = aws.central
  subnet_id      = aws_subnet.central_public_subnet.id
  route_table_id = aws_route_table.central_public_rt.id
  depends_on = [
    aws_route_table.central_public_rt
  ]
}

resource "aws_route_table" "west_public_rt" {
  provider = aws.west
  vpc_id   = aws_vpc.west_vpc.id
  depends_on = [
    aws_subnet.west_public_subnet
  ]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.west_ig.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.west_ig.id
  }

  tags = {
    Name = "OpenText West Route Table"
  }
}

resource "aws_route_table_association" "west_public_1_rt_a" {
  provider       = aws.west
  subnet_id      = aws_subnet.west_public_subnet.id
  route_table_id = aws_route_table.west_public_rt.id
  depends_on = [
    aws_route_table.west_public_rt
  ]
}

# Create private route table for peering instances
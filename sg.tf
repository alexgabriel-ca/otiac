resource "aws_security_group" "central_web_sg" {
  provider = aws.central
  vpc_id   = aws_vpc.central_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "OpenText Central HTTP"
    Environment = var.environment
  }
}

resource "aws_security_group" "central_private_sg" {
  provider = aws.central
  vpc_id   = aws_vpc.central_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      "${aws_security_group.central_web_sg.id}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "OpenText Central Private SG"
    Environment = var.environment
  }
}

resource "aws_security_group" "west_web_sg" {
  provider = aws.west
  vpc_id   = aws_vpc.west_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "OpenText West HTTP"
    Environment = var.environment
  }
}

resource "aws_security_group" "west_private_sg" {
  provider = aws.west
  vpc_id   = aws_vpc.west_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      "${aws_security_group.west_web_sg.id}",
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "OpenText West Private SG"
    Environment = var.environment
  }
}
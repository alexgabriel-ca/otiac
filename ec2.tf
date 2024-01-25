resource "aws_instance" "central_web_instance" {
  provider                    = aws.central
  ami                         = "ami-0c00c714c7f84b49d"
  instance_type               = "t2.micro"
  count                       = 1
  subnet_id                   = aws_subnet.central_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.central_web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash -ex
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
  EOF

  tags = {
    Name = "OpenText Central Apache-${count.index + 1}"
  }

}

resource "aws_instance" "central_private_instance" {
  provider      = aws.central
  ami           = "ami-0c00c714c7f84b49d"
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.central_private_subnet.id
  vpc_security_group_ids      = [aws_security_group.central_private_sg.id]
  associate_public_ip_address = false

  tags = {
    Name = "OpenText Central Private Instance"
  }

}

resource "aws_instance" "west_web_instance" {
  provider                    = aws.west
  ami                         = "ami-0353faff0d421c70e"
  instance_type               = "t2.micro"
  count                       = 1
  subnet_id                   = aws_subnet.west_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.west_web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash -ex
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx
  EOF

  tags = {
    Name = "OpenText Central NGINX-${count.index + 1}"
  }

}

resource "aws_instance" "west_private_instance" {
  provider      = aws.west
  ami           = "ami-0353faff0d421c70e"
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.west_private_subnet.id
  vpc_security_group_ids      = [aws_security_group.west_private_sg.id]
  associate_public_ip_address = false

  tags = {
    Name = "OpenText Central Private Instance"
  }

}
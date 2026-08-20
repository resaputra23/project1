resource "aws_vpc" "testing0826" {
  cidr_block = var.vpc_cidr

  tags = {
    Name         = "testing project1"
    Environtment = "dev"
    Project      = "testing automation"
  }
}

resource "aws_subnet" "public_testing0826" {
  vpc_id                  = aws_vpc.testing0826.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-public-testing-automation"
  }

}

resource "aws_internet_gateway" "igw_testin0826" {
  vpc_id = aws_vpc.testing0826.id

  tags = {
    Name = "igw_testing0826"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.testing0826.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_testin0826.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_testing0826.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "security_group for web server"
  vpc_id      = aws_vpc.testing0826.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web-sg"
  }
}

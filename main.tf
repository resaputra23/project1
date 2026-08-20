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

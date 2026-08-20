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



output "vpc_id" {
  description = "ID dari VPC"
  value       = aws_vpc.testing0826.id
}

output "vpc_cidr" {
  description = "CIDR block VPC"
  value       = aws_vpc.testing0826.cidr_block
}

output "vpc_subnet_public_id" {
  description = "ID dari subnet public"
  value       = aws_subnet.public_testing0826.id
}

output "vpc_subnet_public_cidr" {
  description = ""
  value       = aws_subnet.public_testing0826.cidr_block
}

output "web_public_ip" {
  value = aws_instance.web.public_ip
}

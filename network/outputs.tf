output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_security_group" {
  value = aws_security_group.security_group["public"].id
}

output "public_subnet" {
  value = aws_subnet.public_subnet.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

resource "aws_nat_gateway" "platform_nat_a" {
  allocation_id = aws_eip.platform_nat_a.id

  subnet_id = aws_subnet.public_platform_a.id

  tags = {
    Name = "platform_nat_a"
  }
}

# resource "aws_nat_gateway" "platform_nat_b" {
#   allocation_id = aws_eip.platform_nat_b.id

#   subnet_id = aws_subnet.public_platform_b.id

#   tags = {
#     Name = "platform_nat_b"
#   }
# }
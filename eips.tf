resource "aws_eip" "platform_nat_a" {

  depends_on = [aws_internet_gateway.platform_internet_router]

  tags = {
    Name = "platform_nat_a"
  }

}

# resource "aws_eip" "platform_nat_b" {

#   depends_on = [aws_internet_gateway.platform_internet_router]

#   tags = {
#     Name = "platform_nat_b"
#   }

# }
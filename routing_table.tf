resource "aws_route_table" "public" {

  vpc_id = aws_vpc.platform.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.platform_internet_router.id

  }

  tags = {
    Name = "public"
  }

}

resource "aws_route_table" "private_a" {

  vpc_id = aws_vpc.platform.id

  route {

    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.platform_nat_a.id

  }

  tags = {
    Name = "private_a"
  }

}

# resource "aws_route_table" "private_b" {

#   vpc_id = aws_vpc.platform.id

#   route {

#     cidr_block = "0.0.0.0/0"

#     nat_gateway_id = aws_nat_gateway.platform_nat_b.id

#   }

#   tags = {
#     Name = "private_b"
#   }

# }

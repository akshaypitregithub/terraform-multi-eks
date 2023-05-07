resource "aws_route_table_association" "public_a" {
  subnet_id = aws_subnet.public_platform_a.id

  route_table_id = aws_route_table.public.id
}

# resource "aws_route_table_association" "public_b" {
#   subnet_id = aws_subnet.public_platform_b.id

#   route_table_id = aws_route_table.public.id
# }

resource "aws_route_table_association" "private_a" {
  subnet_id = aws_subnet.private_platform_a.id

  route_table_id = aws_route_table.private_a.id
}

# resource "aws_route_table_association" "private_b" {
#   subnet_id = aws_subnet.private_platform_b.id

#   route_table_id = aws_route_table.private_b.id
# }
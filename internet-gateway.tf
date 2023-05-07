resource "aws_internet_gateway" "platform_internet_router" {
  vpc_id = aws_vpc.platform.id

  tags = {
    Name = "platform_internet_router"
  }
}
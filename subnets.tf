resource "aws_subnet" "public_platform_a" {
  vpc_id = aws_vpc.platform.id

  cidr_block = "192.168.0.0/18"

  availability_zone = "ap-south-1a"

  map_public_ip_on_launch = true

  tags = {
    Name                             = "public_platform_a"
    "kubernetes.io/cluster/platform" = "shared"
    "kubernetes.io/role/elb"         = 1
  }
}


# resource "aws_subnet" "public_platform_b" {
#   vpc_id = aws_vpc.platform.id

#   cidr_block = "192.168.64.0/18"

#   availability_zone = "ap-south-1b"

#   map_public_ip_on_launch = true

#   tags = {
#     Name                             = "public_platform_b"
#     "kubernetes.io/cluster/platform" = "shared"
#     "kubernetes.io/role/elb"         = 1
#   }
# }

resource "aws_subnet" "private_platform_a" {
  vpc_id = aws_vpc.platform.id

  cidr_block = "192.168.128.0/18"

  availability_zone = "ap-south-1a"

  tags = {
    Name                              = "private_platform_a"
    "kubernetes.io/cluster/platform"  = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}


# resource "aws_subnet" "private_platform_b" {
#   vpc_id = aws_vpc.platform.id

#   cidr_block = "192.168.192.0/18"

#   availability_zone = "ap-south-1b"

#   tags = {
#     Name                              = "private_platform_b"
#     "kubernetes.io/cluster/platform"  = "shared"
#     "kubernetes.io/role/internal-elb" = 1
#   }
# }



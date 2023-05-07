resource "aws_vpc" "platform" {
  cidr_block = "192.168.0.0/16"

  instance_tenancy = "default"

  enable_dns_hostnames = true

  enable_dns_support = true

  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "platform"
  }
}
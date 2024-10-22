resource "aws_vpc" "cwhipple-vpc" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "cwhipple-vpc"
  }

  tags_all = {
    Name = "cwhipple-vpc"
  }
}

resource "aws_vpc" "default-vpc" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "172.31.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "default-vpc"
  }

  tags_all = {
    Name = "default-vpc"
  }
}

resource "aws_vpc" "test-vpc" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "test-vpc"
  }

  tags_all = {
    Name = "test-vpc"
  }
}

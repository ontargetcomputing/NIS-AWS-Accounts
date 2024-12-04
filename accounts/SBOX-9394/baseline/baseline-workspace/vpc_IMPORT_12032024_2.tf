resource "aws_vpc" "test-vpc" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"

  tags = {
    IMPORT_12032024_2 = "true"
    Name              = "test-vpc"
  }

  tags_all = {
    IMPORT_12032024_2 = "true"
    Name              = "test-vpc"
  }
}

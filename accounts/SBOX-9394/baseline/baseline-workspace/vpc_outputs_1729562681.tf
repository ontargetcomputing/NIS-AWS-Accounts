output "aws_vpc_cwhipple-vpc_id" {
  value = "${aws_vpc.cwhipple-vpc.id}"
}

output "aws_vpc_default-vpc_id" {
  value = "${aws_vpc.default-vpc.id}"
}

output "aws_vpc_test-vpc_id" {
  value = "${aws_vpc.test-vpc.id}"
}

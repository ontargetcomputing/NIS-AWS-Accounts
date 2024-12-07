output "fsx_whitelist_prefix_list_id" {
  description = "The ID of the created prefix list"
  value       = aws_ec2_managed_prefix_list.this.id
}

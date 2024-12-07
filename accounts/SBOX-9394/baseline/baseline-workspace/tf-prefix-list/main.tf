locals {
  context = "fsx-whitelisttest"
  name = "${var.env}-fsx-whitelisttest-prefix_list"
}

resource "aws_ec2_managed_prefix_list" "this" {
  name            = "${local.name}"
  address_family  = "IPv4"
  max_entries      = length(var.cidr_blocks)
  tags = {
    Name = "${local.name}"
  }
}

resource "aws_ec2_managed_prefix_list_entry" "this" {
  for_each = var.cidr_blocks

  prefix_list_id = aws_ec2_managed_prefix_list.this.id
  cidr           = each.key
  description    = each.value
}


resource "aws_ram_resource_share" "this" {
  name = "${local.name}_share"
  allow_external_principals = false
}

resource "aws_ram_resource_association" "this" {
  resource_share_arn = aws_ram_resource_share.this.arn
  resource_arn       = aws_ec2_managed_prefix_list.this.arn
}

resource "aws_ram_principal_association" "this" {
  for_each           = toset(var.principle_ou_arn_suffixes) 
  resource_share_arn = aws_ram_resource_share.this.arn
  principal          = "arn:aws:organizations::${var.management_account_id}:ou/${each.value}" 
}


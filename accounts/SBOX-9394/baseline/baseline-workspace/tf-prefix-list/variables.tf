variable "env" {}

variable "SourceControl" {}

variable "AWS_REGION" {
  default = "us-west-2"
}

variable "management_account_id" {
  description = "The id of the root/management AWS account"
  type        = string
}

variable "principle_ou_arn_suffixes" {
  description = "The ARNs are dynamically generated, assume to be ou in the format of arn:aws:organizations::1234567890:ou/{{suffix}},please provide the suffix portion"
  type        = list(string)
}

variable "cidr_blocks" {
  description = "A map of CIDR blocks to add to the prefix list, with descriptions"
  type        = map(string)
}


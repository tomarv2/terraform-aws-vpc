variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "profile_to_use" {
  description = "Getting values from ~/.aws/credentials"
  default     = "default"
  type        = string
}

variable "aws_region" {
  description = "aws region to deploy resources"
  default     = "us-west-2"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.4.0.0/16"
  type        = string
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix = random_string.naming.result
}

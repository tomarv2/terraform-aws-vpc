variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "profile_to_use" {
  description = "Getting values from ~/.aws/credentials"
  default = "default"
}

variable "aws_region" {
  default = "us-west-2"
}

variable "cidr_block" {
  default = "10.4.0.0/16"
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix = random_string.naming.result
}
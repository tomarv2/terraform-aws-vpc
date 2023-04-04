variable "cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.4.0.0/16"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

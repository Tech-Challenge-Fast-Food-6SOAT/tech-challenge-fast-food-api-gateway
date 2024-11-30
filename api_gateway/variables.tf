variable "role_arn" {
  type        = string
  description = "The ARN of the IAM Role"
}

variable "aws_vpc_name" {
  type    = string
  default = "lanchonete-vpc"
}

variable "aws_igw_name" {
  type    = string
  default = "lanchonete-igw"
}

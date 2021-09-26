variable "rds_sg_id" {
  type        = string
  description = "security group id to grant access"
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}
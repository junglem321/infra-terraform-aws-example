variable "rds_sg_id" {
  type        = string
  description = "security group id to grant access"
}

variable "username" {
  type = string
  description = "Username of the admin user"
}

variable "password" {
  type = string
  description = "Password of the admin user"
  
}

variable "private_subnets" {
  type = list(string)
  description = "list of subnets where the rds can be created privately"
}
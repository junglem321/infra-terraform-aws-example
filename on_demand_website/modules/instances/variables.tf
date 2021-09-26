variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "public_subnets" {
  type = list(string)
}

variable "ssh_ip_host" {
  default = "0.0.0.0/0"
}

variable "instance_sg_id" {
  type        = string
  description = "security group id to grant access"
}

variable "alb_sg_id" {
  type        = string
  description = "security group id to grant access"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "internal_lb" {
  type    = bool
  default = false
}

# ASG variables
variable "asg_name" {
  type    = string
  default = null
}

variable "max_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "desired_capacity" {
  type    = number
  default = 1
}

variable "public_key_name" {
  type = string
}

variable "app_port" {
  type = number
}

variable "vpc_id" {
  type = string
}

variable "template_file_path" {
  type = string
}

variable "target_dns" {
  type = string
}

variable "target_port" {
  type = number
}
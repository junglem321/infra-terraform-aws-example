variable "region" {
  default = "ca-central-1"
}

# ASG instance frontend
variable "asg_name_fe" {
  type    = string
  default = null
}

variable "max_size_fe" {
  type    = number
  default = 2
}

variable "min_size_fe" {
  type    = number
  default = 1
}

variable "desired_capacity_fe" {
  type    = number
  default = 1
}

# ASG instance backend
variable "asg_name_be" {
  type    = string
  default = null
}

variable "max_size_be" {
  type    = number
  default = 2
}

variable "min_size_be" {
  type    = number
  default = 1
}

variable "desired_capacity_be" {
  type    = number
  default = 1
}

variable "ssh_ip_host" {
  default = "0.0.0.0/0"
}

variable "app_port_fe" {
  type = number
}

variable "app_port_be" {
  type = number
}

variable "path_to_public_key" {
  default = "mykey.pub"
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}
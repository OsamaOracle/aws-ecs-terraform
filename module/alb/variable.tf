variable "vpc_id" {
  description = "VPC of cluster"
  type        = string
}

variable "subnets" {
  description = "A list of subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "health_check_path" {
  default = "/"
}

variable "app_port" {
  default     = "80"
  description = "portexposed on the docker image"
}

variable "alb_sg_id" {
  description = "alb security group id"
  type        = string
}

variable "aws_region" {
  description = "aws region where our resources going to create choose"
}

variable "name" {
  description = "Application name"
}
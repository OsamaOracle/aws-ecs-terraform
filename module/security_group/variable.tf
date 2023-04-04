variable "vpc_id" {
  description = "VPC of cluster"
  type        = string
}

variable "app_port" {
  default     = "80"
  description = "portexposed on the docker image"
}

variable "aws_region" {
  description = "aws region where our resources going to create choose"
}

variable "name" {
  description = "Application name"
}

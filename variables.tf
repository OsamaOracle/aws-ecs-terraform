variable "aws_region" {
  default     = "ap-south-1"
  description = "aws region where our resources going to create choose"
}

#variable "app_image" {
#  default     = "nginx:latest"
#  description = "docker image to run in this ECS cluster"
#}
#
#variable "app_port" {
#  default     = "80"
#  description = "portexposed on the docker image"
#}
#
#variable "app_count" {
#  default     = "2" #choose 2 bcz i have choosen 2 AZ
#  description = "numer of docker containers to run"
#}
#
#variable "health_check_path" {
#  default = "/"
#}
#
#variable "fargate_cpu" {
#  default     = "1024"
#  description = "fargate instacne CPU units to provision,my requirent 1 vcpu so gave 1024"
#}
#
#variable "fargate_memory" {
#  default     = "2048"
#  description = "Fargate instance memory to provision (in MiB) not MB"
#}

variable "vpc_id" {
  description = "VPC of cluster"
  type        = string
}

variable "subnets" {
  description = "A list of subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "cluster_name_prefix" {
  type        = string
  description = "Cluster name prefix"
  default     = "test-cluster"
}
variable "environment" {
  type    = string
  default = "dev"
}

variable "container_details" {
  type = map(object({
    name              = string
    app_port          = string
    app_image         = string
    app_count         = string
    fargate_cpu       = string
    fargate_memory    = string
    health_check_path = string
  }))
  default = null
}


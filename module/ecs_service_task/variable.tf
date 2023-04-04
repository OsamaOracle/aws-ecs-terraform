variable "vpc_id" {
  description = "VPC of cluster"
  type        = string
}

variable "app_port" {
  default     = "80"
  description = "portexposed on the docker image"
}

variable "app_image" {
  default     = "nginx:latest"
  description = "docker image to run in this ECS cluster"
}

variable "aws_region" {
  description = "aws region where our resources going to create choose"
}

variable "name" {
  type = string
  description = "Application name"
}

variable "app_count" {
  default     = "2" #choose 2 bcz i have choosen 2 AZ
  description = "numer of docker containers to run"
}

variable "fargate_cpu" {
  default     = "1024"
  description = "fargate instacne CPU units to provision,my requirent 1 vcpu so gave 1024"
}

variable "fargate_memory" {
  default     = "2048"
  description = "Fargate instance memory to provision (in MiB) not MB"
}

variable "execution_role_arn" {
  type = string
  description = "task execution role arn"
}

variable "cluster_name" {
  type = string
  description = "Cluster name"
}

variable "cluster_id" {
  type = string
  description = "Cluster ID"
}

variable "subnets" {
  description = "A list of subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "health_check_path" {
  default = "/"
}
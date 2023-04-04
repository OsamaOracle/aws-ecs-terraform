variable "aws_region" {
  description = "aws region where our resources going to create choose"
}

variable "cluster_name" {
  type = string
  description = "Cluster name"
}

variable "service_name" {
  type = string
  description = "service name"
}
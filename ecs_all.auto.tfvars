aws_region          = "ap-south-1"
#app_image           = "nginx:latest"
#app_port            = "80"
#app_count           = "2"
#health_check_path   = "/"
#fargate_cpu         = "1024"
#fargate_memory      = "2048"
vpc_id              = "vpc-0c0393c6a815cd8c7"
subnets             = ["subnet-01a9c8c6d46577ee9", "subnet-0171d01e7dabb8032", "subnet-05b57a75e34b246f9"]
cluster_name_prefix = "test-cluster"
environment         = "dev"
container_details = {
  nginx1 = {
    name              = "nginx1"
    app_image         = "nginx:latest"
    app_port          = "80"
    app_count         = "2"
    health_check_path = "/"
    fargate_cpu       = "1024"
    fargate_memory    = "2048"
  }
  nginx2 = {
    name              = "nginx2"
    app_image         = "nginx:latest"
    app_port          = "80"
    app_count         = "2"
    health_check_path = "/"
    fargate_cpu       = "1024"
    fargate_memory    = "2048"
  }
}
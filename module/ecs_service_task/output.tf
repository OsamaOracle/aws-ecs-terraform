output "ecs_service_name" {
  value = aws_ecs_service.service.name
}

output "alb_hostname" {
  value = module.alb.alb_hostname
}
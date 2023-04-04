# outputs you can kist required endpoints, ip or instanceid's

output "alb_hostname" {
  value = {
  for k, v in module.ecs_service : k => v.alb_hostname
  }
}

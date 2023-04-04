resource "aws_ecs_cluster" "this" {
  name = "${var.cluster_name_prefix}-${var.environment}"
}
locals {
  name = "test"
}

module "ecs_service" {
  for_each             = var.container_details
  source               = "./module/ecs_service_task"
  aws_region           = var.aws_region
  cluster_name         = aws_ecs_cluster.this.name
  cluster_id           = aws_ecs_cluster.this.id
  execution_role_arn   = aws_iam_role.ecs_task_execution_role.arn
  vpc_id               = var.vpc_id
  subnets              = var.subnets
  name                 = each.value.name
  app_port             = each.value.app_port
  app_image            = each.value.app_image
  app_count            = each.value.app_count
  fargate_cpu          = each.value.fargate_cpu
  fargate_memory       = each.value.fargate_memory
  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_role]


}








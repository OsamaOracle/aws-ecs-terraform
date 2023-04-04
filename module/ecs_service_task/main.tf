data "template_file" "testapp" {
  template = file("./module/ecs_service_task/templates/image/image.json")

  vars = {
    app_image      = var.app_image
    app_port       = var.app_port
    fargate_cpu    = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region     = var.aws_region
    app_name       = var.name
  }
}

resource "aws_ecs_task_definition" "task-def" {
  family                   = "${var.name}-task"
  execution_role_arn       = var.execution_role_arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.testapp.rendered
}

resource "aws_ecs_service" "service" {
  name            = "${var.name}-service"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.task-def.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [module.sg.ecs_sg_id]
    subnets          = var.subnets
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = module.alb.alb_target_group_arn
    container_name   = var.name
    container_port   = var.app_port
  }

  depends_on = [module.alb]
}

module "auto_scaling" {
  source       = "../auto_scaling"
  aws_region   = var.aws_region
  cluster_name = var.cluster_name
  service_name = aws_ecs_service.service.name
}

module "sg" {
  source     = "../security_group"
  aws_region = var.aws_region
  vpc_id     = var.vpc_id

  name     = var.name
  app_port = var.app_port
}

module "alb" {
  source     = "../alb"
  vpc_id     = var.vpc_id
  subnets    = var.subnets
  aws_region = var.aws_region

  name              = var.name
  health_check_path = var.health_check_path
  app_port          = var.app_port
  alb_sg_id         = module.sg.alb_sg_id
}

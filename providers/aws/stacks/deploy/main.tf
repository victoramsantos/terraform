provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "victoramsantos-ci-cd"
    key = "STACKS/DEPLOY/deploy.tfstate"
  }
}

module sg_22_8080 {
  source = "../../../../modules/aws/security_group"
  vpc_id = var.vpc_id
}

module launch_configuration {
  source = "../../../../modules/aws/launch_configuration"
  name_prefix = var.lc_name_prefix
  instance_type = var.instance_type
  key_name = var.key_name
  create_before_destroy = var.create_before_destroy
  security_groups = [module.sg_22_8080.sg_id]
}

module autoscaling_group {
  source = "../../../../modules/aws/autoscaling_group"
  launch_configuration_name = module.launch_configuration.lc_name
  max_size = var.max_size
  min_size = var.min_size
  name_prefix = var.ag_name_prefix
  vpc_zone_identifier = var.subnets
  target_group_arns = [module.target_group.tg_arn]
}

module target_group {
  source = "../../../../modules/aws/target_group"
  tg_port = var.tg_port
  tg_protocol = var.tg_protocol
  vpc_id = var.vpc_id
  hc_interval = var.hc_interval
  hc_path = var.hc_path
  hc_port = var.hc_port
  hc_status_code = var.hc_status_code
  hc_threshold = var.hc_threshold
  hc_timeout = var.hc_timeout
  hc_unhealthy_threshold = var.hc_unhealthy_threshold
}
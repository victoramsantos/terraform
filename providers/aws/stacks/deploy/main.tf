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

module launch_configuration {
  source = "../../../../modules/aws/launch_configuration"
  name_prefix = var.lc_name_prefix
  security_groups = var.security-groups
  instance_type = var.instance_type
  key_name = var.key_name
  create_before_destroy = var.create_before_destroy
}

module autoscaling_group {
  source = "../../../../modules/aws/autoscaling_group"
  launch_configuration_name = module.launch_configuration.lc_name
  max_size = var.max_size
  min_size = var.min_size
  name_prefix = var.ag_name_prefix
  vpc_zone_identifier = var.subnets
}

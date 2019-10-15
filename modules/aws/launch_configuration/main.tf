data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = [
      "hvm"]
  }

  owners = [
    "099720109477"]
  # Canonical
}

//resource "aws_launch_configuration" "default_lc" {
//  count = var.create_before_destroy ? 0 : 1
//  name_prefix = var.name_prefix
//  key_name = var.key_name
//  image_id = data.aws_ami.ubuntu.id
//  instance_type = var.instance_type
//  security_groups = var.security_groups
//}

resource "aws_launch_configuration" "lifecycle_lc" {
  name_prefix = var.name_prefix
  key_name = var.key_name
  image_id = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  security_groups = var.security_groups

  lifecycle {
    create_before_destroy = true
  }
}
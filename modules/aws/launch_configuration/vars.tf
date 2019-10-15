variable "name_prefix" {}
variable "security_groups" {}
variable "instance_type" {}
variable "key_name" {}
variable "create_before_destroy" {
  default = false
}

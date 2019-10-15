variable "region" {
  default = "us-east-1"
}

variable "lc_name_prefix" {
  default = "lc-victoramorim"
}

variable "security-groups" {
  default = ["sg-0f2e1b9d3f87300d3"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "victoramsantos"
}

variable "create_before_destroy" {
  default = true
}

variable "ag_name_prefix" {
  default = "ag-victoramorim"
}

variable "min_size" {
  default = "1"
}
variable "max_size" {
  default = "1"
}

variable "subnets" {
  default = ["subnet-0fb25764c222d2761"]
}
variable "region" {
  default = "us-east-1"
}

variable "lc_name_prefix" {
  default = "lc-victoramorim"
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
  default = ["subnet-0f35d3d2c8e518af0", "subnet-0af3e74d62aae3465"]
}

variable "vpc_id" {
  default = "vpc-05d6ac6dae8a916dc"
}

variable "tg_port" {
  default = 8080
}

variable "tg_protocol" {
  default = "HTTP"
}

variable "hc_path" {
  default = "/health"
}
variable "hc_port" {
  default = 8081
}
variable "hc_threshold" {
  default = 6
}
variable "hc_unhealthy_threshold" {
  default = 2
}
variable "hc_timeout" {
  default = 2
}
variable "hc_interval" {
  default = 5
}
variable "hc_status_code" {
  default = "200"
}

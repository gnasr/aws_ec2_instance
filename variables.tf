variable "name" {}

variable "environment" {}

variable "instance_type" {}

variable "ami" {}

variable "key_name" {}

variable "monitoring" {
  default = false
}

variable "security_groups" {
  default = []
}

variable "subnet_id" {
  type = "list"
}

variable "user_data" {
  type = "string"
}

variable "root_block_device_type" {
  default = "standard"
}

variable "root_block_device_volume_size" {
  default = "15"
}

variable "root_block_device_delete_on_termination" {
  default = true
}

variable "count" {
  default = 1
}

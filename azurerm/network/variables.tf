variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_address_prefixes" {
  type = list(string)
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = number
  default = 1
}

variable "vnet_id" {
  type = number
  default = 1
}

variable "prefix_name" {
  type = string
  default = ""
}

variable "location" {
  type = string
}

variable "vnet_tags" {
  type    = map(string)
  default = {}
}

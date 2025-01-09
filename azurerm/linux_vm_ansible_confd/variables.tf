
variable "prefix_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "admin_ssh_public_key_path" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "ansible_playbook_url" {
  type = string
}

variable "ansible_playbook_name" {
  type = string
}

variable "vm_id" {
  type    = number
  default = 1
}

variable "vm_domain_name_label" {
  type = string
}

variable "vm_tags" {
  type = map(string)

}

variable "vm_base_name" {
  type = string
}

variable vm_nsg_rules {
  type = list(object({
    name                       = string
    priority                   = number
    destination_port_range     = string 
    }))
}

variable "vm_user_data_template" {
  type = string
  default = ""
}

variable "vm_user_data_variables" {
  type = map(any)
  default = {
  }
}


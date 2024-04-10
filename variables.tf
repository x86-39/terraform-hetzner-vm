variable "enable_existing_ssh_keys" {
  description = "Enable existing SSH keys"
  type        = bool
  default     = true
  nullable = false
}

variable "new_ssh_keys" {
  description = "Map of new SSH keys to create"
  type        = map(string)
  default     = {}
  nullable = false
}

variable "name" {
  description = "Name of the server"
  type        = string
}

variable "domain" {
  type    = string
  default = null
  nullable = true
}

variable "type" {
  description = "Type of server to create"
  type        = string
  default     = "cx11"
  nullable = false
}

variable "image" {
  description = "OS image to use for the server"
  type        = string
  default     = "ubuntu-22.04"
  nullable = false
}

variable "datacenter" {
  description = "Datacenter for the server"
  type        = string
  default     = "nbg1-dc3"
  nullable = false
}

variable "labels" {
  description = "Labels to assign to the server"
  type        = map(string)
  default     = {}
  nullable = false
}

variable "ipv6_enabled" {
  description = "Enable IPv6 for the server"
  type        = bool
  default     = true
  nullable = false
}

variable "network_id" {
  description = "ID of the network to connect the server to"
  type        = number
  default     = null
  nullable = true
}

variable "network_ip" {
  description = "IP address within the network for the server"
  type        = string
  default     = null
  nullable = true
}

variable "network_ip_aliases" {
  description = "List of alias IP addresses within the network for the server"
  type        = list(string)
  default     = null
  nullable = true
}

variable "ansible_name" {
  type    = string
  default = ""
  nullable = false
}

variable "ansible_host" {
  type    = string
  default = ""
  nullable = false
}

variable "ansible_user" {
  type    = string
  default = "root"
  nullable = false
}

variable "ansible_ssh_pass" {
  type    = string
  default = ""
  nullable = false
}

variable "ansible_groups" {
  type = list(string)
  default = []
  nullable = false
}


variable "ansible_ssh_private_key_file" {
  type        = string
  description = "Defaults to null."
  default     = ""
  nullable = false
}

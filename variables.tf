variable "hcloud_token" {
  description = "API token for Hetzner Cloud"
  type        = string
}

variable "enable_existing_ssh_keys" {
  description = "Enable existing SSH keys"
  type        = bool
  default     = true
}

variable "new_ssh_keys" {
  description = "Map of new SSH keys to create"
  type        = map(string)
  default     = {}
}

variable "server_name" {
  description = "Name of the server"
  type        = string
}

variable "server_domain" {
  description = "Domain of the server"
  type        = string
  default     = ""
}

variable "server_type" {
  description = "Type of server to create"
  type        = string
  default     = "cx11"
}

variable "image" {
  description = "OS image to use for the server"
  type        = string
  default     = "ubuntu-20.04"
}

variable "datacenter" {
  description = "Datacenter for the server"
  type        = string
  default     = "nbg1-dc3"
}

variable "labels" {
  description = "Labels to assign to the server"
  type        = map(string)
  default     = {}
}

variable "ipv6_enabled" {
  description = "Enable IPv6 for the server"
  type        = bool
  default     = true
}

variable "network_id" {
  description = "ID of the network to connect the server to"
  type        = string
  default     = ""
}

variable "network_ip" {
  description = "IP address within the network for the server"
  type        = string
  default     = ""
}

variable "network_ip_aliases" {
  description = "List of alias IP addresses within the network for the server"
  type        = list(string)
  default     = []
}

variable "ansible_name" {
  type    = string
  default = ""
}

variable "ansible_host" {
  type    = string
  default = ""
}

variable "ansible_user" {
  type    = string
  default = "root"
  nullable = false
}

variable "ansible_ssh_pass" {
  type    = string
  default = ""
}

variable "ansible_groups" {
  type = list(string)
  default = [
    "hetzner",
  ]
  nullable = false
}


variable "ansible_ssh_private_key_file" {
  type        = string
  description = "Defaults to null."
  default     = ""
}

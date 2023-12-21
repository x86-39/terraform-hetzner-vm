terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "~> 1.44.0"
    }
    ansible = {
      version = "~> 1.0.0"
      source  = "ansible/ansible"
    }
  }
}

data "hcloud_ssh_keys" "existing_ssh_keys" {
  count = var.enable_existing_ssh_keys ? 1 : 0
}

resource "hcloud_ssh_key" "new_ssh_keys" {
  for_each   = var.new_ssh_keys
  # name       = each.key, 
  name = var.server_domain != null ? "${each.key}-${var.server_name}.${var.server_domain}" : "${each.key}-${var.server_name}"
  public_key = each.value
}

resource "hcloud_primary_ip" "primary_ipv4" {
  name          = "primary_ip_${var.server_name}"
  datacenter    = var.datacenter
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = true
  labels = var.labels
}

resource "hcloud_server" "server" {

  depends_on = [
    hcloud_primary_ip.primary_ipv4,
    data.hcloud_ssh_keys.existing_ssh_keys,
    hcloud_ssh_key.new_ssh_keys
  ]

  name        = var.server_domain != null ? "${var.server_name}.${var.server_domain}" : var.server_name
  server_type = var.server_type
  image       = var.image
  datacenter  = var.datacenter
  labels      = var.labels

  ssh_keys = concat(try(data.hcloud_ssh_keys.existing_ssh_keys[0].ssh_keys.*.name, []), [for k, v in var.new_ssh_keys : k])


  public_net {
    ipv4_enabled = true
    ipv6_enabled = var.ipv6_enabled
    ipv4 = hcloud_primary_ip.primary_ipv4.id
  }

  dynamic "network" {
    for_each = var.network_id != null ? [1] : []
    content {
      network_id = var.network_id
      ip         = var.network_ip
      alias_ips  = var.network_ip_aliases
    }
  }

}

resource "ansible_host" "default" {
  name   = coalesce(var.ansible_name, var.server_name)
  groups = var.ansible_groups

  variables = {
    ansible_host     = coalesce(var.ansible_host, hcloud_primary_ip.primary_ipv4.ip_address, var.server_name)
    ansible_user     = var.ansible_user
    ansible_ssh_pass = var.ansible_ssh_pass
    ansible_ssh_private_key_file = var.ansible_ssh_private_key_file
  }
}

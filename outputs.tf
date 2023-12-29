output "primary_ipv4_address" {
  value = hcloud_primary_ip.primary_ipv4.ip_address
}

output "server_name" {
  value = hcloud_server.server.name
}

output "server_domain" {
  value = var.server_domain
}

output "server_id" {
  value = hcloud_server.server.id
}

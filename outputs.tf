output "primary_ipv4_address" {
  value = hcloud_primary_ip.primary_ipv4.ip_address
}

output "name" {
  value = hcloud_server.server.name
}

output "domain" {
  value = var.domain
}

output "id" {
  value = hcloud_server.server.id
}

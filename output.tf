output "ipv4_address" {
  description = "The public IPv4 address of this digitalocean-droplet."
  value       = digitalocean_droplet.master.ipv4_address
}

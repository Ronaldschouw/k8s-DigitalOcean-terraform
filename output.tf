
output "hostname" {
  description = "The hostname applied to this digitalocean-droplet."
  value = digitalocean_droplet.master.name
}

output "price_monthly" {
  description = "The hostname applied to this digitalocean-droplet."
  value = digitalocean_droplet.master.price_monthly
}

output "region" {
  description = "The digitalocean region-slug this digitalocean-droplet is running in."
  value = digitalocean_droplet.master.region
}

output "droplet_id" {
  description = "The droplet_id of this digitalocean-droplet."
  value = digitalocean_droplet.master.id
}

output "ipv4_address" {
  description = "The public IPv4 address of this digitalocean-droplet."
  value = digitalocean_droplet.master.ipv4_address
}

output "ipv4_address_private" {
  description = "The private IPv4 address of this digitalocean-droplet."
  value = digitalocean_droplet.master.ipv4_address_private
}

#output "ipv4_address_loadbalancer" {
#  description = "The private IPv4 address loadbalancer."
#  value = digitalocean_droplet.master.ipv4_address_private
#  value = digitalocean_loadbalancer.public.ip
#}

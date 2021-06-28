data "template_file" "inventory" {
  #template = "${file("${path.module}/hosts.kubernetes")}"
  template = file("${path.module}/hosts.kubernetes")
  vars = {
    master_hostname  = digitalocean_droplet.master.ipv4_address
    worker1_hostname = digitalocean_droplet.worker1.ipv4_address
    worker2_hostname = digitalocean_droplet.worker2.ipv4_address
  }
}
resource "local_file" "inventory" {
  content  = data.template_file.inventory.rendered
  filename = "${path.module}/hosts"
}

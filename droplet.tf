resource "digitalocean_vpc" "lb_vpc" {
  name   = "kubernetes"
  region = "ams3"
}

resource "digitalocean_droplet" "master" {
  image              = "ubuntu-20-10-x64"
  name               = "master"
  region             = "ams3"
  vpc_uuid           = digitalocean_vpc.lb_vpc.id
  size               = "s-2vcpu-2gb"
  private_networking = true
  ssh_keys = [
    var.ssh_key_fingerprint
  ]
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
}
resource "digitalocean_droplet" "worker1" {
  image              = "ubuntu-20-10-x64"
  name               = "worker1"
  region             = "ams3"
  vpc_uuid           = digitalocean_vpc.lb_vpc.id
  size               = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    var.ssh_key_fingerprint
  ]
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
}
resource "digitalocean_droplet" "worker2" {
  image              = "ubuntu-20-10-x64"
  name               = "worker2"
  region             = "ams3"
  vpc_uuid           = digitalocean_vpc.lb_vpc.id
  size               = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    var.ssh_key_fingerprint
  ]
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
}

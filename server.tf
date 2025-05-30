resource "hcloud_server" "calibre_server" {
  name        = var.server_name
  image       = var.os_type
  server_type = var.server_type
  #  location    = var.location
  ssh_keys = [hcloud_ssh_key.main.id]
  labels = {
    type = "calibre"
  }
  firewall_ids = [hcloud_firewall.calibre_firewall.id]
  datacenter   = var.datacenter
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  #  user_data = file("user_data.yml")
}


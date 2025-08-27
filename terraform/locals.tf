locals {
  config = yamldecode(file("../config.yml"))

  server_details = {
    id          = openstack_compute_instance_v2.main.id
    name        = openstack_compute_instance_v2.main.name
    private_ip  = openstack_compute_instance_v2.main.access_ip_v4
    floating_ip = openstack_networking_floatingip_v2.main.address
    volume_id   = openstack_blockstorage_volume_v3.main.id
  }
}

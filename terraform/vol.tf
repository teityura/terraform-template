resource "openstack_blockstorage_volume_v3" "vol" {
  count = var.volume_config != null ? 1 : 0

  name = "${var.server_config.name}-data"
  size = var.volume_config.volume_size
}

resource "openstack_compute_volume_attach_v2" "vol" {
  count = var.volume_config != null ? 1 : 0

  instance_id = openstack_compute_instance_v2.main.id
  volume_id = openstack_blockstorage_volume_v3.vol[0].id
}

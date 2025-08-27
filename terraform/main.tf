terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {}

resource "openstack_blockstorage_volume_v3" "main" {
  name     = "${var.server_config.name}-root"
  size     = var.server_config.volume_size
  image_id = var.server_config.image_id
  enable_online_resize = true
}

resource "openstack_compute_instance_v2" "main" {
  name            = var.server_config.name
  flavor_id       = var.server_config.flavor_id
  key_pair        = var.server_config.key_pair
  security_groups = var.server_config.security_groups

  network {
    name = var.server_config.net_int
  }

  block_device {
    uuid                  = openstack_blockstorage_volume_v3.main.id
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
  }
}

resource "openstack_networking_floatingip_v2" "main" {
  pool  = var.server_config.net_ext
}

resource "openstack_compute_floatingip_associate_v2" "main" {
  floating_ip = openstack_networking_floatingip_v2.main.address
  instance_id = openstack_compute_instance_v2.main.id
}

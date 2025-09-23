terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {}

locals {
  config = yamldecode(file("../config.yml"))
}

module "ssh_config" {
  source = "git::https://github.com/teityura/terraform-modules.git//ssh-config"

  server_details = module.vm_openstack.server_details
  project_name = basename(abspath("${path.module}/.."))
  ssh_user = local.config.ssh_user
  ssh_key_path = local.config.ssh_key_path
}

module "vm_openstack" {
  source = "git::https://github.com/teityura/terraform-modules.git//vm-openstack"

  server_config = var.server_config
  volume_config = var.volume_config
}

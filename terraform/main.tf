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

module "ssh_config" {
  source = "git::https://github.com/teityura/terraform-modules.git//ssh-config"
  servers_detail = module.vm_openstack.servers_detail
  project_name = basename(abspath("${path.module}/../.."))
}

module "vm_openstack" {
  source = "git::https://github.com/teityura/terraform-modules.git//vm-openstack"
  servers_config = var.servers_config 
  volumes_config = var.volumes_config
}

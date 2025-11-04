output "ssh_config_path" {
  description = "SSH config file"
  value = module.ssh_config.filename
}

output "servers_detail" {
  description = "Details of the created servers."
  value = module.vm_openstack.servers_detail
}

output "volumes_detail" {
  description = "Details of the created data volumes."
  value = module.vm_openstack.volumes_detail
}

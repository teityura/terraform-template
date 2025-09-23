output "ssh_config_path" {
  description = "SSH config file"
  value = module.ssh_config.filename
}

output "server_details" {
  description = "Details of the created server."
  value = module.vm_openstack.server_details
}

output "volume_details" {
  description = "Details of the created data volume."
  value = module.vm_openstack.volume_details
}

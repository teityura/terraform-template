locals {
  project_name = basename(abspath("${path.module}/.."))
}

module "ssh_config" {
  source = "git::https://github.com/teityura/terraform-modules.git//ssh-config"

  server_details = local.server_details
  project_name   = local.project_name
  ssh_user = local.config.ssh_user
  ssh_key_path = local.config.ssh_key_path
}

output "ssh_config_path" {
  description = "SSH config file"
  value       = module.ssh_config.filename
}

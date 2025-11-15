# terraform-template

This repository is a collection of reusable Terraform and Ansible templates for OpenStack VM deployment.

## Usage

This template is designed to be used as a git submodule in your project.

``` bash
# Setup (change workspace and project_name as needed)
workspace="${HOME}/terra"
project_name="proj_name"

mkdir -p "${workspace}/${project_name}"
cd "${workspace}/${project_name}"
git init
git submodule add https://github.com/teityura/terraform-template.git template

# Deploy
cd template && make tfvars
vim terraform/terraform.tfvars
make

# Destroy
make clean
```

### Example Project Structure

``` log
~/terra/proj_name/
├── site.yml                # Your Ansible playbook
├── inventory/
│   ├── hosts               # Your Ansible inventory
│   ├── host_vars/
│   └── group_vars/
|       └── vms/
|           └── main.yml
├── template/               # This repository as submodule
│   ├── terraform/
│   └── ansible/
└── roles/                  # Your Ansible roles
```

## Optional Settings

``` log
cd ~/terra/proj_name/
bash template/setup.sh
ansible-playbook site.yml
```

## Update Submodule

``` bash
git submodule update --remote template
git add template && git commit -m "Update submodule"
```

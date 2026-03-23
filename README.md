# terraform-template

This repository is a collection of reusable Terraform and Ansible templates for OpenStack VM deployment.

## Usage

This template is designed to be used as a git submodule in your project.

``` bash
# Define variables
grp="<group_name>"
proj="<project_name>"
workspace="${HOME}/${grp}/${proj}"
repo="<repo_url>"

# Setup repository
mkdir -p "${workspace}"
cd "${workspace}/"
git init --initial-branch=main
git remote add origin "${repo}"
git submodule add https://github.com/teityura/terraform-template.git template
touch README.md
git add README.md
git commit -m 'Initial commit'
git push origin main

# Deploy
cd template && make tfvars
vim terraform/terraform.tfvars
make
./setup.sh

# Play
cd "${workspace}/"
ansible-playbook site.yml

# Destroy
cd template && make clean
```

### Example Project Structure

``` log
~/terra/proj_name/
├── .git/
├── .gitignore              # Excludes ansible.cfg
├── .gitmodules
├── ansible.cfg -> template/ansible/ansible.cfg  # Linked config
├── site.yml                # Main playbook
├── inventories/
│   ├── hosts               # Inventory definitions
│   ├── host_vars/
│   └── group_vars/
|       └── all/
|           └── main.yml
├── roles/                  # Ansible roles
│   └── sample/
|       └── tasks/
|           └── main.yml
└── template/               # Submodule (terraform-template)
    ├── terraform/
    └── ansible/
```

## Update Submodule

``` bash
git submodule update --remote template
git add template && git commit -m "Update submodule"
```

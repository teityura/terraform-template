# terraform-template

This repository is a collection of reusable Terraform and Ansible templates for OpenStack VM deployment.

## Usage

This template is designed to be used as a git submodule in your project.

### Example Project Structure

``` log
your-project/
├── Makefile            # See terraform-project for example
├── terraform.tfvars    # Your configuration
├── site.               # Your Ansible playbook
└── template/           # This repository as submodule
    ├── terraform/
    └── ansible/
```

See [terraform-project](https://github.com/teityura/terraform-project) for a complete example.


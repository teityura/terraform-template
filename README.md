# terraform-template

自宅OpenStack で VM をデプロイする際、  
Terraform + Ansible で IaC するためのテンプレート

## コピペ用

```
# clone
project_name="myproject"
mkdir -p ~/terra/
cd ~/terra/
git clone https://github.com/teityura/terraform-template.git "$project_name"
cd "${project_name}/"

# deploy
vim config.yml
vim terraform/terraform.tfvars 
make

# destroy
make cl
```

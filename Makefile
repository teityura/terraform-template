.PHONY: default deploy config init apply clean play

default: deploy
deploy: init apply play
cl: clean

init:
	terraform -chdir=terraform init

apply: init
	terraform -chdir=terraform apply -auto-approve

play:
	(cd ansible && ansible-playbook -v site.yml)

clean:
	terraform -chdir=terraform destroy -auto-approve
	rm -rf terraform/.terraform/
	rm -rf terraform/.terraform.lock.hcl
	rm -rf terraform/terraform.tfstate
	rm -rf terraform/terraform.tfstate.backup

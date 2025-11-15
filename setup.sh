#!/bin/bash

# Move to project root (template/..)
cd "$(dirname "$0")/.."

# copy sample playbook
test -f site.yml || cp template/ansible/sample.yml site.yml

# copy sample role
if [ ! -d roles/sample ]; then
  mkdir -p roles
  cp -r template/ansible/roles/sample roles/
fi

# copy inventory
if [ ! -d inventories ]; then
  mkdir -p inventories
  cp -r template/ansible/inventories/* inventories/
fi

# link ansible.cfg
ln -sf template/ansible/ansible.cfg ansible.cfg
test -f .gitignore || echo 'ansible.cfg' > .gitignore

exit 0

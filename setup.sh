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

# create secrets file
secrets=inventories/group_vars/all/secrets.yml
mkdir -p "$(dirname "$secrets")"
test -f "$secrets" || (umask 077 && echo '---' > "$secrets")

# keep ansible.cfg and secrets.yml out of git
for f in ansible.cfg secrets.yml; do
  grep -qxF "$f" .gitignore 2>/dev/null || echo "$f" >> .gitignore
done

# show summary
set -x
pwd
ls -al --color=always
{ set +x; } 2>/dev/null

exit 0

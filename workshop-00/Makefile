all:
	exit 1

vagrant:
	vagrant up

vault-edit:
	ansible-vault edit vault.yml --vault-password-file=.vault-pass

play:
	ansible-playbook -vv --diff -i inventory/vagrant/hosts.ini  -e @vault.yml --vault-password-file .vault-pass site.yml

test:
	for td in roles/* ; do cd $$td && make test ; done

workshop-prep:
	vagrant destroy || true
	vagrant up
	vagrant provision
	cd roles/myrole && make test

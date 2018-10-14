# Anisble Workshop - Lesson 1

TODO: Abstract

## Topics
TODO:

## home preparation

Because Ansible is unsupported to run from Windows boxes, and for the sake of unified environment during this workshop, we are going to use Vagrant and VirtualBox to create our testing environment.

### Tasks:
- get vagrant and virtualbox installed on your computer TODO - documentation link
- download your vagrant boxes in advance by running:
	```
	vagrant box add ubuntu/bionic64; vagrant box add geerlingguy/centos7
	```

## Workshop environment creation

### Info:
Here are basic vagrant controls:
```
vagrant up # start and provision VMs according to Vagrantfile
vagrant destroy # stop and delete VMs according to Vagrantfile
vagrant status # you can guess ...
vagrant ssh ubuntu # ssh into VM ubuntu using authentication preset by vagrant
```

### Tasks:
- create empty directory for this workshop
- download vagrantfile for this workshop into your working directory TODO - link
- start up your vagrant VMs defined in Vagrantfile
- check that you can SSH from your hypervisor into both of your VMs
- check that synced-folders are working

### Why?

For the sake of this workshop of course ;-)

Now we have:
- your physical machine, used only for web browsing and ping tests
- virtual machine `lesson-1_ubuntu` used to run ansible to control both VM
- virtual machine `lesson-1_centos` to be controlled by ansible
- new directories `data-centos` and `data-ubuntu` next to Vagrantfile mounted into your VMs in `/vagrant_data/`

## boring theory

Let's wait for `vagrant up` to finish

Remind yourself that:
- Ansible is using SSH connections for communication by default
- Ansible authentication is done as SSH authentication
- Ansible requires python
- Ansible uses terminology:
	- inventory - list of your computers and their "settings"
	- module - abstract function covering basic system task, providing diff/check/idempotency/exception handling
	- task - instance of module with parameters, loops, conditions
	- playbook - sequence of tasks in defined order
	- role - playbook converted into a library to provide high level function (like LAMP server installation, Apache VirtualHost installation, Drupal upgrade, ...)

## set up SSH for connections

### Tasks:

- set-up ssh-key authentication
	- `ssh-keygen` leave default answers in wizard
	- `cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys` copy public key to allow access to ubuntu VM
	- `ssh-copy-id 10.11.12.15` copy public key to allow access to centos VM

## ansible ad-hoc mode

### Tasks:
- cd into `/vagrant_data` on VM `lesson-1_ubuntu`
- verify that both your VM's are reachable by ansible with `ansible all --inventory "10.11.12.14,10.11.12.15" -m ping`
- use ansible ad-hoc mode to create unpriviledged system user `bob` with `/bin/bash` login shell, and generate ssh key for him on both VMs with one task
	- `ansible all --inventory "10.11.12.14,10.11.12.15" -m user -a 'name=bob shell=/bin/bash generate_ssh_key=yes'`

## write down previous task's configuration

"Write it down, so you don't have to remeber it, so you can commit it, so you can reuse it, so you can share it, so you can backup it, so you can test it."

### Tasks:

- create inventory file `hosts` in INI-style containing both VMs in group `vm` with some human-readable names, but don't drop info about tteir address
	```
	[vm]
	ubuntu ansible_host=10.11.12.14
	centos ansible_host=10.11.12.15
	```
- tell ansible about your hosts file by customizing default settings ...
	- `cp /etc/ansible/ansible.cfg ./`
	- ... to point to your inventory file
		```
		...
		[defaults]
		inventory = hosts
		...
		```
- create playbook with one task `bob_the_user.yml`, but add comment for him
	```
	---
	- hosts: all
	  tasks:
		- name: Create the user (or whatever comment you want)
		  user: name=bob shell=/bin/bash generate_ssh_key=yes comment="Bob the User"
	```
- feel free to use "expanded" form
	```
	---
	- hosts: all
	  tasks:
		- name: Create the user (or whatever comment you want)
		  user:
			name: bob
			shell: /bin/bash
			generate_ssh_key:yes
			comment: "Bob the User"
	```

- now you can achieve the same result as before by running `ansible-playbook bob_the_user.yml`
- also you can see that there were changes because of the change of user's comment

## 1st Snack-break

-------

expand your playbook to:
- rewrite your playbook to dynamic (just bash echo the same things)
- install nginx (conditions, OS dependency)
- install firewall (add pkg tag, to just go through installation steps)
- set nginx vhost and htpasswd (secrets, vault)
- enable nginx-vhost (handlers, idempotency)
- enable HTTP traffic (wait_for)
- create static website (jinja, variables, facts, lookups)
- add notification to monitoring/logging system on website change
- customize website to include ASn and IP (custom fact script and ipinfo.io)
- generate description of server properties (-m setup and dokuwiki-formatted jinja)


## End of workshop part
-------
## Best-practises show-off
- Ansible ARA
- ansible-cmdb
- molecule
- vagrant and ansible



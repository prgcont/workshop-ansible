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
- start up your vagrant VMs according to Vagrantfile

There will be:
- your physical machine, used only for web browsing and ping tests
- virtual machine lesson-1_ubuntu used to run ansible to control both VM
- virtual machine lesson-1_centos to be controlled by ansible 
- new directories `data-centos` and `data-ubuntu` next to Vagrantfile mounted into your VMs in `/vagrant_data/`

## boring theory during `vagrant up`

Mention:
- SSH connection
- authentication using PAM
- python requirements
- terminology intro (module, task, playbook, role)

## ansible ad-hoc mode

- First babystep, so use ansible ad-hoc mode, without any other files to:
- create new system user without comment

## write down previous task's configuration

- write it down, so you can remeber it, so you can commit it, so you can reuse it, so you can share it, so you can backup it, so you can test it

- create inventory file
- create playbook with one task
- create vars file (just generic vars file)

## expand your playbook

- 

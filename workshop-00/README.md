# using vagrant and molecule for testing ansible playbooks and roles

### run ansible against demo infra in vagrant

```
make vagrant
```

### run ansible directly to vagrant vm

```
make play
```

### run ansible tests on role with molecule

```
cd role/moleculized-testrole
#...hackityhack
make test
```

or run tests on all roles in roles dir
```
make test
```

### workshop preparation

```
make workshop-prep
```
... it creates vagrant vm, tries to provision it with included ansible playbook (proves vagrant is working, ssh inside vagrant is working) and tries to run molecule test to prove molecule is working on top of ansible / docker / vagrant

### preparation

install all the tools
  * this repo ;o)
  * vagrant https://www.vagrantup.com/downloads.html
  * molecule `pip install molecule`
  * docker and fetch docker image ``docker pull centos/7.5.1804``
enable docker and vagrant for your local user, so no additional sudo is required (important for running molecule)
```
sudo usermod -a -G vagrant,docker $USER
```

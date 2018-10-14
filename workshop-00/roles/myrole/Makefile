MOLECULE_DEBUG =
#MOLECULE_DEBUG = --debug

all:
	exit 1

test: test-docker test-vagrant

test-docker:
	molecule $(MOLECULE_DEBUG) test

test-vagrant:
	molecule $(MOLECULE_DEBUG) test -s vagrant

clean:
	-rm -rf /tmp/molecule/myrole/

#!/usr/bin/env bash
#
# Set up Ansible on a Vagrant Ubuntu Precise box, then run the development playbook.

if [ ! $(which ansible) ]; then
  sudo apt-get update && \
	sudo apt-get -y install python-software-properties && \
	sudo add-apt-repository -y ppa:rquillo/ansible && \
	sudo apt-get -y install ansible
fi

if [ ! $(which sshpass) ]; then
  sudo apt-get -y install sshpass
fi

PYTHONUNBUFFERED=1 ansible-playbook -i /vagrant/devops/development /vagrant/devops/playbooks/development.yml

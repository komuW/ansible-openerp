#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise32"

  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.network :forwarded_port, guest: 8069, host: 9000,
    auto_correct: true

  config.ssh.forward_agent = true

  # config.vm.boot_timeout = 1200
  
  # Share devops folder with guest VM. 
  config.vm.synced_folder './devops', '/vagrant/devops', 
      :mount_options => ['fmode=666']

  # Bootstrap provisioning with the shell. (Installs Ansible, then
  # invokes our configuration playbook).
  config.vm.provision :shell, :path => "devops/vagrant_bootstrap.sh"

end

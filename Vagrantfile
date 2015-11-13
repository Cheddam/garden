# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "debian/jessie64"

  # Avoids issues with Vagrant messing up its SSH key insertion
  config.ssh.insert_key = false

  # config.vm.network "forwarded_port", guest: 80, host: 5000
  config.vm.network "private_network", ip: "192.168.33.15"

  # Make sure synced folder permissions are usable
  config.vm.synced_folder "projects/", "/home/vagrant/projects", group: "www-data", mount_options: ["dmode=775,fmode=664"]

  # Installs Puppet on first run
  config.vm.provision "shell", path: "puppet/init.sh", run: "up"

  # Runs Puppet during every provision
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file = 'init.pp'
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

end

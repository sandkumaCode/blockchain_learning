# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.shell="bash"

  required_plugins = %w( vagrant-fsnotify )
  required_plugins.each do |plugin|
    system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
  end

  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder ".", "/vagrant", fsnotify: true
  
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 4200, host: 4200
  config.vm.network "forwarded_port", guest: 5432, host: 5432

  config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
      vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end 

  config.vm.provision "shell", path: "./docker.sh"
  config.vm.provision "shell", path: "./docker_compose.sh"
  config.vm.provision "shell", path: "./node.sh"
  config.vm.provision "shell", path: "./npm.sh"
  config.vm.provision "shell", path: "./go.sh"
end

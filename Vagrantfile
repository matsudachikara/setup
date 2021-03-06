# -*- mode: ruby -*-
# vi: set ft=ruby :

# 設定用変数
pc_user = "matsuda.chikara"
vagrant_user = "matsuda"
vagrant_password = ""

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "matsudachikara/amazonlinux2"
  config.disksize.size = '100GB'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 3020, host: 3020
  config.vm.network :forwarded_port, guest: 3030, host: 3030
  config.vm.network :forwarded_port, guest: 3035, host: 3035
  config.vm.network :forwarded_port, guest: 4000, host: 4000
  config.vm.network :forwarded_port, guest: 4040, host: 4040
  config.vm.network :forwarded_port, guest: 5000, host: 5000
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # Mac用
  config.vm.synced_folder "../../../project/", "/project", type: "nfs"
  # それ以外用
  # config.vm.synced_folder "../../../projects/", "/projects"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "3072"
  end
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

  # config.vm.provision :host_shell do |host_shell|
  #   host_shell.inline = "scp -P 2222 -i .vagrant/machines/default/virtualbox/private_key -o 'StrictHostKeyChecking no' /Users/#{pc_user}/.ssh/id_rsa.pub vagrant@127.0.0.1:/home/vagrant/.ssh"
  # end

  config.vm.provision :file, source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/id_rsa.pub"

  config.vm.provision :shell, name: "setup_user" do |s|
    s.path = "./setup/scripts/setup_user.sh"
    s.args = [vagrant_user, vagrant_password]
  end

  config.vm.provision :shell, name: "setup_samba" do |s|
    s.path = "./setup/scripts/setup_samba.sh"
    s.args = [vagrant_user, vagrant_password]
  end

  # 初回起動後コメント外して実行してください
  # vagrantユーザーを削除、ホームフォルダは一応残す
  # config.vm.provision :shell, name: "delete_vagrant_user" do |s|
  #   s.inline = "sudo userdel vagrant"
  # end

  # 初回起動用設定
  config.ssh.private_key_path = "./ssh/insecure_private_key"

  # 初回起動（provisioning後）以降使える設定
  # config.ssh.guest_port = 2222
  # config.ssh.username = vagrant_user
  # config.ssh.host = "127.0.0.1"
  # config.ssh.private_key_path = "/Users/#{pc_user}/.ssh/id_rsa"
  # config.ssh.forward_agent = true

end

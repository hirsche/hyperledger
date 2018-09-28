# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/ubuntu-16.04"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  #config.vm.network "forwarded_port", guest: 8080, host: 8080
  for i in 1024..9000
    config.vm.network :forwarded_port, guest: i, host: i
  end

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.network "public_network", ip: '172.27.241.229'

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.  
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = true
  config.hostmanager.include_offline = true
  config.vm.define 'interlace.chain' do |node|
    node.vm.hostname = 'interlace.chain'
    node.hostmanager.aliases = %w(interlace.chain)
    for i in 1024..9000
      node.vm.network :forwarded_port, guest: i, host: i
    end
  end
  
  # hostmanager provisioner
  config.vm.provision :hostmanager

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #config.vm.synced_folder "./InterlaceBlockchain", "/home/vagrant/InterlaceBlockchain",
  #                        smb_username: "interlace", smb_password: "1nt3rlac3",
  #                        type: "smb", mount_options: ["username=interlace","password=1nt3rlac3"]

  config.vm.synced_folder ".", "/vagrant", 
  	smb_username: "interlace", smb_password: "1nt3rlac3",
	type: "smb", mount_options: ["username=interlace","password=1nt3rlac3"]
  
  # Provider-specific configuration so you can fine-tune various
  config.vm.provider "hyperv" do |hv|
    # Display the hyperv when booting the machine
    #hv.gui = true
    #   # Customize the amount of memory on the VM:
    hv.memory = 2048 #8192
    hv.cpus = 2
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end
  
  # copy install
  config.vm.provision "file", source: "./scripts/install-global.sh", destination: "/home/vagrant/install/install-global.sh"
  config.vm.provision "file", source: "./scripts/install-main-user.sh", destination: "/home/vagrant/install/install-main-user.sh"
  config.vm.provision "file", source: "./scripts/runPlayground.sh", destination: "/home/vagrant/runPlayground.sh"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    chmod a+x /home/vagrant/install/* 
    chmod a+x /home/vagrant/runPlayground.sh 
    chown vagrant.vagrant /home/vagrant/install/*
    chown vagrant.vagrant /home/vagrant/runPlayground.sh
    
    #install as root
    /home/vagrant/install/install-global.sh
    
    #install as vagrant user
    su -c "cd ~ && ./install/install-main-user.sh" -s /bin/bash vagrant
  SHELL
end

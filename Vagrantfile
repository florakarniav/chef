# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

#.configure(VAGRANTFILE:API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
 #
 # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"

Vagrant::Config.run do |config|



  app_servers = { :app1 => '192.168.55.55',
                 :app2 => '192.168.60.60'
               }


 config.vm.network :hostonly, "192.168.30.30"

 config.vm.host_name = "www.example.vm"

  #config.vm.share_folder "v-data", "/srv/data", "../data", :nfs => true, :create => "true"
  #config.vm.share_folder "v-site", "/srv/site", "/example", :nfs => true, :create => "true"

config.vm.define :mine do |mine_config|

  mine_config.vm.box = "opscode-ubuntu-12.04"
  #tomcat_config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
  #tomcat_config.vm.provision :shell, :inline => "curl -L https://www.opscode.com/chef/install.sh | bash"
  mine_config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box"
  #tomcat_config.omnibus.chef_version = :latest
  #mine_config.vm.network :hostonly, "10.0.0.100" #"192.168.1.10"
  #mine_config.vm.forward_port 80, 8888


  mine_config.vm.provision :chef_client do |chef|


    chef.chef_server_url = "https://api.opscode.com/organizations/florakarniav"
    chef.validation_key_path = "./.chef/florakarniav-validator.pem"
    chef.validation_client_name = "florakarniav-validator"
    chef.node_name = "flora_vmine0"



  end


 end

 config.vm.define :tomcat do |simple_config|


  simple_config.vm.box = "opscode-ubuntu-12.04"
  #sql_config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
  #sql_config.vm.provision :shell, :inline => "curl -L https://www.opscode.com/chef/install.sh | bash"
  simple_config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box"
  #sql_config.omnibus.chef_version = :latest
  #simple_config.vm.network :hostonly, "10.0.0.200" #"192.168.1.20"
  simple_config.vm.forward_port 1337, 1337

  simple_config.vm.provision :chef_client do |chef|

    chef.chef_server_url = "https://api.opscode.com/organizations/florakarniav"
    chef.validation_key_path = "./.chef/florakarniav-validator.pem"
    chef.validation_client_name = "florakarniav-validator"
    chef.node_name = "tom_vm"
    #chef.add_role "webserver"

  end

 end
 

 app_servers.each do |app_server_name, app_server_ip|
    
    config.vm.define app_server_name do |app_config|

      app_config.vm.box = "opscode-ubuntu-12.04"
     
      
      app_config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box"

      app_config.vm.host_name = app_server_name.to_s
      app_config.vm.network :hostonly, app_server_ip
  

      app_config.vm.provision :chef_client do |chef|

        chef.chef_server_url = "https://api.opscode.com/organizations/florakarniav"
        chef.validation_key_path = "./.chef/florakarniav-validator.pem"
        chef.validation_client_name = "florakarniav-validator"
        chef.add_role "nodeapps_server"

      end

  end

 end





end

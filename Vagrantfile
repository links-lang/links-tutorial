Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.network "forwarded_port", guest: 8080, host: 8081

  config.vm.provision "shell", privileged: false, path: "setup.sh"
  
  config.vm.network "private_network", ip: "192.168.30.10"
  
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2000"
     vb.cpus   = 1
#     vb.gui    = true
  end

  
end

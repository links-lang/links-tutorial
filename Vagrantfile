Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "forwarded_port", guest: 8080, host: 8081

  config.vm.provision "shell", privileged: false, path: "setup.sh"

end

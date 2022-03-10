Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |vb|
      vb.memory = "612"
    end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y apache2
  SHELL
end

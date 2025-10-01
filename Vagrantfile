Vagrant.configure("2") do |config| 
  config.disksize.size = "40GB"
  config.vm.box = "ubuntu/jammy64"

  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |vb|
    vb.name   = "monitoring-vm"
    vb.memory = 4096
    vb.cpus   = 2
  end

end

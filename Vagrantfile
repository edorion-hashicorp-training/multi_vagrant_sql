Vagrant.configure("2") do |config|

  config.vm.define vm_name="mysql" do |node|
    node.vm.box = "alvaro/xenial64"
    node.vm.hostname = vm_name
    node..vm.network "private_network", ip: "172.28.128.10"
    config.vm.provision "provisioner script", type: "shell", path: "bootstrapsql.sh"
    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end    
  end

  (1..2).each do |i|
    config.vm.define vm_name="web#{i}" do |node|
      node.vm.box = "edorion/nginx64"
      node.vm.hostname = vm_name
    end
    config.vm.network "private_network", type: "dhcp"
    config.vm.provision "provisioner script", type: "shell", path: "bootstrap.sh"
    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
  end


end

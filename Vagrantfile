Vagrant.configure("2") do |config|

  config.vm.define sql_vm_name="mysql" do |node|
    node.vm.box = "edorion/bionic64"
    node.vm.hostname = sql_vm_name
    node.vm.provision "provisioner script", type: "shell", path: "bootstrapsql.sh"
    node.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end    
  end

  (1..2).each do |i|
    config.vm.define web_vm_name="web#{i}" do |node|
      node.vm.box = "edorion/nginx64"
      node.vm.hostname = web_vm_name
    end
    config.vm.network "private_network", type: "dhcp"
    config.vm.provision "provisioner script", type: "shell", path: "bootstrap.sh"
    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
  end
end

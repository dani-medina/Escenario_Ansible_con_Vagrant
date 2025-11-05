# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/bookworm64"


  config.vm.define "CentralNode" do |central|
    central.vm.hostname = "CentralNode"
    central.vm.network "private_network", ip: "172.16.4.20", virtualbox__intnet: "WORK-NET"

    central.vm.provider "virtualbox" do |vb|
      vb.name = "CentralNode"
      vb.memory = 756
      vb.cpus = 1
    end

    # Provisioner externo: genera la clave SSH de root
    central.vm.provision "shell", name: "xera a chave para root", path: "scripts/generate_root_key.sh"

    # Exporta la clave pública para compartirla con los demás nodos
    central.vm.provision "shell", name: "exporta a chave pública", path: "scripts/export_public_key.sh"
  end

  #Nodos xestionados
  (1..10).each do |i|
    


    config.vm.define "Node#{i}" do |node|
      node.vm.hostname = "Node#{i}"
      node.vm.network "private_network", ip: "172.16.4.#{100 + i}", virtualbox__intnet: "WORK-NET"

      node.vm.provider "virtualbox" do |vb|
        vb.name = "Node#{i}"
        vb.memory = 512
        vb.cpus = 1
      end

      # Copia la clave pública del CentralNode al root de cada nodo
      node.vm.provision "shell", name:"Copia a chave pública de CN ao root", path: "scripts/import_centralnode_key.sh"
    end
  end
end


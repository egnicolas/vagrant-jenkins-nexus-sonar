Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true 
  config.hostmanager.manage_host = true

  ### Jenkins VM ###
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "bento/ubuntu-20.04"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", type: "dhcp"

    jenkins.vm.provider "vmware_desktop" do |vb|
      vb.gui = false
      vb.vmx["numvcpus"] = 2
      vb.vmx["cpuid.coresPerSocket"] = 1
      vb.memory = 4096
    end

    jenkins.vm.provision "shell", path: "jenkins.sh"
  end

### Nexus VM ###
config.vm.define "nexus" do |nexus|
  nexus.vm.box = "bento/centos-stream-9"
  nexus.vm.hostname = "nexus"
  nexus.vm.network "private_network", type: "dhcp"
  nexus.vm.network "forwarded_port", guest: 8081, host: 8081

  nexus.vm.provider "vmware_desktop" do |vb|
    vb.gui = false
    # vCPU et cores optimisés pour Mac 8 coeurs
    vb.vmx["numvcpus"] = 2
    vb.vmx["cpuid.coresPerSocket"] = 1
    vb.memory = 4096
  end

  # Provisioning via script Docker-ready
  nexus.vm.provision "shell", path: "nexus-setup.sh"
end

  ### SonarQube VM ###
  config.vm.define "sonar" do |sonar|
    sonar.vm.box = "bento/ubuntu-20.04"
    sonar.vm.hostname = "sonar"
    sonar.vm.network "private_network", type: "dhcp"

    sonar.vm.provider "vmware_desktop" do |vb|
      vb.gui = false
      vb.vmx["numvcpus"] = 2
      vb.vmx["cpuid.coresPerSocket"] = 1
      vb.memory = 4096
    end

    sonar.vm.provision "shell", path: "sonar-setup.sh"
  end
end
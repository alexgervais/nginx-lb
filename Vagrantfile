Vagrant::Config.run do |config|
  config.vm.define :lb1 do |lb_config|
    lb_config.vm.network :hostonly, "33.33.33.10"
    lb_config.vm.box = "squeeze64"
    lb_config.vm.forward_port(80, 8000)
    lb_config.vm.host_name = "lb1.local"
    lb_config.ssh.timeout = 300
    lb_config.ssh.max_tries = 300
    lb_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/vagrant-manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "lb1.pp"
    end
  end
  config.vm.define :lb2 do |lb_config|
    lb_config.vm.network :hostonly, "33.33.33.11"
    lb_config.vm.box = "squeeze64"
    lb_config.vm.host_name = "lb2.local"
    lb_config.ssh.timeout = 300
    lb_config.ssh.max_tries = 300
    lb_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/vagrant-manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file = "lb2.pp"
    end
  end
end

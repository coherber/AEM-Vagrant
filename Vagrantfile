Vagrant.configure("2") do |config|
  config.vm.box = "centos-7.2-x64.box"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.2_chef-provisionerless.box"

	config.vm.provision :chef_solo do |chef|
        chef.add_recipe "yum"
        chef.add_recipe "java"
        chef.json = {
            :java => {           
                :jdk_version => "8"          
            }
            
        }
		end
# Open ports
  config.vm.network "forwarded_port", guest: 80, host: 80
  #config.vm.network "forwarded_port", guest:4502, host: 4502
  config.vm.network "forwarded_port", guest:4503, host: 4503
  #open debug ports
  #config.vm.network "forwarded_port", guest:10000, host: 10000
  config.vm.network "forwarded_port", guest:8000, host: 8000
  config.vm.synced_folder 'dependencies','/dependencies' 


  config.vm.network :private_network, :ip => "192.168.2.111", :netmask => "255.255.255.0"
  config.vm.hostname = "aem-live.com"
  config.hostsupdater.aliases = [ "aem-live.com" ]
  #shell scripts for provisioning
  config.vm.provision "shell", path: "./scripts/setup-aem.sh"
  config.vm.provision "shell", path: "./scripts/start-aem.sh", run: "always"
  
  config.vm.synced_folder 'dependencies','/dependencies'  
  config.vm.define "AEM Vagrant"



# Execute scripts to shut down AEM instances properly.
  #config.trigger.before :halt do |trigger|
  #  run_remote  "bash ./scripts/stop-aem.sh"
  #  end


  config.omnibus.chef_version = "14.12.9"
    # Chef Solo provisioner
        
    config.vm.provider "virtualbox" do |vb|
            vb.memory = "6000"
            vb.name = "AEM Vagrant"
        end
    
end

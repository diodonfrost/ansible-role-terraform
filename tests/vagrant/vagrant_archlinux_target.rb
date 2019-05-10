Vagrant.configure(2) do |config|
  config.vm.provision "shell", inline: <<-SHELL
     pacman --noconfirm  -Syu ansible
  SHELL
end

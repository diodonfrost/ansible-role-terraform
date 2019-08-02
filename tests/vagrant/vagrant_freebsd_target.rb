Vagrant.configure(2) do |config|
  config.vm.provision "shell", inline: <<-SHELL
    pkg install -y ncurses python gtar unzip
    pkg install -y py27-ansible
    ln -s /usr/local/bin/python2.7 /usr/bin/python
    ln -s /usr/local/bin/ansible-playbook* /usr/local/bin/ansible-playbook
  SHELL
end

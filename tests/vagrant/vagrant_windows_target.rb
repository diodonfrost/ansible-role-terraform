Vagrant.configure("2") do |c|
  c.vm.provision :shell, path: "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
  c.vm.provision :shell, path: "https://chocolatey.org/install.ps1"
end

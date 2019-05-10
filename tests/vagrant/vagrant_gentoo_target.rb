Vagrant.configure(2) do |config|
  config.vm.provision "shell", inline: <<-SHELL
    emerge --sync
    echo 'USE=-bindist' >> /etc/portage/make.conf
    echo 'dev-lang/python sqlite' >> /etc/portage/package.use/python
    emerge net-misc/openssh app-admin/sudo app-admin/ansible app-portage/gentoolkit
    # Enable features on specific package for java install
    echo 'x11-libs/cairo X' > /etc/portage/package.use/cairo
    echo 'app-text/ghostscript-gpl cups' > /etc/portage/package.use/ghostscript-gpl
  SHELL
end

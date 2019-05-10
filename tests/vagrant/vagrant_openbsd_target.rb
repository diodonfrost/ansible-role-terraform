Vagrant.configure(2) do |config|
  config.vm.provision "shell", inline: <<-SHELL
     OPENBSD_VERSION=`uname -a | awk -F " " '{print $3}'`
     wget -P /tmp https://ftp.openbsd.org/pub/OpenBSD/${OPENBSD_VERSION}/amd64/xbase64.tgz
     cd / && tar xzvphf /tmp/xbase64.tgz
     pkg_add -z ansible
     ln -s /usr/local/bin/python2.7 /usr/bin/python
  SHELL
end

Vagrant.configure(2) do |config|
  config.vm.provision "shell", inline: <<-SHELL
    pkg install -r gcc
    wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz
    tar zxvf Python-3.7.1.tgz && cd Python-3.7.1
    ./configure
    make
    make install
  SHELL
end
